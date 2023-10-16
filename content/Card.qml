import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick 6.5
import QtQuick.Controls 6.5
import UntitledProject
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
Rectangle {
 signal randomnessCalled(randomCard: int, currentCard: int)
    color: "#db1111"
    id: card

     property int cardId: 0
    property bool isTapEnabled: true

    Rectangle {




    id: rectangleCard



    color: card.color
    anchors.fill: parent

    Image {
        id: sourceImage
        source: 'assets/first.png'
        z: 0
        anchors.topMargin: 0
        anchors.fill: rectangleCard
        anchors.leftMargin: 0
        mipmap: false
        fillMode: Image.Tile
        opacity:  1
        anchors.top: parent.top
        anchors.left: parent.left

        }



    TapHandler {
           id: tapHandlerRed
           enabled: card.isTapEnabled
           gesturePolicy: TapHandler.ReleaseWithinBounds
           onTapped: {
               console.log("Tapped");
               card.requestRandomness();
               //getRandomArbitrary()
           }

       }



}

DropShadow {
    z: 0
    anchors.fill: rectangleCard
    samples: 17

       horizontalOffset: 3
       verticalOffset: 3
       radius: 8.0
       color: "#40000000"
       source: rectangleCard
   }
BrightnessContrast {
     z: 0
    anchors.fill: rectangleCard

       source: rectangleCard
       brightness: 0.5
       contrast: 0.5
   }

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min) + min); // The maximum is exclusive and the minimum is inclusive
}

function getRandomArbitrary() {
      card.randomnessCalled(getRandomInt(1, 5), card.cardId)

}
    function requestRandomness() {

    console.log("hey???????????????????????????????????????")

    let uri = "https://www.random.org/integers/?num=1&min=1&max=5&col=1&base=10&format=plain&rnd=new"

       const xhr = new XMLHttpRequest()

       xhr.onreadystatechange = function() {
           if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
               print('HEADERS_RECEIVED')
               console.log("headers received???????????????????????????????????????")

           } else if(xhr.readyState === XMLHttpRequest.DONE) {
               console.log("done???????????????????????????????????????")
               print('DONE')

               let rspnse =  xhr.responseText.toString()
               console.log(rspnse);
                let randomResult =parseInt(rspnse)

                card.randomnessCalled(randomResult, card.cardId)



           }
           else {
               console.log(""+ xhr.readyState + "????????????????????")
           }
       }
    xhr.onerror = function () {
        console.error("** An error occurred during the XMLHttpRequest");
        console.log("** An error occurred during the XMLHttpRequest");
      resolve(undefined);

    };
       xhr.open("GET", uri)
       xhr.send()
    console.log("sent???????????????????????????????????????")
   }
}
