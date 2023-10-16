

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.5
import QtQuick.Controls 6.5
import UntitledProject
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent
    color: "#761381"

    border.color: "#d6000000"
    Timer {
        id: enableSelectorView
        interval: 3500
        running: false
        repeat: false
        onTriggered: selectorView.isTapEnabled = true
    }

    Connections {
        target: selectorView
        function onRandomnessCalled(randomCard, currentCard) {
            selectorView.isTapEnabled = false
            showCardView.drawnCard = currentCard
            showCardView.currentWonCard = randomCard
            if (showCardView.totalDrawnCards < 24)
                showCardView.totalDrawnCards += 1
            else
                showCardView.totalDrawnCards = 0

            enableSelectorView.start()
        }
    }
    Image {
        id: sourceImage2
        source: 'assets/tex2res5.png'
        //                anchors.verticalCenterOffset: 2
        //                anchors.horizontalCenterOffset: 2
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        mipmap: false
        fillMode: Image.Tile
        anchors.fill: parent

        opacity: 0.9

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
    GridLayout {
        anchors.fill: parent
        columnSpacing: 0

        columns: 5
        rows: 6 // was 2
        anchors.bottomMargin: 10
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        rowSpacing: 0

        Item {
            Layout.column: 0
            Layout.columnSpan: 5
            Layout.row: 0
            Layout.rowSpan: 4
            Layout.preferredWidth: 4 // 4 of 5 cols
            Layout.preferredHeight: 4 // 2 of 5 rows
            Layout.fillHeight: true
            Layout.fillWidth: true
            ShowCard {
                id: showCardView
            }
        }

        Item {
            Layout.column: 0
            Layout.columnSpan: 5
            Layout.row: 4
            Layout.rowSpan: 2
            Layout.preferredHeight: 2 // 3 of 5 rows
            Layout.fillHeight: parent
            Layout.fillWidth: parent

            //            Layout.maximumHeight: 300
            //            Layout.maximumWidth: 500
            //            Layout.minimumHeight: 300
            //            Layout.minimumWidth: 500
            //Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
            SelectorCards {
                id: selectorView
            }
        }
    } //}
}
