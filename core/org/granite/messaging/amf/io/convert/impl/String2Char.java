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

package org.granite.messaging.amf.io.convert.impl;

import java.lang.reflect.Type;

import org.granite.messaging.amf.io.convert.Converter;
import org.granite.messaging.amf.io.convert.Converters;

/**
 * @author Franck WOLFF
 */
public class String2Char extends Converter {

    public String2Char(Converters converters) {
        super(converters);
    }

    @Override
	protected boolean internalCanConvert(Object value, Type targetType) {
        return
            (targetType.equals(Character.TYPE) || targetType.equals(Character.class)) &&
            (value == null || (value instanceof String && ((String)value).length() <= 1));
    }

    @Override
	protected Object internalConvert(Object value, Type targetType) {
        final String s = (String)value;
        if (s == null || s.length() == 0)
            return targetType.equals(Character.class) ? null : Character.valueOf('\0');
        return Character.valueOf(s.charAt(0));
    }
}
