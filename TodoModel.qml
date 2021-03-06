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

// Original source / inspiration (LGPL 2.1 licenced):
// http://apidocs.meego.com/1.2/qt4/demos-declarative-snake-content-highscoremodel-qml.html

import QtQuick 1.1

ListModel {
     id: model

     function __db()
     {
         return openDatabaseSync("TodoModel", "1.0", "Todo list", 1000);
     }
     function __ensureTables(tx)
     {
         tx.executeSql('CREATE TABLE IF NOT EXISTS todo(name TEXT, done BIT)', []);
     }

     function fillModel() {
         __db().transaction(
             function(tx) {
                 __ensureTables(tx);
                 var rs = tx.executeSql("SELECT name,done FROM todo ORDER BY done ASC", []);
                 model.clear();
                 if (rs.rows.length > 0) {
                     for (var i=0; i<rs.rows.length; ++i) {
                         model.append(rs.rows.item(i))
                     }
                 }
             }
         )
     }

     function addTodo(name) {
         __db().transaction(
             function(tx) {
                 __ensureTables(tx);
                 tx.executeSql("INSERT INTO todo VALUES(?,0)", [name]);
                 fillModel();
             }
         )
     }

     function updateStatus(name, done) {
         __db().transaction(
                     function(tx) {
                         if(done) {
                             tx.executeSql("UPDATE todo set done=1 where name=?", [name]);
                         } else {
                             tx.executeSql("UPDATE todo set done=0 where name=?", [name]);
                         }
                         //fillModel();
                     }
          )
     }

     function clearDoneTodo() {
         __db().transaction(
             function(tx) {
                 tx.executeSql("DELETE FROM todo WHERE done=1", []);
                 fillModel();
             }
         )
     }

     Component.onCompleted: { fillModel() }
 }
