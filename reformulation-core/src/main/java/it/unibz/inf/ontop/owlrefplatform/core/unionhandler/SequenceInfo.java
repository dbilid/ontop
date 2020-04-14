package it.unibz.inf.ontop.owlrefplatform.core.unionhandler;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import it.unibz.inf.ontop.model.Term;

public class SequenceInfo {
	
	private Node startingNode;
	private LinkedList<Integer> sequence;
	private List<Term> projection;

	
	public SequenceInfo(Node startingNode, List<Term> list) {
		super();
		this.startingNode = startingNode;
		this.sequence=new LinkedList<Integer>();
		this.projection=list;
	}
	
	public void addToSequence(int tMappingID, int mappingID) {
		this.sequence.add(tMappingID);
		this.sequence.add(mappingID);
	}

	public void removeFromSequence() {
		this.sequence.removeLast();
		this.sequence.removeLast();
		
	}
	
	public int getStartPos() {
		return startingNode.getStartPos();
	}

	public int getAtomcount() {
		return startingNode.getAtomcount();
	}

	public Iterator<Integer> nextSequence() {
		return sequence.iterator();
		
	}
	
	public long getStartingNodeID() {
		return startingNode.getObject();
		
	}

	public List<Term> getProjection() {
		return projection;
	}

	@Override
	public String toString() {
		return "SequenceInfo [startingNode=" + startingNode + ", sequence=" + sequence + ", projection=" + projection
				+ "]";
	}
	
	

}