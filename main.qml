import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import "./qmlUI/" as UI
import com.DHY.MyTools 1.0



Window {
    id:wido
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    MyDB{
        id:db
    }

    Item{
        width: wido.width
        height:wido.height

        UI.RegSig{
            id:tools1
            width:parent.width
            height:parent.height
        }

        Text {
            id: tips
            width: parent.width
            text: qsTr("---提示---")
            font.pointSize: 14
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
        }


        Rectangle{
            width: 100
            height:100
            anchors.right:parent.right
            RowLayout{
                width:100
                height: 100
                Label{
                    text:"切换"
                }
                Switch{
                    id:switch1
                    checked: true
                    onClicked: {
                        if(checked === true){
                            tools1.text="登录";
                            tools1.stating=true;
                        }else{
                            console.log("false");
                            tools1.text="注册";
                            tools1.stating=false;
                        }

                    }
                }
            }
        }

    }

    Connections{
        target: db
        onMsg:function fun(msg){
            tips.text=msg
        }
    }



}
