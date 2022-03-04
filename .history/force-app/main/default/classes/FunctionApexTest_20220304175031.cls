@isTest
public  class FunctionApexTest {

    @isTest static void myTest() {
        String data = 'Teste do Fabio';

        Test.setMock( functions.FunctionMock.class, new FunctionsInvokeMockInner());

        Test.startTest();

        String result = FunctionApex.gzipInfo(data);

        Test.stopTest();

        System.assert(result.length() > 0, 'Nao encriptado');
    }
}
