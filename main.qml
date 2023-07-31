import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 400
    height: 300
    //property alias row: row
    title: qsTr("Calculator")
    color:"black"

    property string currentText: "0"
    property int maxDisplayedExpressions : 10

    Text {
        id: calculator_text_equals
        x:0
        width: parent.width/2
        height: 60
        Layout.fillWidth: true
        Layout.fillHeight: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 40
        color:"white"
        text: currentText
        anchors.topMargin: 0
        rightPadding: 20
        anchors.top: parent.top
        //삼항연산자



    }
    GridLayout {
        id: gridLayout
        x: 0
        y: 100
        width: parent.width/2
        height: 230
        anchors.bottomMargin: 0
        Layout.fillHeight: true
        Layout.fillWidth: true
        rows: 5
        columns: 5
        anchors.top: calculator_text_equals.bottom
        anchors.bottom: parent.bottom


        Row {
            id: row1
            spacing: 20
            Layout.fillWidth: true
            Layout.fillHeight: true
            width:200
            height: 40
            Layout.alignment:  Qt.AlignTop//값은 위젯의 위쪽 가장자리를 레이아웃 셀 내에서 할당된 공간의 위쪽 가장자리와 정렬하도록 Qt에 지시하는 정렬 플래그
            Layout.row: 1



            RoundButton {
                id: roundButtonAC
                width:145
                height:40
                Image {
                    id: imageac
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: calculator_text_equals.text === "0" ? "qrc:/image/ac.png" : "qrc:/image/c.png"
                    anchors.centerIn: parent
                }
                background: Rectangle {
                    width: 145
                    height: 40
                    color: "#a5a5a5"
                    radius: Math.min(width, height)
                }

                onClicked: calculator_text_equals.text = "0";
            }


            RoundButton {
                id: roundButtondivision
                width:40
                height: 40
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Image {
                    id: imagedivision
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/division.png"
                    anchors.centerIn: parent
                }

                background: Rectangle {
                    width: 40
                    height: 40
                    color: "#fe9f06"
                    radius: Math.min(width, height)
                }

                onClicked: calculator_text_equals.text += "/"
            }
        }

        Row {
            id: row2
            width:200
            height: 40
            spacing: 13.5
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            Layout.row: 2



            RoundButton {
                id: roundButton7
                width: 40
                height: 40
                Image {
                    id: image7
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/7.jpg"
                    anchors.centerIn: parent
                }

                background:Rectangle {
                    width: 40
                    height: 40
                    color: "#333333"
                    radius: Math.min(width, height)
                }
                onClicked: {
                    if (calculator_text_equals.text === "0") {
                        calculator_text_equals.text = "7";
                    } else {
                        calculator_text_equals.text += "7";

                    }
                }
            }
            RoundButton {
                id: roundButton8
                width:40
                height: 40
                Image {
                    id: image8
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/8.jpg"
                    anchors.centerIn: parent
                }


                background:Rectangle {
                    width: 40
                    height: 40
                    color: "#333333"
                    radius: Math.min(width, height)
                }
                onClicked: {
                    if (calculator_text_equals.text === "0") {
                        calculator_text_equals.text = "8";
                    } else {
                        calculator_text_equals.text += "8";

                    }
                }
            }

            RoundButton {
                id: roundButton9
                width:40
                height: 40
                Image {
                    id: image9
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/9.jpg"
                    anchors.centerIn: parent
                }

                background:Rectangle {
                    width: 40
                    height: 40
                    color: "#333333"
                    radius: Math.min(width, height)
                }
                onClicked: {
                    if (calculator_text_equals.text === "0") {
                        calculator_text_equals.text = "9";
                    } else {
                        calculator_text_equals.text += "9";

                    }
                }
            }

            RoundButton {
                id: roundButtonX
                width:40
                height:40
                Image {
                    id: imageX
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/x.jpg"
                    anchors.centerIn: parent
                }
                background:Rectangle {
                    width: 40
                    height: 40
                    color: "#fe9f06"
                    radius: Math.min(width, height)

                }
                onClicked:calculator_text_equals.text += "*";
            }
        }

        Row {
            id: row3
            width:200
            height: 40
            spacing: 13.5
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            Layout.row: 3


            RoundButton {
                id: roundButton4
                width: 40
                height: 40
                Image {
                    id: image4
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/4.jpg"
                    anchors.centerIn: parent
                }

                background: Rectangle {
                    width: 40
                    height: 40
                    color: "#333333"
                    radius: Math.min(width, height)

                }
                onClicked: {
                    if (calculator_text_equals.text === "0") {
                        calculator_text_equals.text = "4";
                    } else {
                        calculator_text_equals.text += "4";

                    }
                }
            }

            RoundButton {
                id: roundButton5
                width:40
                height: 40
                Image {
                    id: image5
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/5.jpg"
                    anchors.centerIn: parent
                }
                background: Rectangle {
                    width: 40
                    height: 40
                    color: "#333333"
                    radius: Math.min(width, height)
                }

                onClicked: {
                    if (calculator_text_equals.text === "0") {
                        calculator_text_equals.text = "5";
                    } else {
                        calculator_text_equals.text += "5";

                    }
                }
            }

            RoundButton {
                id: roundButton6
                width:40
                height: 40
                Image {
                    id: image6
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/6.jpg"
                    anchors.centerIn: parent
                }
                background: Rectangle {
                    width: 40
                    height: 40
                    color: "#333333"
                    radius: Math.min(width, height)
                }
                text: "6"
                onClicked: {
                    if (calculator_text_equals.text === "0") {
                        calculator_text_equals.text = "6";
                    } else {
                        calculator_text_equals.text += "6";

                    }
                }
            }

            RoundButton {
                id: roundButtonminus
                width:40
                height: 40
                Image {
                    id: imageminus
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/minus.jpg"
                    anchors.centerIn: parent
                }
                background: Rectangle {
                    width: 40
                    height: 40
                    color: "#fe9f06"
                    radius: Math.min(width, height)
                }

                onClicked:calculator_text_equals.text += "-";
            }

        }



        Row{
            id: row4
            width:200
            height: 40
            spacing: 13.5
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            Layout.row: 4


            RoundButton{
                id: roundButton1
                width:40
                height: 40
                Image {
                    id: image1
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/1.jpg"
                    anchors.centerIn: parent
                }
                background: Rectangle {
                    width: 40
                    height: 40
                    color: "#333333"
                    radius: Math.min(width, height)
                }
                onClicked: {
                    if (calculator_text_equals.text === "0") {
                        calculator_text_equals.text = "1";
                    } else {
                        calculator_text_equals.text += "1";

                    }
                }
            }

            RoundButton{
                id: roundButton2
                width:40
                height: 40
                Image {
                    id: image2
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/2.jpg"
                    anchors.centerIn: parent
                }
                background: Rectangle {
                    width: 40
                    height: 40
                    color: "#333333"
                    radius: Math.min(width, height)
                }

                onClicked: {
                    if (calculator_text_equals.text === "0") {
                        calculator_text_equals.text = "2";
                    } else {
                        calculator_text_equals.text += "2";

                    }
                }
            }
            RoundButton{
                id: roundButton3
                width:40
                height: 40
                Image {
                    id: image3
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/3.jpg"
                    anchors.centerIn: parent
                }
                background: Rectangle {
                    width: 40
                    height: 40
                    color: "#333333"
                    radius: Math.min(width, height)
                }

                onClicked: {
                    if (calculator_text_equals.text === "0") {
                        calculator_text_equals.text = "3";
                    } else {
                        calculator_text_equals.text += "3";

                    }
                }
            }
            RoundButton{
                id: roundButtonplus
                width:40
                height: 40
                Image {
                    id: imageplus
                    width: parent.width/2
                    height: parent.height/2

                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/plus.jpg"
                    anchors.centerIn: parent
                }
                background: Rectangle {
                    width: 40
                    height: 40
                    color:  "#fe9f06"
                    radius: Math.min(width, height)
                }
                onClicked:

                    calculator_text_equals.text +="+";
            }
        }
        Row{
            id: row5
            width:200
            height: 40
            spacing: 13.5
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            Layout.row: 5


            RoundButton{
                id: roundButton0
                width:90
                height: 40
                Image {
                    id: image0
                    x: 7
                    y: 6
                    width:34
                    height: 28
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/0.png"

                }
                background: Rectangle {
                    width: 90
                    height: 40
                    color: "#333333"
                    radius: Math.min(width, height)
                }


                onClicked: {
                    if (calculator_text_equals.text === "0") {
                        calculator_text_equals.text = "0";
                    } else {
                        calculator_text_equals.text += "0";

                    }
                }
            }


            RoundButton{
                id: roundButtonpoint
                width:40
                height: 40
                Image {
                    id: imagepoint
                    width: parent.width/2
                    height: parent.height/2
                    anchors.verticalCenterOffset: 6
                    anchors.horizontalCenterOffset: 0
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/point.png"
                    anchors.centerIn: parent
                }
                background: Rectangle {
                    width: 40
                    height: 40
                    color: "#333333"
                    radius: Math.min(width, height)
                }

                onClicked: {
                    if (calculator_text_equals.text.indexOf(".") === -1) {
                        calculator_text_equals.text += ".";
                    }
                }
            }
            RoundButton{
                id: roundButtonequals
                width:40
                height: 40
                Image {
                    id: imageequals
                    width: parent.width/2
                    height: parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/image/equals.png"
                    anchors.centerIn: parent
                }
                background: Rectangle {
                    width: 40
                    height: 40
                    color: "#fe9f06"
                    radius: Math.min(width, height)
                }


                onClicked: {


                    var inputExpression = calculator_text_equals.text;// 현재 계산식을 가져옴
                    Calculator.input_string = inputExpression; // Calculator의 input_string에 현재 계산식 설정
                    var result = Calculator.calculate(); // Calculator의 calculate() 함수를 이용하여 결과 계산
                    if(!Calculator.retValue)
                    {
                        calculator_text_equals.text = "";
                    }
                    else
                    {
                        calculator_text_equals.text = result.toString();  //계산 결과로 calculator_text_equals 업데이트
                        calculatorModel.append({ calculation: inputExpression+ "=", result: result }); // 계산식과 결과를 calculatorModel에 추가
                        if (calculatorModel.count > maxDisplayedExpressions) {
                                   //  문에서 첫 번째 매개변수로 값 0은 모델의 첫 번째 항목인 모델의 처음부터 제거가 시작됨을 나타냅니다. 두 번째 매개변수 값 '1'은 하나의 항목만 제거됨을 나타냅니다.
                                   calculatorModel.remove(0, 1);
                               }

                        calculator_text_equals.text = "0";
                    }


                }

            }
        }

    }

    ListView {
        id: listView
        x: 200
        y: 33
        width: 200
        height: 225

        model: calculatorModel


        delegate: Item {
            width: listView.width
            height: 22.5
            Row {
                spacing: 10

                Text {
                    // ListModel에서 계산식과 결과를 표시합니다
                    //text: calculatorModel.get(calculatorModel.count - 1 - index).calculation + calculatorModel.get(calculatorModel.count - 1 - index).result //리스트의 거꾸로 표시하는거 !
                    text: {
                                       var indexInModel = calculatorModel.count - 1 - index;
                                       if (indexInModel >= 0 && indexInModel < calculatorModel.count) {
                                           return calculatorModel.get(indexInModel).calculation + calculatorModel.get(indexInModel).result;
                                       } else {
                                           return ""; // 모델이 비어있거나 인덱스가 범위를 벗어난 경우 빈 문자열을 반환합니다.
                                       }
                                   }
                    color: "white"
                    font.pixelSize: 22

                }

            }

        }

        ListModel {
            id: calculatorModel


        }

        Text {
            id: element
            x: 0
            y: -32
            width: listView.width
            height: 30
            text: qsTr("계산기록")
            color:"white"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
        }

        Button {
            id: button
            x: 0
            y: 228
            width: 200
            text: qsTr("초기화")

            onClicked: {
                calculatorModel.clear(); // 리스트의 모든 항목을 삭제합니다.
            }
        }


    }
}

