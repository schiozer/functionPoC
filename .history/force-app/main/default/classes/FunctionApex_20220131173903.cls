public with sharing class FunctionApex {

    @AuraEnabled(cacheable=true)
    public static String gzipInfo(String data) {

        System.debug('Invoking myfunction');

        functions.Function myFunction = functions.Function.get('MyFunctionProject.myfunction');
        functions.FunctionInvocation invocation = myFunction.invoke(data);

        String jsonResponse = invocation.getResponse();

        System.debug('Response from myfunction ' + jsonResponse);
    }
}