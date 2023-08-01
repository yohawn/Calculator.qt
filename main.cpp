#include <QGuiApplication>// GUI 어플리케이션을 만들 때 사용
#include <QQmlApplicationEngine>// QML 파일을 로드하고 실행하는 데 사용
#include <QQmlContext>//QML 엔진과 C++ 객체 간의 데이터를 교환
#include <Calculator.h>//

//C++ 프로그램의 진입점인 main 함수입니다.
//프로그램 실행 시 이 함수가 먼저 호출됩니다. argc와 argv는 명령행 인자들을 나타냅니다.

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);//고해상도 스케일링을 활성화

    //QGuiApplication 클래스의 객체 app을 생성합니다. GUI 어플리케이션을 만들 때 사용되는 클래스
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;// QML 파일을 로드하고 실행하는 데 사용되는 엔진

    //"main.qml" 파일을 로드합니다. QML 파일은 UI 레이아웃과 사용자 인터페이스를 정의
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    //QML 파일을 로드하는데 실패하면 종료됩니다.
    if (engine.rootObjects().isEmpty())
        return -1;

    //Calculator 클래스의 객체 ca를 동적으로 생성합니다. 이 객체를 QML에서 사용할 수 있다.
    Calculator *ca = new Calculator();
    //QML에서 Calculator 객체에 접근하여 해당 기능
    engine.rootContext()->setContextProperty("Calculator", ca);

    //이벤트 루프가 끝날 때까지 실행을 계속
    return app.exec();
}
