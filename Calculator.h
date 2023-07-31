// 헤더 파일의 중복 포함을 방지하기 위한 전처리기 지시문
#ifndef CALCULATOR_H
#define CALCULATOR_H
// 필요한 헤더파일 포함
#include <QObject> //Qt 프레임워크의 기반이 되는 클래스로, 객체 간의 통신과 이벤트 처리
#include <iostream> //C++의 표준 입출력 스트림
#include <QVariant> //Qt에서 제공하는 여러 타입의 값을 하나의 변수로 표현

//Calculator 클래스를 정의하고 Claculator의 클래스는 QObject 클래스를 상속받음
class Calculator : public QObject
{
    Q_OBJECT//매크로는 Qt의 메타 오브젝트 시스템에 클래스를 등록하는 데 사용
    // READ, WRITE, 그리고 NOTIFY 매크로를 사용하여 속성에 접근하고 변경될 때 시그널을 발생
    Q_PROPERTY(double result READ getResult WRITE setResult NOTIFY resultChanged)
    Q_PROPERTY(QVariant input_string READ getInput_string WRITE setInput_string NOTIFY input_stringChanged)
    Q_PROPERTY(bool retValue READ getRetvalue)

public:  //public 섹션에서는 클래스의 공용 멤버 함수들을 선언
    Calculator();  //생성자
    ~Calculator();  //소멸자

    void setNumber(double num1, double num2) { this->num1 = num1; this->num2 = num2; }
    double getResult() { return result; }
    void setInput_string(QVariant input_string) { this->input_string = input_string; emit input_stringChanged(); } //시그널 발생
    QVariant getInput_string() { return input_string; }

    bool getRetvalue() {return retValue;} //cpp에서bool타입을 받아오고 qml로 bool타입넘겨준다.

    double add();
    double subtract();
    double multiply();
    double divide();
    Q_INVOKABLE double calculate();


private:   // 함수
    bool retValue;
    double num1;
    double num2;
    double result;
    QVariant input_string;

protected:   //protected 섹션에서는 기반 클래스를 상속받은 파생 클래스에서 사용 가능한 멤버 함수를 선언
    void setResult(double result) { this->result = result; emit resultChanged(); } //시그널 발생
    double getNum1() { return num1; }
    double getNum2() { return num2; }




signals:
    void input_stringChanged();
    void resultChanged();


};

#endif // CALCULATOR_H
