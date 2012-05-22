/*
 * Copyright 2005-2010 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.protocol.actions.reviewcomments;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.kuali.kra.common.committee.meeting.CommitteeScheduleMinute;
import org.kuali.kra.common.committee.meeting.MinuteEntryType;
import org.kuali.kra.infrastructure.KraServiceLocator;

public abstract class ReviewCommentsBean  implements Serializable {


    /**
     * Comment for <code>serialVersionUID</code>
     */
    private static final long serialVersionUID = 994429171132365761L;

    private String errorPropertyKey;
    
    private CommitteeScheduleMinute newReviewComment;
    private List<CommitteeScheduleMinute> reviewComments;
    private List<CommitteeScheduleMinute> deletedReviewComments;
    // flag to hide reviewer name for this bean.
    private boolean hideReviewerName;
    /**
     * Constructs a ReviewerCommentsBean.
     */
    public ReviewCommentsBean(String errorPropertyKey) {
        this.errorPropertyKey = errorPropertyKey + ".reviewCommentsBean";
        
        this.newReviewComment = new CommitteeScheduleMinute();
        this.newReviewComment.setMinuteEntryTypeCode(MinuteEntryType.PROTOCOL);
        this.reviewComments = new ArrayList<CommitteeScheduleMinute>();
        this.deletedReviewComments = new ArrayList<CommitteeScheduleMinute>();
    }

    public String getErrorPropertyName() {
        return errorPropertyKey;
    }
    
    public CommitteeScheduleMinute getNewReviewComment() {
        return newReviewComment;
    }
    
    public void setNewReviewComment(CommitteeScheduleMinute newReviewComment) {
        this.newReviewComment = newReviewComment;
    }
    
    public List<CommitteeScheduleMinute> getReviewComments() {
        return reviewComments;
    }
    
    public void setReviewComments(List<CommitteeScheduleMinute> reviewComments) {
        this.reviewComments = reviewComments;
        
// TODO *********commented the code below during IACUC refactoring*********         
//        this.setHideReviewerName(getReviewCommentsService().setHideReviewerName(this.reviewComments));            

    }
    
    public List<CommitteeScheduleMinute> getDeletedReviewComments() {
        return deletedReviewComments;
    }
    
    public void setDeletedReviewComments(List<CommitteeScheduleMinute> deletedReviewComments) {
        this.deletedReviewComments = deletedReviewComments;
    }

    public boolean isHideReviewerName() {
        return hideReviewerName;
    }

    public void setHideReviewerName(boolean hideReviewerName) {
        this.hideReviewerName = hideReviewerName;
    }
    
    private ReviewCommentsService getReviewCommentsService() {
        return KraServiceLocator.getService(ReviewCommentsService.class);
    }


}
