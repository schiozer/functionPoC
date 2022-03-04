
global class FunctionMockImpl implements functions.FunctionInvokeMock {

    public functions.FunctionInvocation respond(String functionName, String payload) {
        // return mock success response
        String invocationId = '000000000000000';
        String response = 'mockResponse';
        return functions.MockFunctionInvocationFactory.createSuccessResponse(invocationId, response);
     }
}