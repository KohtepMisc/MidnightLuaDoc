---@diagnostic disable

---@meta _

---@class UDPSocket
UDPSocket = {}

--- Opens a UDP socket on the specified port. If no port is specified, the socket is bound to a random port.
---@param port number? Optional port number to bind the socket.
---|> 0
---@return boolean True if the socket was successfully opened, false otherwise.
function UDPSocket:open(port) end

--- Closes the UDP socket.
---@return boolean True if the socket was successfully closed, false otherwise.
function UDPSocket:close() end

--- Checks if the UDP socket is currently open and available.
---@return boolean True if the socket is open, false otherwise.
function UDPSocket:is_opened() end

--- Retrieves the port number to which the socket is bound.
---@return number Port number of the socket.
function UDPSocket:get_port() end

--- Retrieves the IP address associated with the socket.
---@return string IP address of the socket.
function UDPSocket:get_ip() end

--- Retrieves the complete address (IP and port) of the socket.
---@return string Address of the socket in the format "ip:port".
function UDPSocket:get_addr() end

--- Sends data to the specified address.
---@param address string The destination address in the format "ip:port".
---@param data string The data to send.
---@return boolean True if the data was sent successfully, false otherwise.
function UDPSocket:send(address, data) end

--- Receives data from the socket. This is a blocking call unless the socket is non-blocking.
---@return table Data received, returned as an array of bytes.
function UDPSocket:recv() end

--- Checks if there is incoming data on the socket.
---@return boolean True if there is incoming data, false otherwise.
function UDPSocket:has_incoming() end

--- Gets the size of the incoming data available on the socket.
---@return number Size of the available data in bytes.
function UDPSocket:get_incoming_size() end

--- Creates a new UDP socket. This function can be called with or without specifying a port number.
-- When called without a port, the socket is bound to a random port. When a port is specified, the socket is bound to that port.
-- @overload fun(): UDPSocket
-- @overload fun(port: number): UDPSocket
-- @param port? number Optional port number to bind the socket.
---|> 0
-- @return UDPSocket A new instance of a UDPSocket, opened and ready for communication.
function udp_client(port) end