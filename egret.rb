require 'socket'
require 'ipaddr'
include Socket::Constants

host = ARGV[0]
addrinfo = Socket.getaddrinfo(host, "http")[0]
s = Socket.new Object.const_get(addrinfo[0]), SOCK_STREAM
s.connect Socket.sockaddr_in(addrinfo[1], addrinfo[2])
s.write( "GET / HTTP/1.1\r\nHost: #{host}\r\nConnection: close\r\n\r\n" )
p s.read
