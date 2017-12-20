class JsonToModel

  #== EJEMPLO
  #  json = { 
  #             nombre: "Jose",
  #             apellido: "Duin",
  #             cursos: [
  #                         {
  #                             coursera: "Android"
  #                         },
  #                         {
  #                             coursera: "IOS"
  #                         }
  #                     ],
  #             direccion:  {
  #                         carrera: "13b", calle: "55-56", casa: "xxxx"       
  #                         }    
  #         }
  #
  #** Imprimir atributo simple
  #   persona = JsonToModel.new(json)
  #   puts persona.nombre
  #     # => Jose
  #
  #** Imprimir un array
  #   puts persona.cursos
  #     # => [ {coursera: "Android"}, {coursera: "IOS"} ]
  #
  #   cursitos = []
  #   persona.cursos.each do |cursos|
  #     curso = JsonToModel.new(cursos)
  #     puts curso.coursera
  #       # => Android
  #       # => IOS
  #
  #    cursitos << curso        # Lo Guardamos en el array cursitos
  #   end
  #
  #** Imprimir un objeto
  #   puts persona.direccion
  #     # => {carrera: "13b", calle: "55-56", casa: "xxxx"}
  #
  #   direccion = JsonToModel.new(persona.direccion)
  #   puts direccion.calle
  #     # => 55-56
  #
  def initialize(args)
    Array(args).each_with_index do |value, index|

      # generate getters and setters    
      singleton_class.class_eval { attr_accessor "#{args.keys[index]}" }

      # `@` indicates instance variable    
      instance_variable_set "@#{args.keys[index]}".to_sym, value[1]
    end  
    # value[0] == args.keys[index]
    # value[1] == args[args.keys[index]]
  end
  
end