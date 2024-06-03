---@diagnostic disable

---@meta _

--- @enum HttpMethod_t
local HttpMethod_t = {
    GET = 1,   -- Corresponds to HTTP GET method.
    POST = 2,  -- Corresponds to HTTP POST method.
    HEAD = 3   -- Corresponds to HTTP HEAD method.
}

---@module http
http = {}

--- Creates a new HTTP request.
---@param method HttpMethod_t Method type (GET, POST, etc.)
---@param url string The URL to which the request will be sent.
---@return HttpHandle_t The handle to the newly created HTTP request.
---@nodiscard
function http.create_request(method, url) end

--- Sends a HTTP request.
---@param handle HttpHandle_t The handle to the HTTP request.
---@param on_response fun(http_code: number, response_size: number, response_text: string, context: number) The callback function to handle the response.
---@return boolean Returns true if the request was successfully sent.
function http.send(handle, on_response) end

--- Releases a HTTP request.
---@param request HttpHandle_t The handle to the HTTP request to be released.
---@return boolean Returns true if the request was successfully released.
function http.release(request) end

--- Checks if the HTTP request is currently being processed.
-- This function checks if the specified HTTP request handle is busy.
-- A request is considered busy if it is currently being sent.
--@param request HttpHandle_t The handle to the HTTP request.
--@return boolean Returns true if the request is currently busy (being sent); otherwise, returns false.
--@nodiscard
function http.is_busy(request) end

--- Sets a context value for the HTTP request.
--- This value can be used by the developer to identify which request was passed
--- to the on_response callback. By default, all context fields are set to 0.
---@param request HttpHandle_t The handle to the HTTP request.
---@param value number The context value to set.
---@return boolean Returns true if the context value was successfully set.
function http.set_context(request, value) end

--- Sets a header value for the HTTP request.
---@param request HttpHandle_t The handle to the HTTP request.
---@param name string The name of the header.
---@param value string The value of the header.
---@return boolean Returns true if the header was successfully set.
---@example
--- local request = http.create_request("https://api.example.com")
--- local result = http.set_header(request, "User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64)")
--- assert(result == true)
function http.set_header(request, name, value) end

--- Sets the body of an HTTP request.
--- This function allows you to define the payload for an HTTP POST request by setting the body of the request.
--- It takes the handle to the HTTP request as the first argument and a string containing the data to be sent as the second argument.
---
--- @param request HttpHandle_t The handle to the HTTP request.
--- @param body string The data to be sent as the body of the request.
--- @return boolean Returns true if the body was successfully set, otherwise returns false.
--- @nodiscard
--- @example
--- local request = http.create_request(http.HttpMethod_t.POST, "https://api.example.com/data")
--- local success = http.set_body(request, '{"name":"John", "age":30}')
--- assert(success, "Failed to set the request body")
function http.set_body(request, body) end

--- Performs an asynchronous HTTP GET request.
---@param url string The URL to request.
---@param on_response fun(http_code: number, response_size: number, response_text: string, context: number) The callback function to handle the response.
function http.get(url, on_response) end

--- Performs an asynchronous HTTP POST request.
---@param url string The URL to send data to.
---@param body string The data to be sent in the body of the POST request.
---@param on_response fun(http_code: number, response_size: number, response_text: string, context: number) The callback function to handle the response.
function http.post(url, body, on_response) end

--- Performs an asynchronous HTTP HEAD request.
---@param url string The URL to request.
---@param on_response fun(http_code: number, response_size: number, response_text: string, context: number) The callback function to handle the response.
function http.head(url, on_response) end