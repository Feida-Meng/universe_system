class System

  @@systems = []

  def self.system_create
    @@system.push(System.new)

  end

  attr_reader : body
  def initialize(argument)
    @argument = argument
  end


  @bodies = []

  def body_create
    @@bodies.push(Body.new(name,mass))

  end

  def total_mass
    @bodies.map(&:  ).sum

  end


end
