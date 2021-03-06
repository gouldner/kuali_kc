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
package org.easyproposal424.service;

import java.util.Collection;
import java.util.HashMap;

import org.kuali.kra.bo.Organization;
import org.kuali.kra.bo.Sponsor;
import org.kuali.kra.bo.Unit;
import org.kuali.rice.kim.api.identity.Person;


public interface EasyProposalGeneralLookupService {

    public abstract Collection<Unit> findUnit(String matchString);
    
    public abstract Collection<Unit> findUnit(String unitNumber, String unitName);
    
    /**
     * find Kim Person object that match lastName, firstName and userName if provided.
     * Accepts * and % wildcarding
     * 
     * Search is case insensitive
     * 
     * 
     * @param lastName  the lastName of the KIM person
     * @param firstName the firstName of the KIM person
     * @param userName the principalName of the principal linked to the KIM person.
     * @return A collection of Person objects that match the parameters.
     * 
     */
    public abstract Collection<Person> findPerson(String lastName, String firstName, String userName);

    /**
     * @param userId PrincipalId of user must be provided for result
     * @return       List of Units for which the user has the Create Proposal Development permission 
     */
    public abstract Collection<Unit> findUserAuthorizedUnits(String userid);
    
    /**
     * @param searchValue   Value to be searched on.  Currently the code just uses this on sponsor name search
     *                      * or % can be passed in as a wildcard.   Future implementation might use more sophisticated
     *                      search techniques which is why only searchValue was provided in interface
     * @return              List of sponsors based on search value passed in.   
     */
    public abstract Collection<Sponsor> findSponsor(String sponsorName);
    public abstract Collection<String> sponsorQuickList();
    
    /**
     * @param searchValue   Value to be searched on.  Currently the code just uses this on Organization Name.
     *                      * or % can be passed in as a wildcard.   Future implementation might use more sophisticated
     *                      search techniques which is why only searchValue was provided in interface
     * @return              List of Organizations based on search value passed in.   
     */
    public abstract Collection<Organization> findOrganization(String orgName, String orgAddress);

}