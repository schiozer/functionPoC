public with sharing class FunctionApex {

    @AuraEnabled(cacheable=true)
    public static String gzipInfo(String data) {

        System.debug('Invoking myfunction');

        functions.Function myFunction = functions.Function.get('gzipinfo.gzipinfo');
        functions.FunctionInvocation invocation = myFunction.invoke(data);

        String jsonResponse = invocation.getResponse();

        System.debug('Response from myfunction ' + jsonResponse);
    }
}