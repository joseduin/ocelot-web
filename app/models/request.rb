class Request
  require 'rest-client'
  require 'json'
  require 'open-uri'
  
  $path = "https://fox-desktop-joseduin.c9users.io"
   
  $base_url = 'https://fox-hound.herokuapp.com'
#  $base_url = 'http://foxhound.sytes.net:9000'
  #$base_url = 'http://foxhound.zapto.org:9000'
#  $base_url = 'http://foxhound.webhop.me:9000'
#  $base_url = '172.19.24.114:8080'

  
 # $base_url = 'https://fox-hound.herokuapp.com'
#  $base_url = 'http://foxhound.zapto.org:9000'
#  $base_url = 'http://foxhound.webhop.me:9000'
#   $base_url = 'http://foxhound.sytes.net:9000'

#$base_url = '10.10.0.108:8080'

#  $base_url = '127.0.0.1:8080'



  def initialize
    @code = 521 # Web Server Is Down
  end
  
  # @param page: url a consultar
  # @return [ code, response ]
  #
  #== Ejemplo
  #   consultar('usuario/1')
  #     # => 200 - Ok
  #     # => { usuario: { name: 'Jose', password: 'OASLSDJAJAS' } }
  def consultar(page)
    do_request(1, page, nil)
  end

  # @param page: url
  # @param parametro: json a insertar
  # @return [ code, response ] 
  # 
  #== Ejemplo
  #   parametro = { name: 'Patricia', password: '1234' }
  #   insertar('usuario', parametro)
  #     # => 200 - Ok
  #     # => { usuario: { id: 1, name: 'Patricia', password: 'OASLSDJAJAS' } }   
  def insertar(page, parametro)
    do_request(2, page, parametro.to_json)
  end
  
  # @param page: url
  # @param parametro: json a modificar
  # @return code
  #
  #== EJEMPLO
  #   parametro = { id: 1, name: 'Patricia Duarte', password: 'OASLSDJAJAS' }
  #   actualizar('usuarios', parametro)
  #     # => 200 - OK
  def actualizar(page, parametro)
    do_request(3, page, parametro.to_json)
  end
  
  # @param page: url
  # @return code
  #
  #== EJEMPLO
  #   eliminar('usuario/1')
  #     # => 200 - OK
  def eliminar(page)
    do_request(4, page, nil)
  end
  
  # @param page: url
  # @return [ code, filePath ]
  #
  #== Ejemplo
  #   report('simplePDF')
  #     # => 200 - Ok
  #     # => filePath
  def report(page)
    do_request(5, page, nil)
  end
  
  def login(page)
    do_request(6, page, nil)
  end
  
  private
  
  # Metodo:   1. GET
  #           2. POST
  #           3. PUT / PATCH
  #           4. DELETE
  #           5. Generate PDF
  def do_request(metodo, page, parametro, body = nil)
    url = "#{$base_url}/#{page}"
    puts url
    begin
      case metodo
        when 1, 5, 6
          response = RestClient.get(url) 
        when 2
          response = RestClient.post(url, parametro, { :content_type => 'application/json' } )
        when 3
          response = RestClient.put(url, parametro, { :content_type => 'application/json' } )
        when 4
          response = RestClient.delete(url)
      end
    rescue RestClient::ServiceUnavailable
      @code = 503 # Service Unavailable
    rescue RestClient::BadRequest
      @code = 400 # Bad Request
    rescue RestClient::InternalServerError
      @code = 500 # Internal Server Error
    rescue RestClient::NotFound
      @code = 404 # Not Found
    else
      @code = 200#response.code
      # Delete no genera ningun mensaje
      body = metodo == 5 ? do_report(response) : httpRequest(response)
      token = metodo == 6 ? get_token(response) : nil
    end
    if metodo == 6 
      return @code, body, token
    else 
       return @code, body 
    end
  end
  
  def httpRequest(response)
    case response.code
      when 200
      JSON.parse(response)
    end
  end
  
  def get_token(response) 
    response.headers[:x_auth_token]
  end
  
  
  def do_report(response) 
    puts response.headers
    # Extract name.pdf
    filename = response.headers[:content_disposition].split('filename=')[1]
    # Save pdf file in .dir ~reportes
    File.open("#{Rails.root}/public/reportes/#{filename}", 'wb+') do |file|
      file.write(response)
    end
    # path file
    "#{$path}/reportes/#{filename}"
  end
  
end