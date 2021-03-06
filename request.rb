require 'uri'
require 'net/http'
require 'openssl'
require 'json'  

def request(url)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port) #http --> config de la peticion
    request = Net::HTTP::Get.new(uri) #request --> peticion
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    response = http.request(request)

    return JSON.parse(response.read_body)
end