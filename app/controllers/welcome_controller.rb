class WelcomeController < BaseController
    def index 
        # Buscamos los datos de los maestros para llenarlos en el combo
        @categoria = cargar_cambo_m("categoria")
        @tipo_servicio = cargar_cambo_m("tipoServicio")

        # Buscamos la lista de servicios
        # Consultar    
        req = Request.new
        code, resp = req.consultar("/servicio/buscarUltimas")

        # Deserializar
        model = Model.new(resp);
        @servicios = model.convert
        
        req = Request.new
        code, resp = req.consultar("/categoria/buscarTodos")

        # Deserializar
        model = Model.new(resp);
        @categorias = model.convert
       
        req = Request.new
        code, resp = req.consultar("/tipoServicio/buscarTodos")

        # Deserializar
        model = Model.new(resp);
        @tipo_servicios = model.convert
        
        req = Request.new
        code, resp = req.consultar("/promocion/buscarUltimas")

        # Deserializar
        model = Model.new(resp);
        @promociones = model.convert
        
        req = Request.new
        code, resp = req.consultar("/noticia/buscarUltimas")

        # Deserializar

        model = Model.new(resp);
        @noticias = model.convert
        
        #cargamos el combo de
        @tipo_inmueble = cargar_cambo_m("tipoInmueble")
        
        #tribago

        #Mailer.bienvenida("Bienvenido", "calderon.yamelis@gmail.com").deliver_now

    end
    
    def tribago
        puts "TRIBAGO"
        puts params
        if params[:tipoInmueble] != "0"
            puts "tipoInmueble"
            json =  { tipoInmueble: params[:tipoInmueble] }
            
            if params[:tipoServicio] != "0"
                json =  { tipoInmueble: params[:tipoInmueble], tipoServicio: params[:tipoServicio] }
                
                if params[:tipoCategoria] != "0" 
                    json =  { tipoInmueble: params[:tipoInmueble], tipoServicio: params[:tipoServicio], tipoCategoria: params[:tipoCategoria] }
                end
            elsif params[:tipoCategoria] != "0"
                json =  { tipoInmueble: params[:tipoInmueble], tipoCategoria: params[:tipoCategoria] }
            end
            
        elsif params[:tipoServicio] != "0"
            puts "tipoServicio"
            json =  { tipoServicio: params[:tipoServicio] }
                
            if params[:tipoCategoria] != "0"
                json =  { tipoServicio: params[:tipoServicio], tipoCategoria: params[:tipoCategoria] }
            end
            
        elsif params[:tipoCategoria] != "0"
            puts "tipoCategoria"
            json =  { tipoCategoria: params[:tipoCategoria] }
            puts "tipoCategoria END"
       
        else
            puts "None"
            json = {}
        end

        puts "JSON", json
        req = Request.new()
        code, resp = req.insertar("servicio/tribago", json)
        puts code, resp
        
        model = Model.new(resp);
        servicios = model.convert
        # Message in screen
        render :json => {:status => code, :servicios => servicios}
    end 
    
end