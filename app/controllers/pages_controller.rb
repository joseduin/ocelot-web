class PagesController < BaseController
   
    def promociones
         req = Request.new
        code, resp = req.consultar("/promocion/buscarUltimas")

        # Deserializar
        model = Model.new(resp);
        @promociones = model.convert
    end
    
    def noticias
        req = Request.new
        code, resp = req.consultar("/noticia/buscarActivos")

        # Deserializar
        model = Model.new(resp);
        @noticias = model.convert
    end
    
    def nosotros
    end
    
    def contacto
    end
    
    def app_movil
    end
    
    def buzon_sugerencias
        @asunto_comentario = cargar("asuntoComentario")

    end
    
end