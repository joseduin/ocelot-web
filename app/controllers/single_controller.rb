class SingleController < ApplicationController

    def single_promocion
        req = Request.new
        code, resp = req.consultar("/promocion/buscar/#{params[:id]}")

        # Deserializar
        model = Model.new(resp);
        @promocion = model.convert
    end
    
    def single_noticia
        req = Request.new
        code, resp = req.consultar("/noticia/buscar/#{params[:id]}")

        # Deserializar
        model = Model.new(resp);
        @noticia = model.convert
    end
end