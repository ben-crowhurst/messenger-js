# language: en

Feature: HTTP PATCH
    In order to restrict the HTTP methods implemented
    As a resource owner
    I want to disallow the HTTP PATCH method

    Scenario Outline: HTTP Patch verb.
        Given I have started a message daemon
        And I perform a HTTP "POST" request to "/messages" with headers "Content-Type: application/json, Accept: application/json":
        """
        " { "meta": {                                                                    "
        "     "key": "dcd87c77-ee03-4cf2-9968-0f49a8f8d79a"                              "
        "   },                                                                           "
        "   "data": {                                                                    "
        "     "to": "ben.crowhurst@outlook.com",                                         "
        "     "from": "ben.crowhurst@hotmail.com",                                       "
        "     "message": "If we are all God's children, then why is jesus his only son?" "
        "   }                                                                            "
        " }                                                                              "
        """
        And I should see a response status code of "201" "Accepted"
        When I perform a HTTP "PATCH" request to "/messages/dcd87c77-ee03-4cf2-9968-0f49a8f8d79a" with headers "Content-Type: application/json, Accept: application/json":
        """
        " { "data": {                         "
        "     "to": "ben.crowhurst@gamil.com" "
        "   }                                 "
        " }                                   "
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