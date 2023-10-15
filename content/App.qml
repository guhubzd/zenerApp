import QtQuick 6.5
import QtQuick.Controls 6.5
import UntitledProject

Window {
    id: root
    width: Constants.width
    height: Constants.height

    visible: true

    ToolBar {
        id: toolBar
        anchors.right: parent.right
        anchors.left: parent.left
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font:  Constants.largeFont
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    StackView {
        id: stackView
        anchors.top: toolBar.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        initialItem: Screen01 {}
    }

    Drawer {
        id: drawer
        width: root.width * 0.33
        height: root.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Page 1")
                width: parent.width
                onClicked: {
                    stackView.push("Screen01.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    stackView.push("Screen02.ui.qml")
                    drawer.close()
                }
            }
        }
    }

    function requestRandomness() {

        console.log("hey???????????????????????????????????????")

        let uri = "https://www.random.org/integers/?num=100&min=1&max=5&col=1&base=10&format=plain&rnd=new"



           const xhr = new XMLHttpRequest()

           xhr.onreadystatechange = function() {
               if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                   print('HEADERS_RECEIVED')
                   console.log("headers received???????????????????????????????????????")

               } else if(xhr.readyState === XMLHttpRequest.DONE) {
                   console.log("done???????????????????????????????????????")
                   print('DONE')
                   //const response = JSON.parse(xhr.responseText.toString())
                   // Set JS object as model for listview

                   let rspnse =  xhr.responseText.toString()
                   console.log(rspnse);
                    //let randomResult =parseInt(rspnse)

                    //randomnessCalled(randomResult)
                   //console.log(rspnse);


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

    function readTextFile(fileUrl){
       var xhr = new XMLHttpRequest;
       xhr.open("GET", fileUrl); // set Method and File
       xhr.onreadystatechange = function () {
           console.log("Ready State"+xhr.readyState);
           if(xhr.readyState === XMLHttpRequest.DONE){ // if request_status == DONE
               var response = xhr.responseText;

               //scrollableBox.text = response
               console.log(response)

           }
       }
        xhr.onerror = function () {
            console.error("** An error occurred during the XMLHttpRequest");
            console.log("** An error occurred during the XMLHttpRequest");
          resolve(undefined);

        };
       xhr.send(); // begin the request
   }

//    Component.onCompleted: {
//          root.readTextFile("file://randomNums.txt")
//      }
}

