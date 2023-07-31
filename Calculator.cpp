#include "calculator.h"
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



double Calculator:: calculate () {

    // qml에서 가져온 input_string를 QVariant -> String 으로 형변환
    string input_exp = input_string.toString().toStdString();

    double num1, num2;
    char sign;
    retValue = true;


    // 2번을 예외상황을 처리하기 위해 num1, num2 초기화
    num1 = 0; num2 = 0;

    stringstream stream(input_exp);
    stream >> num1;
    stream >> sign;
    stream >> num2;


    size_t len = input_exp.length();  // 입력받은 문자열 길이 구하기
    size_t sign_index = input_exp.find(sign);  // sign 인덱스
    //명시적형변환
    //포인터형변환
    //size_t를 사용하면 std::string에 대한 length() 함수의 반환 유형이 size_t이므로 변수가 문자열의 크기를 나타내는 음수가 아닌 값

    //1/bool 타입 레퍼런스 넘겨주는거 3개의 항일떄 !
    //2. num1 혹은 num2 가 비었는지 판단
   // 3. 입력한 문자열이 길이가 9 이하인지 판단
    char ch[] = {'-', '+', 'X', '/'};  // 입력된 연산자와 비교하기 위한 연산자 배열 선언
    char sign_arr;
    bool sign2 = true;
    for(int i = 0; i < 3; i++) {
        sign_arr = ch[i];

        if(input_exp.find(sign_arr,sign_index+1)!= std::string::npos)
        {
            sign2 = true;
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
    if  (!(fabs(num1) ==1e-9) && !(fabs(num2) == 1e-9) && (sign == '+' || sign == '-' || sign == '*' || sign == '/') && !isnan(result))
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
            if (num1 <= 0 && num2 <= 0) {
                setNumber(num1, num2);
                result = divide();
            }
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



