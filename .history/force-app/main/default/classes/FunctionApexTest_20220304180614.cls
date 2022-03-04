@isTest
public  class FunctionApexTest {

    @isTest static void myTest() {
        String data = '{data : "Teste do Fabio"}';

        Test.setMock(functions.FunctionInvokeMock.class, new FunctionsInvokeMockInner());
        functions.Function mockedFunction = functions.Function.get('functionPoC.gzipinfo');

        Test.startTest();

        mockedFunction.invoke(data, new DemoCallback());

        Test.stopTest();

        System.assert(result.length() > 0, 'Nao encriptado');
    }

    public class DemoCallback implements functions.FunctionCallback {
        public void handleResponse(functions.FunctionInvocation invokeResult) {
            // Handle result of function invocation
            // The callback is included in the example here for convenience
            // It would normally be defined in the classes being tested

            // Verify that the received response contains expected mock values
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

            if(functionName == 'example.function2') {
                return functions.MockFunctionInvocationFactory.createErrorResponse(
                    invocationId,
                    functions.FunctionErrorType.FUNCTION_EXCEPTION,
                    'bang');
            }

            String response = 'mockResponse';
            return functions.MockFunctionInvocationFactory.createSuccessResponse(invocationId, response);
        }
    }
}
