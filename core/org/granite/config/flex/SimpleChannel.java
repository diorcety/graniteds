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

package org.granite.config.flex;

import org.granite.util.XMap;

/**
 * @author Franck WOLFF
 */
public class SimpleChannel implements Channel{

    private static final String LEGACY_XML = "serialization/legacy-xml";
    private static final String LEGACY_COLLECTION = "serialization/legacy-collection";

    protected String id;
    protected String className;
    protected EndPoint endPoint;
    protected XMap properties;

    protected boolean legacyXml;
    protected boolean legacyCollection;

    public SimpleChannel(String id, String className, EndPoint endPoint, XMap properties) {
        this.id = id;
        this.className = className;
        this.endPoint = endPoint;
        this.properties = properties;
        this.legacyCollection = Boolean.TRUE.toString().equals(properties.get(LEGACY_COLLECTION));
        this.legacyXml = Boolean.TRUE.toString().equals(properties.get(LEGACY_XML));
    }

    public String getId() {
        return id;
    }

    public String getClassName() {
        return className;
    }

    public EndPoint getEndPoint() {
        return endPoint;
    }

    public XMap getProperties() {
        return properties;
    }

    public boolean isLegacyXmlSerialization() {
        return legacyXml;
    }

    public boolean isLegacyCollectionSerialization() {
        return legacyCollection;
    }

    public static Channel forElement(XMap element) {
        String id = element.get("@id");
        String className = element.get("@class");

        XMap endPointElt = element.getOne("endpoint");
        if (endPointElt == null)
            throw new RuntimeException("Excepting a 'endpoint' element in 'channel-definition': " + id);
        EndPoint endPoint = SimpleEndPoint.forElement(endPointElt);

        XMap properties = new XMap(element.getOne("properties"));

        return new SimpleChannel(id, className, endPoint, properties);
    }
}
