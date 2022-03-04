@isTest
public  class FunctionApexTest {

    @isTest static void myTest() {
        String data = 'Teste do Fabio';

        String result = FunctionApex.gzipInfo(data);

        System.assert(result.length() > 0);
    }
}
