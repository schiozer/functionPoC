@isTest
public  class FunctionApexTest {

    @isTest static void myTest() {

        String data = JSON.serialize('hvbjdfhbvdjkhbfvkjdhfbv');

        Test.setMock(functions.FunctionInvokeMock.class, new FunctionsInvokeMockInner());
		functions.Function mockedFunction = functions.Function.get('functionPoC.gzipinfo');
        
        Test.startTest();

        mockedFunction.invoke(data, new DemoCallback());

        Test.stopTest();
    }
    
    @isTest static void myTest2() {

        String data = JSON.serialize('fabio');

        Test.setMock(functions.FunctionInvokeMock.class, new FunctionsInvokeMockInner2());
		functions.Function mockedFunction = functions.Function.get('functionPoC.gzipinfo');
        
        Test.startTest();

        String result = FunctionApex.gzipInfo(data);

        Test.stopTest();
        
        System.assertEquals('mockResponse', result);
    }

    public class DemoCallback implements functions.FunctionCallback {
        
        public void handleResponse(functions.FunctionInvocation invokeResult) {

            System.assertEquals(invokeResult.getStatus(), functions.FunctionInvocationStatus.ERROR);
            functions.FunctionInvocationError resultError = invokeResult.getError();
            System.assertEquals('bang', invokeResult.getError().getMessage());
            System.assertEquals('000000000000000', invokeResult.getInvocationId());

        }
    }

    public class FunctionsInvokeMockInner implements functions.FunctionInvokeMock {
        public functions.FunctionInvocation respond(String functionName, String payload) {
            // return mock success response
            String invocationId = '000000000000000'; 

            if(functionName == 'functionPoC.gzipinfo') {
                return functions.MockFunctionInvocationFactory.createErrorResponse(
                    invocationId,
                    functions.FunctionErrorType.FUNCTION_EXCEPTION,
                    'bang');
            }

            String response = 'mockResponse';
            return functions.MockFunctionInvocationFactory.createSuccessResponse(invocationId, response);
        }
    }
    
    public class FunctionsInvokeMockInner2 implements functions.FunctionInvokeMock {
        public functions.FunctionInvocation respond(String functionName, String payload) {
            // return mock success response
            String invocationId = '000000000000000'; 

            String response = 'mockResponse';
            return functions.MockFunctionInvocationFactory.createSuccessResponse(invocationId, response);
        }
    }
}