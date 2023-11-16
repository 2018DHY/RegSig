import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import "qrc:/qmlUI/" as UI



Window {
    id:wido
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property bool mode: false

    UI.RegSig{
        id:tools1
        width:parent.width
        height:parent.height
    }

    Text {
        id: tips
        width: parent.width
        text: qsTr("text")
        font.pointSize: 14
        anchors.bottom: parent.bottom
        horizontalAlignment: Text.AlignHCenter
    }

}
