import QtQuick 6.5
import QtQuick.Controls 6.5
import UntitledProject
import QtQuick.Layouts
import QtQuick.Particles 6.5
import "."
Item {

    id: rootItem
     anchors.fill: parent

     property int currentWonCard: 0
     property int drawnCard: 0



     onCurrentWonCardChanged: {


         Context.cardCounts -= 1

         if (currentWonCard == 1)
         randomCard.color = "red"
         else if (currentWonCard == 2)
             randomCard.color = "orange"
         else if (currentWonCard == 3)
             randomCard.color = "yellow"
         else if (currentWonCard == 4)
                     randomCard.color = "green"
         if (currentWonCard == 5)
                     randomCard.color = "blue"


        console.log("inside state change" )

         console.log(currentWonCard)
         console.log(drawnCard)

         if(Context.cardCounts == 0) { //game ended

             Context.cardCounts = 24
             Context.currentRandomNumber = 0
             Context.succeededDrawCounts = 0
             item.state = "resetCardView"

         } else {
            Context.currentRandomNumber = currentWonCard
         if (currentWonCard == drawnCard){

             Context.succeededDrawCounts += 1
             item.state= "rotatedWin"
         } else {
              item.state= "rotatedNoWin"
         }
       }
     }


     Item {
         id: particleSystem
         anchors.fill: parent
         z: 4
         visible: false
     ParticleSystem {
            anchors.fill: parent
            id: particles


            ImageParticle {
                source: "assets/snow.png"
                colorVariation: 1.0
            }

            Emitter {
                height: 100; width: 100
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                velocityFromMovement: 10

                velocity : CumulativeDirection {

                     AngleDirection { angle: 270; angleVariation: 10; magnitude: 300}
                     AngleDirection { angle: 300; angleVariation: 10; magnitude: 300}
                     AngleDirection { angle: 330; angleVariation: 10; magnitude: 300}
                     AngleDirection { angle: 0; angleVariation: 10; magnitude: 300}
                     AngleDirection { angle: 30; angleVariation: 10; magnitude: 300}
                     AngleDirection { angle: 60; angleVariation: 10; magnitude: 300}
                     AngleDirection { angle: 90; angleVariation: 10; magnitude: 300}
                     AngleDirection { angle: 120; angleVariation: 10; magnitude: 300}
                     AngleDirection { angle: 150; angleVariation: 10; magnitude: 300}
                     AngleDirection { angle: 180; angleVariation: 10; magnitude: 300}
                     AngleDirection { angle: 210; angleVariation: 10; magnitude: 300}
                     AngleDirection { angle: 240; angleVariation: 10; magnitude: 300}

                }
                lifeSpan: 5200
                sizeVariation: 5
                emitRate: 40

            }


        }

     }



GridLayout {
    anchors.fill: parent
    columnSpacing: 0

    columns: 5
    rows: 4
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.rightMargin: 0

    rowSpacing: 0

    Item {
        id: updateText
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        Layout.column: 3
        Layout.columnSpan: 1
        Layout.row: 0
        Layout.rowSpan: 1
        Layout.preferredWidth: 1
        Layout.preferredHeight: 1
        Layout.fillHeight: true
        Layout.fillWidth: true

        Text {

            id: totalCardsText
              font.family: "Calibri"
               font.pixelSize: 40
               anchors.centerIn: parent
               text: Context.cardCounts
               font.bold: true
                color: "black"
                visible: true
                opacity: 1
        }


        Text {
            id: wonCardsText
              font.family: "Calibri"
               font.pixelSize: 60
               anchors.centerIn: parent
               text: "You won!"
               font.bold: true
                color: "black"
                visible: false
                opacity: 0
        }


    }
    Item {
        id: item
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        Layout.column: 3
        Layout.columnSpan: 1
        Layout.row: 1
        Layout.rowSpan: 2
        Layout.preferredWidth: 1
        Layout.preferredHeight: 1
        Layout.fillHeight: true
        Layout.fillWidth: true


        Layout.maximumWidth: 200
        Layout.minimumWidth: 100
        Layout.maximumHeight: 300
        Layout.minimumHeight: 200

        Card {
            id: randomCard
             color: "red"
             anchors.fill: parent
             opacity: 0
             z:0

        }

        Card {
            id: card
             color: "grey"
             anchors.fill: parent
             z:1
        }


        Timer {
            id: closeCurrentCardTimer
               interval: 2500; running: false; repeat: false
               onTriggered: item.state = "resetCardView"
           }


     Connections {
                    target: card
                    onRandomnessCalled: {
             item.state ="rotatedWin"
            closeCurrentCardTimer.start()
                }
          }

        states: [ State {
                 name: "rotatedWin"
                 PropertyChanges { target: card; rotation: 1440 }
                 PropertyChanges { target: card; opacity: 0}
                 PropertyChanges { target: randomCard; opacity: 1}
                 PropertyChanges {
                     target: particleSystem;
                     visible: true

                 }
                 PropertyChanges { target: wonCardsText; opacity: 1}
                 PropertyChanges { target: wonCardsText; visible: true}
                 PropertyChanges { target: totalCardsText; visible: false}
                 PropertyChanges { target: totalCardsText; opacity: 0}
             },

            State {
                             name: "rotatedNoWin"
                             PropertyChanges { target: card; rotation: 1440 }
                             PropertyChanges { target: card; opacity: 0}
                             PropertyChanges { target: randomCard; opacity: 1}
                             PropertyChanges {
                                 target: particleSystem;
                                 visible: true

                             }
                             PropertyChanges { target: wonCardsText; opacity: 0}
                             PropertyChanges { target: wonCardsText; visible: false}
                             PropertyChanges { target: totalCardsText; visible: true}
                             PropertyChanges { target: totalCardsText; opacity: 1}
                         },
            State {
              name: "resetParticleSystem"
              PropertyChanges {
                target: particleSystem;
                visible: false
              }

            },
            State {
                name: "resetCardView"
                PropertyChanges { target: card; opacity: 1}
                PropertyChanges { target: randomCard; opacity: 0}
                PropertyChanges { target: wonCardsText; opacity: 0}
                PropertyChanges { target: wonCardsText; visible: false}
                PropertyChanges { target: totalCardsText; visible: true}
                PropertyChanges { target: totalCardsText; opacity: 1}
            }
        ]

             transitions: [
                 Transition {
                 to: "rotatedWin";
                 ParallelAnimation {
                 SequentialAnimation {
                     ParallelAnimation {
                         PropertyAnimation { target: card; property: "opacity"; duration: 1000 }

                         RotationAnimation { target: card; duration: 1000; direction: RotationAnimation.Clockwise;  }
                     }
                     PropertyAnimation { target: randomCard; property: "opacity"; duration: 400 }
                 }
                    PropertyAnimation { target: particleSystem; property: "visible"; duration: 1000 }

                    PropertyAnimation { target: totalCardsText; property: "visible"; duration: 200 }
                    PropertyAnimation { target: totalCardsText; property: "opacity"; duration: 200 }

                    PropertyAnimation { target: wonCardsText; property: "visible"; duration: 1000 }
                    PropertyAnimation { target: wonCardsText; property: "opacity"; duration: 1000 }

                 }


             },
                 Transition {
                 to: "rotatedNoWin";
                 ParallelAnimation {
                 SequentialAnimation {
                     ParallelAnimation {
                         PropertyAnimation { target: card; property: "opacity"; duration: 1000 }

                         RotationAnimation { target: card; duration: 1000; direction: RotationAnimation.Clockwise;  }
                     }
                     PropertyAnimation { target: randomCard; property: "opacity"; duration: 400 }
                 }

                 PropertyAnimation { target: totalCardsText; property: "visible"; duration: 200 }



             }} ,
                 //totalCardsText
                 Transition {
                     to: "resetCardView" ;
                      SequentialAnimation {
                      PropertyAnimation { target: particleSystem; property: "visible"; duration: 1000 }
                      ParallelAnimation {
                          PropertyAnimation { target: card; property: "opacity"; duration: 4000 }
                          PropertyAnimation { target: randomCard; property: "opacity"; duration: 300 }

                          PropertyAnimation { target: totalCardsText; property: "visible"; duration: 210 }
                          PropertyAnimation { target: totalCardsText; property: "opacity"; duration: 210 }

                          PropertyAnimation { target: wonCardsText; property: "visible"; duration: 200 }
                          PropertyAnimation { target: wonCardsText; property: "opacity"; duration: 200 }

                      }
                 }
                 }

             ]

   }
    Item {
        id: updateWonCount
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        Layout.column: 3
        Layout.columnSpan: 1
        Layout.row: 3
        Layout.rowSpan: 1
        Layout.preferredWidth: 1
        Layout.preferredHeight: 1
        Layout.fillHeight: true
        Layout.fillWidth: true

        Text {
            id: wonCardsCountText
              font.family: "Calibri"
               font.pixelSize: 40
               anchors.centerIn: parent
               text: Context.succeededDrawCounts
               font.bold: true
                color: "black"
        }


    }

  }
}
