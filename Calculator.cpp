#include "Calculator.h"
#include <QDebug>
#include <QVariant>
#include <iostream>
#include <string>
#include <sstream>  // stringstream 라이브러리
#include <iomanip>  // fixed 라이브러리
#include <cmath>  // setprecision 라이브러리


using namespace std;

Calculator::Calculator(){}
Calculator::~Calculator(){}

//Calculator 클래스의 멤버 함수
double Calculator:: calculate () {

    //qml 에서 QVariant 변수인 input_string을 input_exp라는 C++ std::string 유형으로 변환합니다.
    //input_string은 QString 형식의 입력 표현식을 포함하는 Calculator 클래스의 멤버 변수인 것 같습니다.

    string input_exp = input_string.toString().toStdString();

    //이 변수는 입력 표현식에서 추출한 숫자 값과 산술 연산자를 저장하도록 선언됩니다.
    double num1, num2;
    char sign;
    retValue = true;  //qml 인자 true,false받는거

    //num1, num2 초기화
    num1 = 0; num2 = 0;

    //stringstream stream(input_exp);: std::stringstream 객체 stream을 생성하고
    //input_exp 문자열로 초기화합니다.
    //stringstream은 형식이 지정된 입력 작업을 수행할 수 있으므로 문자열을 다른 데이터 유형으로
    //변환하는 데 유용합니다.


    stringstream stream(input_exp);
    stream >> num1;
    stream >> sign;
    stream >> num2;


    size_t len = input_exp.length();  // 이 줄은 입력 표현식 input_exp의 길이를 계산
    size_t sign_index = input_exp.find(sign);  //input_exp 문자열 내에서 sign 문자(산술 연산자)의 인덱스
    //명시적형변환  -unsigned int 양수일때만 / size_t 음양수 전부 일때

    // 1. bool 타입 레퍼런스 넘겨주는거 항이 3개일때 경우
    // 2. num1 혹은 num2 가 비워있는 경우
    // 3. 입력한 문자열이 길이가 9 이하인지판단하는 경우
    char ch[] = {'-', '+','X', '/'};  // 입력된 연산자와 비교하기 위한 연산자 배열 선언
    char sign_arr;
    bool signchack = false;
    for(int i = 0; i < 3; i++) {
        sign_arr = ch[i];

        if(input_exp.find(sign_arr,sign_index+1)!= std::string::npos)
        {
            signchack = true;
            retValue = false;
            return 0.0;
        }
    }

    if(num1 < 0 || num2 <= 0) {
        retValue = false;
        return 0.0;
    }
    if(len > 9) {
        retValue = false;
        return 0.0;
    }


    // 계산 로직이 정상적으로 작동하는 경우
    if  (!(fabs(num1) == 1e-9) && !(fabs(num2) == 1e-9) && (sign == '+' || sign == '-' || sign == '*' || sign == '/') && !isnan(result))
    {
        switch (sign) {
        case '+':
            setNumber(num1, num2);
            result = add();
            break;
        case '-':
            setNumber(num1, num2);
            result = subtract();
            break;
        case '*':
            setNumber(num1, num2);
            result = multiply();
            break;
        case '/':
            if ((fabs(num2) == 0)) {
                retValue = false;
                return 0.0;
            }
            setNumber(num1, num2);
            result = divide();
            result = std::round(result * 10000.0) / 10000.0;  //소수점 4번째 자리까지만
            break;

        default:
            break;
        }

    }

    return result;
}



double Calculator::add() {
    return getNum1() + getNum2();
}

double Calculator::subtract() {
    return getNum1() - getNum2();
}

double Calculator::multiply() {
    return getNum1() * getNum2();
}

double Calculator::divide() {
    return getNum1() / getNum2();
}



