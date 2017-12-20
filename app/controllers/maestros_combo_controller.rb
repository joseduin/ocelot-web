class MaestrosComboController < BaseController
   
   $json = [
				{
					id: 1,
					descripcion: "Maestro 1",
					estatus: {
					    id: 1,
					    descripcion: "Activo"
					}
				},
				{
					id: 2,
					descripcion: "Maestro 2",
					estatus: {
					    id: 1,
					    descripcion: "Activo"
					}
				},
				{
					id: 3,
					descripcion: "Maestro 3",
					estatus: {
					    id: 1,
					    descripcion: "Activo"
					}
				}
			]
			
	$jsontipo = [
				{
					id: 1,
					tipo: "Maestro 1",
					descripcion: "Hijo 1",
					estatus: {
					    id: 1,
					    descripcion: "Activo"
					}
				},
				{
					id: 2,
					tipo: "Maestro 2",
					descripcion: "Hijo 2",
					estatus: {
					    id: 1,
					    descripcion: "Activo"
					}
				},
				{
					id: 3,
					tipo: "Maestro 3",
					descripcion: "Hijo 3",
					estatus: {
					    id: 1,
					    descripcion: "Activo"
					}
				}
			]
			
	
   
    def caracteristica
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def ciudad
        #cargar_maestro("estado")
       # cargar_combo("ciudad")
        
        #@json_maestro.try(:each) do |master|
        #    puts master.descripcion
        #end
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def etapa
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def eventualidad
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def funcion
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def municipio
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def notificacion
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def notificacion_pregunta
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def opcion_pregunta
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def promocion
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def reclamo
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def recurso
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def respuesta
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def rol_funcion
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def sector
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def tipo_inmueble
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def zona
        # TAMBIEN DEPENDE DE SERVICIO
        @json_maestro = $json
        @json = $jsontipo
    end
    
    def parroquia
        @json_maestro = $json
        @json = $jsontipo
    end
    
end
