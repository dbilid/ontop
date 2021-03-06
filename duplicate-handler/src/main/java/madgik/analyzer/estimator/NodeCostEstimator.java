/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package madgik.analyzer.estimator;

import madgik.analyzer.decomposer.dag.Node;
import madgik.analyzer.decomposer.query.Column;
import madgik.analyzer.decomposer.query.NonUnaryWhereCondition;
import madgik.analyzer.decomposer.query.Operand;
import madgik.analyzer.decomposer.query.Selection;
import madgik.analyzer.estimator.metadata.Metadata;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

import static madgik.analyzer.estimator.metadata.Metadata.NETWORK_RATE;

/**
 * @author jim
 */
public class NodeCostEstimator {

    private static final Logger log =LoggerFactory.getLogger(NodeCostEstimator.class);

    public static Double getCostForOperator(Node o) {
        if (o.getOpCode() == Node.JOIN) {
        	if(o.getChildren().size()==1){
        		return 0.0;
        	}
            try {
                
                return estimateJoin(o, o.getChildAt(0), o.getChildAt(1));
            } catch (Exception ex) {
                log.debug("Cannot get cost for join op " + o.toString() + ". Assuming dummy cost");
                System.out.println("Cannot get cost for join op " + o.toString() + ". Assuming dummy cost");
                return 1.0;
            }
        } else if (o.getOpCode() == Node.UNION) {
            try {
                return estimateUnion(o);
            } catch (Exception ex) {
                log.error("Cannot get cost for union op " + o.toString() + ". Assuming dummy cost");
                return 1.0;
            }
        } else if (o.getOpCode() == Node.PROJECT) {
            return estimateProjection(o);
        } else if (o.getOpCode() == Node.BASEPROJECT) {
        	try {
        	if(o.getFirstParent().getFirstParent().getOpCode()!=Node.SELECT){
            return estimateBaseProjection(o);
        	}
        	else{
        		//we will return the cost in estimate filter
        		return estimateProjection(o);
        	}
        	 } catch (Exception ex) {
                 log.error("Cannot get cost for project op " + o.toString() + ". Assuming dummy cost");
                 return 1.0;
             }
        } else if (o.getOpCode() == Node.SELECT) {
        	try {
            return estimateFilter(o);
        	 } catch (Exception ex) {
                 log.error("Cannot get cost for select op " + o.toString() + ". Assuming dummy cost");
                 return 1.0;
             }
        } else {
            return 0.0;
        }
    }
    private static Double estimateBaseProjection(Node o) {
    	return 0.0;
    	//double a=indexCostCreation(o.getChildAt(0));
    	//return (o.getChildAt(0).getNodeInfo().outputRelSize() / Metadata.PAGE_SIZE) * Metadata.PAGE_IO_TIME;
	}
	//private final NodeSelectivityEstimator selEstimator;

    /*constructor*/
    public NodeCostEstimator() {
        //this.selEstimator = new NodeSelectivityEstimator(schema);
    }

    /*interface methods*/
    public static double estimateBase(Node n) {

        return 0;
    }

    public static double estimateProjection(Node n) {

        return 0;
    }

    public static double estimateFilter(Node n) {
    	return 0;
    	//if it's not on base relation return 0
    /*	if(!n.getChildAt(0).getChildren().isEmpty() && n.getChildAt(0).getChildAt(0).getOpCode()!=Node.BASEPROJECT){
    		return 0;
    	}
    	else{
    		boolean indexUsage=false;
    		Selection p=(Selection)n.getObject();
    		for(Operand o:p.getOperands()){
    			if(o instanceof NonUnaryWhereCondition){
    				NonUnaryWhereCondition nuwc=(NonUnaryWhereCondition)o;
    				if(nuwc.getOperator().equals("=")){
    					Column c=nuwc.getAllColumnRefs().get(0);
    					//if(IndexedColumns.contains(c)){
    					//	indexUsage=true;
    					//	break;
    					//}
    				}
    			}
    		}
    		if(indexUsage){
    			//cost is the no of pages contained in the result
    			Node result=n.getFirstParent();
    			 return (n.getNodeInfo().outputRelSize() / Metadata.PAGE_SIZE) * Metadata.PAGE_IO_TIME;
    		}
    		else{
    			Node base=n.getChildAt(0);
    			//cost is all the no of pages in the relation
    			if(!base.getChildren().isEmpty()){
    				base=n.getChildAt(0).getChildAt(0).getChildAt(0);
    			}
    			return (base.getNodeInfo().outputRelSize() / Metadata.PAGE_SIZE) * Metadata.PAGE_IO_TIME;
    			
    		}
    	}
        */
    }

