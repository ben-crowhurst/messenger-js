# language: en

Feature: HTTP PUT
    In order to restrict the HTTP methods available
    As a collection owner
    I want to disallow the HTTP PUT method

    Scenario Outline: HTTP Put verb.
        Given I have started a message daemon
        When I perform a HTTP "PUT" request to "/messages" with headers "Content-Type: application/json, Accept: application/json":
        """
        " { "meta": {                                                                                        "
        "     "key": "3f71d374-c552-4359-8d9c-5a531cc4e041"                                                  "
        "   },                                                                                               "
        "   "data": {                                                                                        "
        "     "to": "ben.crowhurst@outlook.com",                                                             "
        "     "from": "ben.crowhurst@hotmail.com",                                                           "
        "     "message": "While you're waiting for the waiter, in that moment do you not become the waiter?" "
        "   }                                                                                                "
        " }                                                                                                  "
        """
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