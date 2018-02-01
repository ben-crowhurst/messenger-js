# language: en

Feature: HTTP TRACE
    In order to restrict the HTTP methods implemented
    As a collection owner
    I want to disallow the HTTP TRACE method

    Scenario Outline: HTTP Trace verb.
        Given I have started a message daemon
        When I perform a HTTP "TRACE" request to "/attachments" with headers "Accept: application/json"
        Then I should see a response status code of "501" "Not Implemented"
        And I should see a "Content-Type" header value "application/json; charset=utf-8"
        And I should see a "Content-Length" header value "185"
        And I should see a "Server" header value "messengerd"
        And I should see a "Content-MD5" header value "7242942a42b52c2b6ccf198cbedf0e4c"
        And I should see a "Connection" header value "close"
        And I should see a "Allow" header value "GET,HEAD,POST,DELETE,OPTIONS"
        And I should see a "Expires" header value "0"
        And I should see a "Date" header value
        And I should see a "Pragma" header value "no-cache"
        And I should see a "Cache-Control" header value "private,max-age=0,no-cache,no-store"
        And I should see a "Content-Language" header value "en"
        And I should see a "Vary" header value "Accept,Accept-Encoding,Accept-Charset,Accept-Language"
        And I should not see a "WWW-Authenticate" header value
        And I should not see a "Trailer" header value
        And I should not see a "Warning" header value
        And I should not see a "Via" header value
        And I should not see a "Upgrade" header value
        And I should not see a "Transfer-Encoding" header value
        And I should not see a "Proxy-Authentication" header value
        And I should not see a "Content-Range" header value
        And I should not see a "Content-Encoding" header value
        And I should not see a "Content-Location" header value
        And I should not see a "Accept-Ranges" header value
        And I should not see a "Retry-After" header value
        And I should not see a "ETag" header value
        And I should not see a "Age" header value
        And I should not see a "Location" header value
        And I should not see a "Last-Modified" header value
        And I should see the error response:
        """
        " { "data": {                                                                                                      "
        "     "type": "error",                                                                                             "
        "     "code": 50001,                                                                                               "
        "     "status": 501,                                                                                               "
        "     "title": "Not Implemented",                                                                                  "
        "     "message": "The service is refusing to process the request because the requested method is not implemented." "
        "   }                                                                                                              "
        " }                                                                                                                "
        """