# The name of your app
TARGET = tinytodo

# C++ sources
SOURCES += main.cpp

# C++ headers
HEADERS +=

# QML files and folders
qml.files = *.qml pages cover main.qml

# The .desktop file
desktop.files = tinytodo.desktop

# Please do not modify the following line.
include(sailfishapplication/sailfishapplication.pri)

OTHER_FILES = rpm/tinytodo.yaml \
    pages/AboutPage.qml \
    COPYING \
    README \
    TodoModel.qml

