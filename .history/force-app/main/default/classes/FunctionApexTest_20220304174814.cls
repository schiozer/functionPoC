@isTest
public  class FunctionApexTest {

    @isTest static void myTest() {
        String data = 'Teste do Fabio';

        Test.setMock( functions.FunctionMock.class, new FunctionsInvokeMockInner());

        String result = FunctionApex.gzipInfo(data);

        System.assert(result.length() > 0, 'Nao encriptado');
    }
}
