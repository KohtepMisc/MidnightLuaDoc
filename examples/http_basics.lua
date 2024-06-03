--[[
    This Lua script demonstrates how to make synchronous and asynchronous HTTP requests.
    It uses a HTTP module to perform GET, POST, and HEAD requests to the httpbin.org API.
    Synchronous requests are made sequentially first, followed by asynchronous requests which
    are nested to ensure that they execute in sequence without causing race conditions.
]]

-- Callback function to handle responses for synchronous requests
local function handle_response(http_code, response_size, response_text, context)
    print("HTTP code:", http_code)
    print("Response size:", response_size)
    print("Response text:", response_text)
end

-- Synchronous GET request
local get_request = http.create_request(http.HttpMethod_t.GET, "http://httpbin.org/get")
http.send(get_request, handle_response)
http.release(get_request)

-- Synchronous POST request
local post_data = "key1=value1&key2=value2"
local post_request = http.create_request(http.HttpMethod_t.POST, "http://httpbin.org/post")
http.set_body(post_request, post_data)
http.send(post_request, handle_response)
http.release(post_request)

-- Synchronous HEAD request
local head_request = http.create_request(http.HttpMethod_t.HEAD, "http://httpbin.org/get")
http.send(head_request, handle_response)
http.release(head_request)

-- Asynchronous GET request
http.get("http://httpbin.org/get", function(http_code, response_size, response_text, context)
    print("Asynchronous GET request:")
    print("HTTP code:", http_code)
    print("Response size:", response_size)
    print("Response text:", response_text)

    -- Asynchronous POST request with test data initiated within the GET request callback
    local post_data = "key1=value1&key2=value2"
    http.post("http://httpbin.org/post", post_data, function(http_code, response_size, response_text, context)
        print("Asynchronous POST request:")
        print("HTTP code:", http_code)
        print("Response size:", response_size)
        print("Response text:", response_text)

        -- Asynchronous HEAD request initiated within the POST request callback
        http.head("http://httpbin.org/get", function(http_code, response_size, response_text, context)
            print("Asynchronous HEAD request:")
            print("HTTP code:", http_code)
            print("Response size:", response_size)
            print("Response text:", response_text)
        end)
    end)
end)