    public static double estimateJoin(Node o, Node left, Node right)
        throws Exception {
    	NonUnaryWhereCondition nuwc = (NonUnaryWhereCondition) o.getObject();
    	if(right.getDescendantBaseTables().size()>1){
    		//bushy join
    		return 1000000.0;
    	}
    	
    	//if(left.getDescendantBaseTables().contains("alias0")){
    		//bushy join
    	///	return 1000000.0;
    	//}
    	double leftScanCost=0.0;
    	if(left.getDescendantBaseTables().size()==1){
    		leftScanCost=estimateLeftScanCost(left);
    	}

        double leftRelTuples = left.getNodeInfo().getNumberOfTuples();
        double leftRelSize = left.getNodeInfo().outputRelSize();
        double rightRelTuples = right.getNodeInfo().getNumberOfTuples();
        double rightRelSize = right.getNodeInfo().outputRelSize();
        
        if(leftRelTuples<0.5||rightRelTuples<0.5){
        	return 0.0+leftScanCost;
        }

        //        double childrenMaxResponseTime = Math.max(leftRelSize, rightRelSize);
        double responseTime = localJoinProcessingTime(leftRelTuples, leftRelSize, rightRelTuples,
            rightRelSize);// + childrenMaxResponseTime;
        //this.planInfo.get(n.getHashId()).setResponseTimeEstimation(responseTime);
        if (Double.isNaN(responseTime)) {
            throw new Exception("NaN");
        }
        //to fix index usage
        if(((left.getDescendantBaseTables().size()==1&&left.getDescendantBaseTables().contains("alias1"))||nuwc.getLeftOp().toString().contains("cmpLongName")&&left.getDescendantBaseTables().size()>1)||nuwc.getRightOp().toString().contains("wlbDrillingOperator")||nuwc.getRightOp().toString().contains("prlName")){
        	responseTime=50*responseTime;
        }
      
        return responseTime+leftScanCost;
    }

    private static double estimateLeftScanCost(Node left) {
		if(left.getChildAt(0).getOpCode() == Node.BASEPROJECT){
			return (left.getChildAt(0).getChildAt(0).getNodeInfo().outputRelSize() / Metadata.PAGE_SIZE) * Metadata.PAGE_IO_TIME;
		}
		else{
			return estimateLeftScanCost(left.getChildAt(0).getChildAt(0));
		}
	}
	public static double estimateRepartition(Node n, Column partitioningCol) {
        //this.planInfo.put(n.getHashId(), new NodeInfo());
        //this.selEstimator.estimateRepartition(n, partitioningCol, child);

        try {
            double relTuples = n.getNodeInfo().getNumberOfTuples();
            double relSize = n.getNodeInfo().outputRelSize();

            double responseTime = repartition(relSize, Metadata.NUMBER_OF_VIRTUAL_MACHINES,
                Metadata.NUMBER_OF_VIRTUAL_MACHINES);
            responseTime += localHashingTime(relTuples, relSize);
            responseTime += localUnionTime(relSize);

            //this.planInfo.get(n.getHashId()).setResponseTimeEstimation(responseTime);
            if (Double.isNaN(responseTime)) {
                throw new Exception("NaN");
            }
            return responseTime;

        } catch (Exception ex) {
            log.debug("Cannot get cost for repartition op " + partitioningCol.getName() + ". Assuming dummy cost");
            return 1.5;

        }

    }

    public static double estimateReplication(double data, int replicas) {
        return ((data / Metadata.PAGE_SIZE) * Metadata.PAGE_IO_TIME) * replicas + replicas * (data
            / NETWORK_RATE);
    }

    public static double estimateUnion(Node n) {
        //this.planInfo.put(n.getHashId(), new NodeInfo());
        //this.selEstimator.estimateUnion(n);


        List<Node> children = n.getChildren();

        double totalResponseTimeCost = 0;
        double childResponseTimeCost = 0;
        for (Node cn : children) {
            childResponseTimeCost = cn.getNodeInfo().getResponseTimeEstimation();
            totalResponseTimeCost += childResponseTimeCost;
        }

        //this.planInfo.get(n.getHashId()).setResponseTimeEstimation(maxResponseTimeCost);

        return totalResponseTimeCost;
    }

