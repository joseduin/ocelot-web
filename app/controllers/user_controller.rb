class UserController < BaseController
    before_action :is_login, only: [:login, :registration]

    def login 
       
    end
    
    def registration
    	#Cargamos los combos del paso 1
		@profesion = cargar("profesion")
        @ocupacion = cargar("ocupacion")

        #Cargamos los combos del paso 2
        @estado = cargar("estado")
        @municipio = cargar("municipio")
        @ciudad = cargar("ciudad")
        @parroquia = cargar("parroquia")


        @sector = cargar("sector")

        #Cargamos los campos del paso 3
        @categoriaInmueble = cargar("categoriaInmueble")
        @tipoCaracteristica = cargar("tipoCaracteristica")

        #Cargamos lo necesario para los servicios
        @categoriaServicio = cargar("categoria")
        @tipoServicios = cargar("tipoServicio")

    end

    def validar_cliente

        url = "cliente/buscarPorCorreo/#{params[:email]}/cedula/#{params[:tipoPersona]}/#{params[:cedula]}/"    
        puts url
        req = Request.new()
        code, resp = req.consultar(url)

        render :json => {:status => code, :message => resp}
        
        puts resp
    end

    
    def log_out_web
       redirect_to "#{$web_intra_path}/log_out" 
    end
    
    def log_out
    	# Limpiamos la variable session 
    	reset_session
    	redirect_to :controller => 'welcome', :action => 'index'
	end
    
    def iniciar_sesion
        # Consultar    
        req = Request.new
        code, resp, token = req.login("login/#{params[:email]}/#{params[:clave]}")
        puts "response", code, resp, token
        message = "Los datos introducidos son invalidos. Por favor intente de nuevo" 
        id = 0
        
        puts "code", code
        if code == 200
            message = ""
            
            # Deserializar
            model = Model.new(resp);
            puts "model"
            usuario = model.convert
            puts "user"
            id = usuario.id
            
            sesion_init(usuario)
        end
        # Message in screen
       
        render :json => {:status => code, :message => message, :id => id, :token => token}
    end

    def buscarMunicipioPorCiudad
        puts params 
        municipio = cargar_combo_combo(params[:url])
        puts municipio
        render :json => {:status => 200, :municipio => municipio}
    end 
    
    def buscarParroquiaPorMunicipio
        puts params 
        parroquia = cargar_combo_combo(params[:url])
        puts parroquia
        render :json => {:status => 200, :parroquia => parroquia}
    end 
    
    def buscarSectorPorParroquia
       puts params 
       sector = cargar_combo_combo(params[:url])
       puts sector
       render :json => {:status => 200, :sector => sector}
    end
    
    def buscarCiudadPorEstado
        puts params
        ciudad = cargar_combo_combo(params[:url])
        puts ciudad
        render :json => {:status => 200, :ciudad => ciudad}
    end
    
    private 
    
    def is_login
        unless session[:id].nil?
            redirect_to :controller => 'welcome', :action => 'index'
        end
    end
    
    def sesion_init(user)
        session[:id] = user.id 
        session[:nombre] = user.nombre
        session[:identificacion] = user.identificacion
        session[:tipoPersona] = user.tipoPersona
        session[:email] = user.email
        session[:rol] = user.rol
    end


    
end