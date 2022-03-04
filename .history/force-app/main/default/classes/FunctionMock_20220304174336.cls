
global class FunctionMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        HTTPResponse response = new HTTPResponse();
        response.setStatus(200);
        response.setBody('body');
            // return response.
    }
}