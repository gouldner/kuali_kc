/*
 * Copyright 2005-2013 The Kuali Foundation
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
package org.kuali.kra.iacuc;

import org.kuali.kra.bo.KraPersistableBusinessObjectBase;
import org.kuali.kra.bo.PersonTraining;
import org.kuali.kra.iacuc.procedures.IacucProcedure;

public class IacucPersonTraining extends KraPersistableBusinessObjectBase { 
    
    private static final long serialVersionUID = 1L;

    private Integer iacucPersonTrainingId; 
    private Integer personTrainingId; 
    private String personId; 
    private Integer speciesCode; 
    private Integer procedureCode; 
    
    private PersonTraining personTraining; 
    private IacucSpecies iacucSpecies; 
    private IacucProcedure iacucProcedure; 
    
    public IacucPersonTraining() { 

    } 
    
    public Integer getIacucPersonTrainingId() {
        return iacucPersonTrainingId;
    }

    public void setIacucPersonTrainingId(Integer iacucPersonTrainingId) {
        this.iacucPersonTrainingId = iacucPersonTrainingId;
    }

    public Integer getPersonTrainingId() {
        return personTrainingId;
    }

    public void setPersonTrainingId(Integer personTrainingId) {
        this.personTrainingId = personTrainingId;
    }

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }

    public Integer getSpeciesCode() {
        return speciesCode;
    }

    public void setSpeciesCode(Integer speciesCode) {
        this.speciesCode = speciesCode;
    }

    public Integer getProcedureCode() {
        return procedureCode;
    }

    public void setProcedureCode(Integer procedureCode) {
        this.procedureCode = procedureCode;
    }

    public PersonTraining getPersonTraining() {
        return personTraining;
    }

    public void setPersonTraining(PersonTraining personTraining) {
        this.personTraining = personTraining;
    }

    public IacucSpecies getIacucSpecies() {
        return iacucSpecies;
    }

    public void setIacucSpecies(IacucSpecies iacucSpecies) {
        this.iacucSpecies = iacucSpecies;
    }

    public IacucProcedure getIacucProcedure() {
        return iacucProcedure;
    }

    public void setIacucProcedure(IacucProcedure iacucProcedure) {
        this.iacucProcedure = iacucProcedure;
    }
    
}