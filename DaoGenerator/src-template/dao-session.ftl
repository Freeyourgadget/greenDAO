<#--

Copyright (C) 2011 Markus Junginger, greenrobot (http://greenrobot.de)     
                                                                           
This file is part of greenDAO Generator.                                   
                                                                           
greenDAO Generator is free software: you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by       
the Free Software Foundation, either version 3 of the License, or          
(at your option) any later version.                                        
greenDAO Generator is distributed in the hope that it will be useful,      
but WITHOUT ANY WARRANTY; without even the implied warranty of             
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              
GNU General Public License for more details.                               
                                                                           
You should have received a copy of the GNU General Public License          
along with greenDAO Generator.  If not, see <http://www.gnu.org/licenses/>.

-->
package ${schema.defaultJavaPackageDao};

import io.requery.android.database.sqlite.SQLiteDatabase;

import java.util.Map;

import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.AbstractDaoSession;
import de.greenrobot.dao.identityscope.IdentityScopeType;
import de.greenrobot.dao.internal.DaoConfig;

<#list schema.entities as entity>
import ${entity.javaPackage}.${entity.className};
</#list>

<#list schema.entities as entity>
import ${entity.javaPackageDao}.${entity.classNameDao};
</#list>

// THIS CODE IS GENERATED BY greenDAO, DO NOT EDIT.

/**
 * {@inheritDoc}
 * 
 * @see de.greenrobot.dao.AbstractDaoSession
 */
public class DaoSession extends AbstractDaoSession {

<#list schema.entities as entity>
    private final DaoConfig ${entity.classNameDao?uncap_first}Config;
</#list>        

<#list schema.entities as entity>
    private final ${entity.classNameDao} ${entity.classNameDao?uncap_first};
</#list>        

    public DaoSession(SQLiteDatabase db, IdentityScopeType type, Map<Class<? extends AbstractDao<?, ?>>, DaoConfig>
            daoConfigMap) {
        super(db);

<#list schema.entities as entity>
        ${entity.classNameDao?uncap_first}Config = daoConfigMap.get(${entity.classNameDao}.class).clone();
        ${entity.classNameDao?uncap_first}Config.initIdentityScope(type);

</#list>        
<#list schema.entities as entity>
        ${entity.classNameDao?uncap_first} = new ${entity.classNameDao}<#--
-->(${entity.classNameDao?uncap_first}Config, this);
</#list>        

<#list schema.entities as entity>
        registerDao(${entity.className}.class, ${entity.classNameDao?uncap_first});
</#list>        
    }
    
    public void clear() {
<#list schema.entities as entity>
        ${entity.classNameDao?uncap_first}Config.getIdentityScope().clear();
</#list>    
    }

<#list schema.entities as entity>
    public ${entity.classNameDao} get${entity.classNameDao?cap_first}() {
        return ${entity.classNameDao?uncap_first};
    }

</#list>        
}
