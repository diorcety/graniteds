/*
  GRANITE DATA SERVICES
  Copyright (C) 2011 GRANITE DATA SERVICES S.A.S.

  This file is part of Granite Data Services.

  Granite Data Services is free software; you can redistribute it and/or modify
  it under the terms of the GNU Library General Public License as published by
  the Free Software Foundation; either version 2 of the License, or (at your
  option) any later version.

  Granite Data Services is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public License
  for more details.

  You should have received a copy of the GNU Library General Public License
  along with this library; if not, see <http://www.gnu.org/licenses/>.
*/

package org.granite.context;

import java.util.Map;

import org.granite.config.GraniteConfig;
import org.granite.config.flex.ServicesConfig;
import org.granite.messaging.service.MainFactory;
import org.granite.messaging.service.SimpleMainFactory;

public abstract class AbstractGraniteContext implements GraniteContext {

    private final GraniteConfig graniteConfig;
    private final ServicesConfig servicesConfig;
    private final AMFContext amfContext;
    private MainFactory mainFactory;

    public AbstractGraniteContext(GraniteConfig graniteConfig, ServicesConfig servicesConfig) {
        this.servicesConfig = servicesConfig;
        this.graniteConfig = graniteConfig;
        this.amfContext = new AMFContextImpl();
    }

    public ServicesConfig getServicesConfig() {
        return servicesConfig;
    }

    public GraniteConfig getGraniteConfig() {
        return graniteConfig;
    }

    public AMFContext getAMFContext() {
        return amfContext;
    }

    public Class<?> forName(String type) throws ClassNotFoundException
    {
        throw new ClassNotFoundException(type);
    }

    public MainFactory getMainFactory()
    {
        if(mainFactory == null)
        {
            mainFactory = new SimpleMainFactory();
        }
        return mainFactory;
    }

    
    public abstract Object getSessionLock();

    public abstract Map<String, String> getInitialisationMap();
    public abstract Map<String, Object> getApplicationMap();
    public abstract Map<String, Object> getSessionMap();
    public abstract Map<String, Object> getSessionMap(boolean create);
    public abstract Map<String, Object> getRequestMap();
}
