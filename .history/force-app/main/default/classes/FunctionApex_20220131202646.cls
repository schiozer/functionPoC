public with sharing class FunctionApex {

    @AuraEnabled(cacheable=true)
    public static String gzipInfo(String data) {

        System.debug('Invoking myfunction: ' + data);

        
        functions.Function myFunction = functions.Function.get('functionPoC.gzipinfo');
        functions.FunctionInvocation invocation = myFunction.invoke(data);

        String jsonResponse = invocation.getResponse();

        System.debug('Response from myfunction ' + jsonResponse);

        return jsonResponse;
    }

    public class MyJSONObj{
        public String AccountName;
        public String AccountId;
    }
}