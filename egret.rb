require 'socket'
require 'uri'
include Socket::Constants

uri = URI(ARGV[0])
addrinfo = Socket.getaddrinfo(uri.host, uri.scheme)[0]
s = Socket.new Object.const_get(addrinfo[0]), SOCK_STREAM
s.connect Socket.sockaddr_in(addrinfo[1], addrinfo[2])
s.write( "GET #{uri.path} HTTP/1.1\r\nHost: #{uri.host}\r\nConnection: close\r\n\r\n" )
p s.read
