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

Rectangle {
    anchors.fill: parent
    color: "black"
    opacity: 0.5
    
    Label {
        id: label
        anchors.centerIn: parent
        text: "Tiny Todo"
    }
    
    CoverActionList {
        id: coverAction
        
        CoverAction {
            iconSource: "image://theme/icon-cover-next"
            onTriggered: console.log("Cover: Add Todo")
        }
        
/*        CoverAction {
            iconSource: "image://theme/icon-cover-pause"
        }*/
    }
}


