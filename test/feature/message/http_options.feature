# language: en

Feature: HTTP OPTIONS
    In order to determine HTTP operations available for a resource
    As a resource consumer
    I want to allow the HTTP OPTIONS method

    Scenario Outline: HTTP Options verb.
        Given I have started a message daemon
        And I perform a HTTP "POST" request to "/messages" with headers "Content-Type: application/json, Accept: application/json":
        """
        " { "meta": {                                                                          "
        "     "key": "d18d24dc-b2df-4897-8b89-9ff36e6532a7"                                    "
        "   },                                                                                 "
        "   "data": {                                                                          "
        "     "to": "ben.crowhurst@outlook.com",                                               "
        "     "from": "ben.crowhurst@hotmail.com",                                             "
        "     "message": "If God created the Sun on the fourth day, how had four days passed?" "
        "   }                                                                                  "
        " }                                                                                    "
        """
        And I should see a response status code of "201" "Accepted"
        When I perform a HTTP "OPTIONS" request to "/messages/d18d24dc-b2df-4897-8b89-9ff36e6532a7" with headers "Accept: application/json"
        Then I should see a response status code of "204" "No Content"
        And I should see a "Allow" header value "GET,HEAD,DELETE,OPTIONS"
        And I should see a "Server" header value "messengerd"
        And I should see a "Connection" header value "close"
        And I should see a "Accept-Ranges" header value "none"
        And I should see a "Expires" header value "0"
        And I should see a "Date" header value
        And I should see a "Pragma" header value "no-cache"
        And I should see a "Cache-Control" header value "private,max-age=0,no-cache,no-store"
        And I should see a "Vary" header value "Accept,Accept-Encoding,Accept-Charset,Accept-Language"
        And I should not see a "WWW-Authenticate" header value
        And I should not see a "Trailer" header value
        And I should not see a "Warning" header value
        And I should not see a "Last-Modified" header value
        And I should not see a "ETag" header value
        And I should not see a "Age" header value
        And I should not see a "Retry-After" header value
        And I should not see a "Location" header value
        And I should not see a "Content-MD5" header value
        And I should not see a "Content-Range" header value
        And I should not see a "Content-Encoding" header value
        And I should not see a "Content-Language" header value
        And I should not see a "Content-Location" header value
        And I should not see a "Content-Length" header value
        And I should not see a "Content-Type" header value
        And I should not see a "Via" header value
        And I should not see a "Upgrade" header value
        And I should not see a "Transfer-Encoding" header value
        And I should not see a "Proxy-Authentication" header value
        And I should see an empty response