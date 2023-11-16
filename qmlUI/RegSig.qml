import QtQuick 2.15
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
//import com.DHY.MyTools 1.0


Item{
    width: 680
    height: 480

//    MyDB{
//        id:db
//    }

    GridLayout{
        id:grid1
        width: parent.width/2.5
        height: parent.height/2.5
        rows: 4
        columns: 2
        anchors.centerIn: parent
        Component.onCompleted: {
            console.log("grid1:  "+grid1.width);
            console.log(grid1.height);

        }

        Label{
            id:title1
            width: parent.width
            height: parent.height/4

            text: "登录"
            font.pointSize: 20
            Layout.columnSpan: 2
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredWidth: width

            Component.onCompleted: {

                console.log("title1:"+title1.width )
            }
        }
        Label{
            id:userlab

            height: parent.height/4
            horizontalAlignment: Text.AlignLeft

            text: "用户"
            font.pointSize: 10
        }
        TextField{
            id:usrin

            height: parent.height/4
            Layout.fillWidth: true
        }

        Label{
            id:passlab

            height: parent.height/4
            horizontalAlignment: Text.AlignLeft

            text: "密码"
            font.pointSize: 10
        }
        TextField{
            id:passin
            height: parent.height/4
            Layout.fillWidth: true

        }


        Button{
            width: parent.width/2
            text:"确认"
            Layout.columnSpan: 2
            Layout.preferredWidth: width
//            Layout.horizontalCenter:
            anchors.horizontalCenter: parent.horizontalCenter
        }







    }

}
