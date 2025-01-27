﻿/*
 * Dunnart - Constraint-based Diagram Editor
 *
 * Copyright (C) 2010  Monash University
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA  02110-1301, USA.
 *
 *
 * Author(s): Michael Wybrow  <http://michael.wybrow.info/>
*/


#ifndef PLUGINSHAPEFACTORY_H
#define PLUGINSHAPEFACTORY_H

#include <QStringList>
#include <QList>
#include <QMap>

#include "libdunnartcanvas/dllexport.h"

class QString;
class QDomElement;

namespace dunnart {

class ShapeObj;
class Canvas;
class ShapePluginInterface;

typedef QMap<QString, ShapePluginInterface *> ShapeBuilders;

class DUNNARTCANVAS_EXPORT PluginShapeFactory
{
public:
    PluginShapeFactory();
    void registerShapePlugin(ShapePluginInterface *shapePlugin);
    ShapeObj *createShape(const QString& shapeType);
    QStringList shapeClassLabels(void) const;
    QStringList shapeTypesForClassLabel(const QString& classLabel) const;

private:
    QStringList m_shape_class_labels;
    QList<ShapeBuilders> m_shape_builders;
};

DUNNARTCANVAS_EXPORT PluginShapeFactory *sharedPluginShapeFactory(void);

}
#endif // PLUGINSHAPEFACTORY_H
// vim: filetype=cpp ts=4 sw=4 et tw=0 wm=0 cindent
