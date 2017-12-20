class Model

  $args = nil
  $model = nil
   
  def initialize(args)
    # model - JSON title
    $model = args.keys[0]
    # content - JSON body
    $args = args[args.keys[0]]
  end
   
  def convert
    do_convert( $args, $model )
  end
   
  private
   
  # Iterate a simple json o json array
  def do_convert(args, model) 
    #puts 'array', args
    if args.is_a? (Array)
      array = []
      args.try(:each) do |arg|
        array << convert_type( arg, model )
      end
      array
    else
      puts 'object'
      convert_type( args, model ) 
    end
  end
   
  # Mediante el Json title ubicamos el desealizador
  # sino entra por el default
  def convert_type(args, model)
    arg_convert = convert_it( args )

    case model
      #when "profesion", "profesion"
       # maestro( arg_convert )
        
     
      when "cargo"
        maestro( arg_convert )
      
      when "menu"
        menu( arg_convert )
    else
      arg_convert
    end
  end
   
  # Deserializadores
  def convert_it(arg)
    JsonToModel.new( arg ) 
  end
   
  def usuario(model)
    # Iterate inmuebles
   # model.inmuebles = do_convert( model.inmuebles, "inmuebles" )
    model
  end
  
  def maestro(model)
    model.estatus = convert_it( model.estatus )
    model
  end
  
  def menu(model)
    #puts 'modelo',model.descripcion
    #puts model.child.nil?
    unless model.child.nil?
      #puts model.child
      model.child = do_convert( model.child, "menu" )
    end
    model
  end
    
end