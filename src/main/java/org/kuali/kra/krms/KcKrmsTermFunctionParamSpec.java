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
package org.kuali.kra.krms;

import org.kuali.kra.bo.KraPersistableBusinessObjectBase;

public class KcKrmsTermFunctionParamSpec extends KraPersistableBusinessObjectBase {

    /**
     * Comment for <code>serialVersionUID</code>
     */
    private static final long serialVersionUID = 5500796091484340802L;
    private Long kcKrmsTermFunctionParamSpecId;
    private Long kcKrmsTermFunctionId;
    private String paramName;
    private String paramType;
    private Integer paramOrder;

    public Long getKcKrmsTermFunctionParamSpecId() {
        return kcKrmsTermFunctionParamSpecId;
    }
    public void setKcKrmsTermFunctionParamSpecId(Long kcKrmsTermFunctionParamSpecId) {
        this.kcKrmsTermFunctionParamSpecId = kcKrmsTermFunctionParamSpecId;
    }
    public Long getKcKrmsTermFunctionId() {
        return kcKrmsTermFunctionId;
    }
    public void setKcKrmsTermFunctionId(Long kcKrmsTermFunctionId) {
        this.kcKrmsTermFunctionId = kcKrmsTermFunctionId;
    }
    public String getParamName() {
        return paramName;
    }
    public void setParamName(String paramName) {
        this.paramName = paramName;
    }
    public String getParamType() {
        return paramType;
    }
    public void setParamType(String paramType) {
        this.paramType = paramType;
    }
    public Integer getParamOrder() {
        return paramOrder;
    }
    public void setParamOrder(Integer paramOrder) {
        this.paramOrder = paramOrder;
    }
}