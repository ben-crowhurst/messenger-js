# language: en

Feature: HTTP POST
    In order to create new resource instances
    As a collection consumer
    I want to allow the HTTP POST method

    Scenario Outline: HTTP Post verb.
        Given I have started a message daemon
        When I perform a HTTP "POST" request to "/messages" with headers "Content-Type: application/json, Accept: application/json":
        """
        " { "meta": {                                                          "
        "     "key": "bed0316c-d9c2-404b-8ac3-0540001bce99"                    "
        "   },                                                                 "
        "   "data": {                                                          "
        "     "to": "ben.crowhurst@outlook.com",                               "
        "     "from": "ben.crowhurst@hotmail.com",                             "
        "     "message": "If we were created in God's image, how do we exist?" "
        "   }                                                                  "
        " }                                                                    "
        """
        Then I should see a response status code of "201" "Created"
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
        And I should see a "Accept-Ranges" header value "none"
        And I should see a "Allow" header value "GET,HEAD,DELETE,OPTIONS"
        And I should see a "Location" header value
        And I should not see a "WWW-Authenticate" header value
        And I should not see a "Trailer" header value
        And I should not see a "Warning" header value
        And I should not see a "Content-Range" header value
        And I should not see a "Content-Encoding" header value
        And I should not see a "Content-Language" header value
        And I should not see a "Content-Location" header value
        And I should not see a "Retry-After" header value
        And I should not see a "Age" header value
        And I should not see a "Via" header value
        And I should not see a "Upgrade" header value
        And I should not see a "Transfer-Encoding" header value
        And I should not see a "Proxy-Authentication" header value
        And I should see a response body describing the resource:
        """
        " { "meta": {                                                          "
        "     "status": "pending",                                             "
        "     "key": "bed0316c-d9c2-404b-8ac3-0540001bce99"                    "
        "   },                                                                 "
        "   "data": {                                                          "
        "     "to": "ben.crowhurst@outlook.com",                               "
        "     "from": "ben.crowhurst@hotmail.com",                             "
        "     "message": "If we were created in God's image, how do we exist?" "
        "   }                                                                  "
        " }                                                                    "
        """
    
    Scenario Outline: HTTP Post verb, missing mandatory fields.
        Given I have started a message daemon
        When I perform a HTTP "POST" request to "/messages" with headers "Content-Type: application/json, Accept: application/json":
        """
        " { "meta": {                                                                              "
        "     "key": "bed0316c-d9c2-404b-8ac3-0540001bce99"                                        "
        "   },                                                                                     "
        "   "data": {                                                                              "
        "     "message": "If anything is possible, is it possiblef or something to be impossible?" "
        "   }                                                                                      "
        " }                                                                                        "
        """
        Then I should see a response status code of "400" "Bad Request"
        And I should see a "Content-Type" header value "application/json; charset=utf-8"
        And I should see a "Content-Length" header value "184"
        And I should see a "Server" header value "messengerd"
        And I should see a "Content-MD5" header value "9225118ddfd16d770600530a3e0ad4c0"
        And I should see a "Connection" header value "close"
        And I should see a "Expires" header value "0"
        And I should see a "Date" header value
        And I should see a "Pragma" header value "no-cache"
        And I should see a "Cache-Control" header value "private,max-age=0,no-cache,no-store"
        And I should see a "Content-Language" header value "en"
        And I should see a "Vary" header value "Accept,Accept-Encoding,Accept-Charset,Accept-Language"
        And I should not see a "WWW-Authenticate" header value
        And I should not see a "Allow" header value
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
        " { "data": {                                                                                                                       "
        "     "type": "error",                                                                                                              "
        "     "code": 40000,                                                                                                                "
        "     "status": 400,                                                                                                                "
        "     "title": "Bad Request",                                                                                                       "
        "     "message": "The service is refusing to process the request because the body contains invalid and/or missing property values." "
        "   }                                                                                                                               "
        " }                                                                                                                                 "
        """

    Scenario Outline: HTTP Post verb, malformed resource.
        Given I have started a message daemon
        When I perform a HTTP "POST" request to "/messages" with headers "Content-Type: application/json, Accept: application/json":
        """
        " { "data": 1."
        """
        Then I should see a response status code of "400" "Bad Request"
        And I should see a "Content-Type" header value "application/json; charset=utf-8"
        And I should see a "Content-Length" header value "159"
        And I should see a "Server" header value "messengerd"
        And I should see a "Content-MD5" header value "8670d665e9701c41d3a3baba9ab2ed9c"
        And I should see a "Connection" header value "close"
        And I should see a "Expires" header value "0"
        And I should see a "Date" header value
        And I should see a "Pragma" header value "no-cache"
        And I should see a "Cache-Control" header value "private,max-age=0,no-cache,no-store"
        And I should see a "Content-Language" header value "en"
        And I should see a "Vary" header value "Accept,Accept-Encoding,Accept-Charset,Accept-Language"
        And I should not see a "WWW-Authenticate" header value
        And I should not see a "Allow" header value
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
        " { "data": {                                                                               "
        "     "type": "error",                                                                      "
        "     "code": 40000,                                                                        "
        "     "status": 400,                                                                        "
        "     "title": "Bad Request",                                                               "
        "     "message": "The service is refusing to process the request because it was malformed." "
        "   }                                                                                       "
        " }                                                                                         "
        """

    Scenario Outline: HTTP Post verb, duplicate resource keys.
        Given I have started a message daemon
        And I perform a HTTP "POST" request to "/messages" with headers "Content-Type: application/json, Accept: application/json":
        """
        " { "meta": {                                                          "
        "     "key": "77e9e3b7-7b04-4b0a-b24d-61ac1036f02f"                    "
        "   },                                                                 "
        "   "data": {                                                          "
        "     "to": "ben.crowhurst@outlook.com",                               "
        "     "from": "ben.crowhurst@hotmail.com",                             "
        "     "message": "If we were created in God's image, how do we exist?" "
        "   }                                                                  "
        " }                                                                    "
        """
        And I should see a response status code of "201" "Created"
        When I perform a HTTP "POST" request to "/messages" with headers "Content-Type: application/json, Accept: application/json":
        """
        " { "meta": {                                                                   "
        "     "key": "77e9e3b7-7b04-4b0a-b24d-61ac1036f02f"                             "
        "   },                                                                          "
        "   "data": {                                                                   "
        "     "to": "ben.crowhurst@outlook.com",                                        "
        "     "from": "ben.crowhurst@hotmail.com",                                      "
        "     "message": "Two wrongs don't make a right, but tow Wrights make a plane." "
        "   }                                                                           "
        " }                                                                             "
        """
        Then I should see a response status code of "409" "Conflict"
        And I should see a "Content-Type" header value "application/json; charset=utf-8"
        And I should see a "Content-Length" header value "179"
        And I should see a "Server" header value "messengerd"
        And I should see a "Content-MD5" header value "d6e28fef3810e89efa34ce68141fd995"
        And I should see a "Connection" header value "close"
        And I should see a "Expires" header value "0"
        And I should see a "Date" header value
        And I should see a "Pragma" header value "no-cache"
        And I should see a "Cache-Control" header value "private,max-age=0,no-cache,no-store"
        And I should see a "Content-Language" header value "en"
        And I should see a "Vary" header value "Accept,Accept-Encoding,Accept-Charset,Accept-Language"
        And I should not see a "WWW-Authenticate" header value
        And I should not see a "Allow" header value
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
        "     "code": 40009,                                                                                               "
        "     "status": 409,                                                                                               "
        "     "title": "Conflict",                                                                                         "
        "     "message": "The service is refusing to process the request because of a conflict with an existing resource." "
        "   }                                                                                                              "
        " }                                                                                                                "
        """