    /*private-helper methods*/
    //estimation model      
    private static double repartition(double relSize, int fromNumOfPartitions,
        int toNumOfPartitions) {
        return (relSize * (1 / fromNumOfPartitions)) / (NETWORK_RATE / fromNumOfPartitions);
    }

    private static double localUnionTime(double dataPortion) {
        return (dataPortion / Metadata.PAGE_SIZE) * Metadata.PAGE_IO_TIME;
    }

    //TODO: relSize as argument?? 10 mb/sec => 1 tuple->8bytes(for numeric) thus: (10*2^20)/8 tuples/sec = 1310720 tuples/sec thus for 1 tuple : 0.000000763 sec
    private static double localHashingTime(double relTuples, double relSize) {
        return relTuples
            * 0.000034;        //time for a tuple hushing: 0.000034 sec (disk io + cpu time included)
    }

    private static double localJoinProcessingTime(double leftRelTuples, double leftRelSize,
        double rightRelTuples, double rightRelSize) {
    	if(leftRelTuples<1||rightRelTuples<1){
    		return 0.0;
    	}
       // double cpuLocalCost, diskLocalCost;
            //smallRelTuples = leftRelTuples, bigRelTuples = rightRelTuples,
            //smallRelSize = leftRelSize, bigRelSize = rightRelSize;

     /*   if (rightRelTuples < leftRelTuples) {
            smallRelTuples = rightRelTuples;
            smallRelSize = rightRelSize;
            bigRelSize = leftRelSize;
            bigRelTuples = leftRelTuples;
        }*/
       
        //disk cost
        //->index construcrion, scanning the smallest tule table
        //double diskLeftRelIndexConstruction =
        //    (leftRelSize / Metadata.PAGE_SIZE) * Metadata.PAGE_IO_TIME;
        //double diskRightRelScan = (rightRelSize / Metadata.PAGE_SIZE) * Metadata.PAGE_IO_TIME;
        double joinOpCost=leftRelTuples*Math.log(rightRelTuples)* Metadata.PAGE_IO_TIME * Metadata.INDEX_UTILIZATION;
        //double noOfPages=leftRelSize/Metadata.PAGE_SIZE;
        //diskLocalCost = diskSmallRelIndexConstruction + noOfPages*diskBigRelScan;
        //diskLocalCost = diskLeftRelIndexConstruction + diskRightRelScan;
        //cpu cost
       // double leftRelTuples_log10 = Math.log10(leftRelTuples);
        //double localIndexConstruction =
        //    leftRelTuples * leftRelTuples_log10 * Metadata.CPU_CYCLE_TIME;
        // double localComparisons = rightRelTuples * leftRelTuples_log10 * Metadata.CPU_CYCLE_TIME;
        //cpuLocalCost = localIndexConstruction + localComparisons;

        return joinOpCost;
    }

	public static boolean isProfitableToMat(Node e, int used, double cost) {
		if(used>1){
			
			double size=e.getNodeInfo().outputRelSize();
			double writeRel = (size / Metadata.PAGE_SIZE) * Metadata.PAGE_IO_TIME;
			if((2*writeRel)<(cost*used)){
				//System.out.println("true");
				return true;
			}
	        
		}
		return false;
	}

	public static double getWriteCost(Node e) {
		try{
		double size=e.getNodeInfo().outputRelSize();
		return (size / Metadata.PAGE_SIZE) * Metadata.PAGE_IO_TIME_SCAN;
		}
		catch(Exception ex){
			log.error("Cannot get Write Cost for Table "+e.toString()+" Retruning Dummy Cost");
			return 10;
		}
	}

	public static double getReadCost(Node e) {
		try{
		double size=e.getNodeInfo().outputRelSize();
		return (size / Metadata.PAGE_SIZE) * Metadata.PAGE_IO_TIME_SCAN;
		}
		catch(Exception ex){
			log.error("Cannot get Read Cost for Table "+e.toString()+" Retruning Dummy Cost");
			return 10;
		}
	}
	
	private static double indexCostCreation(Node e){
		try{
		double size=e.getNodeInfo().outputRelSize();
		double card=e.getNodeInfo().getNumberOfTuples();
		return (size/Metadata.PAGE_SIZE) * Math.log(card)* Metadata.PAGE_IO_TIME;
	}
	catch(Exception ex){
		log.error("Cannot get Index Creation Cost for Table "+e.toString()+" Retruning Dummy Cost");
		return 10;
	}
	}
}
