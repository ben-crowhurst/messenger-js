# language: en

Feature: HTTP GET
    In order to retrieve the current state of a resource
    As a resource consumer
    I want to allow the HTTP GET method

    Scenario Outline: HTTP Get verb.
        Given I have started a message daemon
        And I perform a HTTP "POST" request to "/messages" with headers "Content-Type: application/json, Accept: application/json":
        """
        " { "meta": {                                                          "
        "     "key": "7c3cf0d2-7445-4132-a2e6-13895756a613"                    "
        "   },                                                                 "
        "   "data": {                                                          "
        "     "to": "ben.crowhurst@outlook.com",                               "
        "     "from": "ben.crowhurst@hotmail.com",                             "
        "     "message": "If we were created in God's image, how do we exist?" "
        "   }                                                                  "
        " }                                                                    "
        """
        And I should see a response status code of "201" "Accepted"
        When I perform a HTTP "GET" request to "/messages/7c3cf0d2-7445-4132-a2e6-13895756a613" with headers "Accept: application/json"
        Then I should see a response status code of "200" "OK"
        And I should see a "Server" header value "messengerd"
        And I should see a "Content-Type" header value "application/json; charset=utf-8"
        And I should see a "Content-Length" header value "232"
        And I should see a "Content-MD5" header value
        And I should see a "Connection" header value "close"
        And I should see a "Date" header value
        And I should see a "ETag" header value
        And I should see a "Last-Modified" header value
        And I should see a "Expires" header value "0"
        And I should see a "Pragma" header value "no-cache"
        And I should see a "Cache-Control" header value "private,max-age=0,no-cache,no-store"
        And I should see a "Vary" header value "Accept,Accept-Encoding,Accept-Charset,Accept-Language"
        And I should not see a "WWW-Authenticate" header value
        And I should not see a "Trailer" header value
        And I should not see a "Warning" header value
        And I should not see a "Accept-Ranges" header value
        And I should not see a "Content-Range" header value
        And I should not see a "Content-Encoding" header value
        And I should not see a "Content-Language" header value
        And I should not see a "Content-Location" header value
        And I should not see a "Retry-After" header value
        And I should not see a "Allow" header value
        And I should not see a "Age" header value
        And I should not see a "Via" header value
        And I should not see a "Upgrade" header value
        And I should not see a "Transfer-Encoding" header value
        And I should not see a "Proxy-Authentication" header value
        And I should not see a "Location" header value
        And I should see a response body describing the resource:
        """
        " { "meta": {                                                          "
        "     "status": "pending",                                             "
        "     "key": "7c3cf0d2-7445-4132-a2e6-13895756a613"                    "
        "   },                                                                 "
        "   "data": {                                                          "
        "     "to": "ben.crowhurst@outlook.com",                               "
        "     "from": "ben.crowhurst@hotmail.com",                             "
        "     "message": "If we were created in God's image, how do we exist?" "
        "   }                                                                  "
        " }                                                                    "
        """

    Scenario Outline: HTTP Get verb, non-existent resource.
        Given I have started a message daemon
        When I perform a HTTP "GET" request to "/messages/2b1456f3-0d64-4823-9922-923b655e22fe" with headers "Accept: application/json"
        Then I should see a response status code of "404" "Not Found"
        And I should see a "Server" header value "messengerd"
        And I should see a "Content-Type" header value "application/json; charset=utf-8"
        And I should see a "Content-Length" header value "181"
        And I should see a "Content-MD5" header value "8cf1a2abe9cf949d737d4aae1dd3b45c"
        And I should see a "Connection" header value "close"
        And I should see a "Expires" header value "0"
        And I should see a "Date" header value
        And I should see a "Pragma" header value "no-cache"
        And I should see a "Cache-Control" header value "private,max-age=0,no-cache,no-store"
        And I should see a "Content-Language" header value "en"
        And I should see a "Vary" header value "Accept,Accept-Encoding,Accept-Charset,Accept-Language"
        And I should not see a "WWW-Authenticate" header value
        And I should not see a "Trailer" header value
        And I should not see a "Warning" header value
        And I should not see a "Accept-Ranges" header value
        And I should not see a "ETag" header value
        And I should not see a "Last-Modified" header value
        And I should not see a "Allow" header value
        And I should not see a "Age" header value
        And I should not see a "Via" header value
        And I should not see a "Upgrade" header value
        And I should not see a "Transfer-Encoding" header value
        And I should not see a "Proxy-Authentication" header value
        And I should not see a "Retry-After" header value
        And I should not see a "Content-Range" header value
        And I should not see a "Content-Encoding" header value
        And I should not see a "Content-Location" header value
        And I should not see a "Location" header value
        And I should see the error response:
        """
        " { "data": {                                                                                                        "
        "     "type": "error",                                                                                               "
        "     "code": 40004,                                                                                                 "
        "     "status": 404,                                                                                                 "
        "     "title": "Not Found",                                                                                          "
        "     "message": "The service is refusing to process the request because the requested resource could not be found." "
        "   }                                                                                                                "
        " }                                                                                                                  "
        """