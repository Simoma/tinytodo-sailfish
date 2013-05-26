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
import ".."

Page {
    id: page
    allowedOrientations: Orientation.Portrait

    AddPage {
        id: addPage
        onNewTodo: {
            if(name) {
                 console.log("List: new todo")
                 todoModel.addTodo(name)
            }
        }
    }

    TodoModel {
        id: todoModel
    }

    Component {
        id: todoDelegate
        TextSwitch {
            x: theme.paddingLarge
            text: name
            checked: done
            //color: checked ? theme.secondaryColor : theme.primaryColor
            onCheckedChanged: {
                if(text) {
                    console.log("List: \"" + text + (checked ? "\" marked done":"\" marked not done"));
                    todoModel.updateStatus(text, checked);
                }
            }
        }
    }

    SilicaListView {
        id: todoView
        model: todoModel
        delegate: todoDelegate
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: "About Tiny Todo"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
            MenuItem {
                text: "Delete done todos"
                onClicked: {
                    console.log("List: Delete done todos")
                    todoModel.clearDoneTodo();
                }
            }
            MenuItem {
                text: "Add new todo"
                onClicked: pageStack.push(addPage)
            }
        }

        ViewPlaceholder {
                     enabled: todoView.count === 0
                     text: "No items"
        }

        header: PageHeader {
            title: "Tiny Todo"
        }
    }
}





