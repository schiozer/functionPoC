public with sharing class FunctionApex {

    @AuraEnabled(cacheable=true)
    public static String gzipInfo(String data) {

        System.debug('Invoking myfunction: ' + data);
        
        MyJSOObj o = new MyJSOObj();
        o.accountId = '1232345435';
        o.accountName = 'Teste do Mar';

        String sending = JSON.serialize(o);
        
        functions.Function myFunction = functions.Function.get('functionPoC.gzipinfo');
        functions.FunctionInvocation invocation = myFunction.invoke(sending);

        String jsonResponse = invocation.getResponse();

        System.debug('Response from myfunction ' + jsonResponse);

        return jsonResponse;
    }

    public class MyJSOObj{
        public String accountName;
        public String accountId;
    }
}