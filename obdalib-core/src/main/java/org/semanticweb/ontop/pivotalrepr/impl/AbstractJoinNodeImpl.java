package org.semanticweb.ontop.pivotalrepr.impl;

import org.semanticweb.ontop.model.BooleanExpression;
import org.semanticweb.ontop.pivotalrepr.AbstractJoinNode;

public abstract class AbstractJoinNodeImpl extends FilterNodeImpl implements AbstractJoinNode {
    protected AbstractJoinNodeImpl() {
        super();
    }

    protected AbstractJoinNodeImpl(BooleanExpression joinCondition) {
        super(joinCondition);
    }

}
