class BaseController < ApplicationController
    

    # Guardar Maestros
    #def guardar_maestro
     #   json =  {
      #              descripcion: "#{params[:descripcion]}",
       #             estatus: 0
    
    # Guardar
    def guardar

        
        json =  {
                    nombre: params[:nombre],
                    sexo: params[:sexo],
                    tipoPersona: params[:tipoPersona],
                    identificacion: params[:cedula],
                    direccion: params[:direccion],
                    sector: params[:sector],
                    telefono: params[:telefono],
                    fecha_de_nacimiento: params[:fecha_de_nacimiento],
                    email: params[:email],
                    password: params[:password],
                    rol: params[:rol],
                    tokenMovil: params[:tokenMovil],
                    tipoCliente: params[:tipoCliente],
                    estatus: params[:estatus]

                }

        url = "cliente/sector/" + params[:sector] + "/rol/" + params[:rol] + "/tipoCliente/" + params[:tipoCliente] + "/agregar"
        req = Request.new
        code, resp = req.insertar(url, json)

            # Deserializar
        model = Model.new(resp['object'])
        @usuario = model.convert

        # Message in screen
        render :json => {:status => code, :message => resp['message']}

        json1 = {}


        url_profesion = "/clienteprofesion/cliente/"+ @usuario.id.to_s + "/profesion/"+ params[:clienteProfesion] + "/agregar"
        req1 = Request.new
        code1, resp1 = req1.insertar(url_profesion, json1)

        url_ocupacion = "/clienteocupacion/cliente/"+ @usuario.id.to_s + "/ocupacion/"+ params[:clienteOcupacion] + "/agregar"
        req2 = Request.new
        code2, resp2 = req2.insertar(url_ocupacion, json1)

        params[:categoriaInmueble].try(:each) do |categoria|
            url_categoriaInmueble = "preferenciacliente/categoria/"+ categoria + "/tipoServicio/-1/tipoCaracteristica/-1/cliente/"+ @usuario.id.to_s + "/agregar"
            code3, resp3 = req.insertar(url_categoriaInmueble, json1)
        end

        params[:tipoCaracteristica].try(:each) do |caracteristica|
            url_caracteristica = "preferenciacliente/categoria/-1/tipoServicio/-1/tipoCaracteristica/"+ caracteristica + "/cliente/"+ @usuario.id.to_s + "/agregar"
            code4, resp4 = req.insertar(url_caracteristica, json1)
        end

        params[:tipoServicio].try(:each) do |servicio|
            url_servicio = "preferenciacliente/categoria/-1/tipoServicio/"+ servicio + "/tipoCaracteristica/-1/cliente/"+ @usuario.id.to_s + "/agregar"
            code5, resp5 = req.insertar(url_servicio, json1)
        end
        
        json_sms =  {
            numbers: @usuario.telefono,
            body: "Bienvenido a Ocelot. Te invitamos a descargar la aplicacion movil."
        }
        req6 = Request.new
        code6, resp6 = req6.insertar("/sms/send", json_sms)

        email = @usuario.email

        Mailer.bienvenida("Bienvenido", email).deliver_now
    end


    def guardar_sugerencia
        
        
        json =  {
                    descripcion: params[:motivo],
                    correoEmisor: params[:email]
                    
                }

        url = "/comentarioexterno/asuntoComentario/" + params[:asunto] + "/agregar"
        req = Request.new
        code, resp = req.insertar(url, json)

        
        # Message in screen
        render :json => {:status => code}
    end

    
    def subir_imagen 
        name = params[:file].original_filename
        session[:subit_imagen] = name
        path = File.join("public", "imagen", name)
        File.open(path, "wb") { |f| f.write(params[:file].read) }
    
        render :json => {:status => 200}
    end
    
    protected 
    
    def cargar_maestro(maestro)
        @json_maestro = cargar(maestro)
    end
    
    def cargar_combo(combo)
        @json = cargar(combo)
    end
    
    def cargar_cambo_m(maestro)
        cargar(maestro)
    end
    
    
    private 
    
    def cargar(search)
        # Consultar    
        req = Request.new
        code, resp = req.consultar("#{search}/buscarTodos")
        # Deserializar
        model = Model.new(resp);
        model.convert
    end

    def cargar_combo_combo(combo)
        cargar_combo_combos(combo)
    end
    
    private 
    
    def cargar_combo_combos(search) 
        # Consultar    
        req = Request.new()
        code, resp = req.consultar("#{search}")
        # Deserializar
        model = Model.new(resp);
        model.convert
    end

    
   
    
end