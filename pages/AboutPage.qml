/*
    Copyright 2013 Simo Mattila
    simo.h.mattila@gmail.com

    This file is part of Tiny Todo.

    Tiny Todo is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    Tiny Todo is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Tiny Todo.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 1.1
import Sailfish.Silica 1.0

Page {
    id: page
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: childrenRect.height
        Column {
            id: column
            width: page.width
            spacing: theme.paddingLarge
            PageHeader {
                title: "About"
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                text: "Tiny Todo"
                font.pixelSize: theme.fontSizeExtraLarge
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                text: "Copyright 2013 Simo Mattila"
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                text: "simo.h.mattila@gmail.com"
                font.pixelSize: theme.fontSizeExtraSmall
            }
            Label {
                anchors.horizontalCenter: column.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                text: "Distributed under the terms of the<br>GNU General Public License"
                font.pixelSize: theme.fontSizeExtraSmall
            }
        }
    }
}
