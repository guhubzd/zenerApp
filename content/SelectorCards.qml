import QtQuick 6.5
import QtQuick.Controls 6.5
import UntitledProject
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

GridLayout {
                anchors.fill: parent
            id: root
                columns: 5
                rows: 1 // was 2

                signal randomnessCalled(randomCard: int, currentCard: int)


        columnSpacing: 10
        rowSpacing: 10
        property bool isTapEnabled: true


        Connections  {
                       target: cardRed
                       function onRandomnessCalled(randomCard: int, currentCard: int)  {

                           root.randomnessCalled(randomCard, currentCard)
                       }

             }

        Connections  {
                       target: cardOrange
                       function onRandomnessCalled(randomCard: int, currentCard: int)  {

                           root.randomnessCalled(randomCard, currentCard)
                       }
             }

        Connections  {
                       target: cardYellow
                       function onRandomnessCalled(randomCard: int, currentCard: int)  {

                           root.randomnessCalled(randomCard, currentCard)
                       }
             }

        Connections  {
                       target: cardGreen
                       function onRandomnessCalled(randomCard: int, currentCard: int)  {

                           root.randomnessCalled(randomCard, currentCard)
                       }
             }

        Connections  {
                       target: cardBlue
                       function onRandomnessCalled(randomCard: int, currentCard: int)  {

                           root.randomnessCalled(randomCard, currentCard)
                       }
             }






        Card {
            id: cardRed
            isTapEnabled: root.isTapEnabled
            cardId: 1
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 1
            Layout.preferredWidth: 1 // 4 of 5 cols
            Layout.preferredHeight: 1 // 2 of 5 rows
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.leftMargin: 0
            Layout.rightMargin: 0
            Layout.topMargin: 0
            Layout.maximumWidth: 200
            Layout.minimumWidth: 100
            Layout.maximumHeight: 300
            Layout.minimumHeight: 200

            Layout.bottomMargin: 0
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            color: "#db1111"
        }



        Card {
            id: cardOrange
            isTapEnabled: root.isTapEnabled
            cardId: 2
            color: "#fc774f"
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 1
            Layout.preferredWidth: 1 // 4 of 5 cols
            Layout.preferredHeight: 1 // 2 of 5 rows
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 200
            Layout.minimumWidth: 100
            Layout.maximumHeight: 300
            Layout.minimumHeight: 200

        }

        Card {
            id: cardYellow
            isTapEnabled: root.isTapEnabled
            cardId: 3
            color: "#faff01"

            Layout.column: 2
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 1
            Layout.preferredWidth: 1 // 4 of 5 cols
            Layout.preferredHeight: 1 // 2 of 5 rows
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 200
            Layout.minimumWidth: 100
            Layout.maximumHeight: 300
            Layout.minimumHeight: 200

        }


        Card {
            id: cardGreen
            isTapEnabled: root.isTapEnabled
            cardId: 4
            color: "#0c8e04"
            Layout.column: 3
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 1
            Layout.preferredWidth: 1 // 4 of 5 cols
            Layout.preferredHeight: 1 // 2 of 5 rows
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 200
            Layout.minimumWidth: 100
            Layout.maximumHeight: 300
            Layout.minimumHeight: 200

        }

        Card {
            id: cardBlue
            isTapEnabled: root.isTapEnabled
            cardId: 5
            color: "#456df3"
            Layout.column: 4
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 1
            Layout.preferredWidth: 1 // 4 of 5 cols
            Layout.preferredHeight: 1 // 2 of 5 rows
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 200
            Layout.minimumWidth: 100
            Layout.maximumHeight: 300
            Layout.minimumHeight: 200

        }

    }
