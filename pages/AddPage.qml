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
    allowedOrientations: Orientation.Portrait
    signal newTodo(string name)
    
    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent
        
        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                id: saveItem
                text: "Save"
                onClicked: {
                    console.log("Add: Save from menu");
                    saveTodo();
                }
            }
        }
        
        // Tell SilicaFlickable the height of its content.
        contentHeight: childrenRect.height
        
        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            width: page.width
            spacing: theme.paddingLarge
            PageHeader {
                title: "New todo"
           }
            TextField {
                id: input
                x: theme.paddingLarge
                width: parent.width - theme.paddingLarge
                focus: true
                placeholderText: "New todo title"
                text: ""
                Keys.onEnterPressed: {
                    console.log("Add: Enter pressed")
                    saveTodo();
                }
                Keys.onReturnPressed: {
                    console.log("Add: Return pressed")
                    saveTodo();
                }
            }
        }
    }

    function saveTodo() {
        page.newTodo(input.text);
        input.text = "";
        pageStack.pop();
    }

}


