codeunit 50350 "HelloWorld.Test"
{
    Subtype = Test;

    [Test]
    [HandlerFunctions('HelloWorldMessageHandler')]
    procedure TestHelloWorldMessage()
    var
        CustList: TestPage "Customer List";
    begin
        CustList.OpenView();
        CustList.Close();
        if (not MessageDisplayed) then ERROR('Message was not displayed!');
    end;

    [Test]
    [HandlerFunctions('HelloWorldMessageHandler1')]
    procedure TestHelloWorldMessage1()
    var
        CustList: TestPage "Customer List";
    begin
        CustList.OpenView();
        CustList.Close();
        if (not MessageDisplayed) then ERROR('Message was not displayed!');
    end;

    [MessageHandler]
    procedure HelloWorldMessageHandler(Message: Text[1024])
    begin
        MessageDisplayed := MessageDisplayed or (Message = 'App Published: Hello World Base!');
    end;

    [MessageHandler]
    procedure HelloWorldMessageHandler1(Message: Text[1024])
    begin
        MessageDisplayed := (Message = 'PIPPO');
    end;

    var
        MessageDisplayed: Boolean;
}