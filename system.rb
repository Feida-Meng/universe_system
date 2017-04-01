class System

  @@systems = []

  def self.system_create
    @@system.push(System.new)
  end

  def self.system_total_mass

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

class Body

  attr_reader :name, :mass

  def initialize(name, mass)
    @name = name
    @mass = mass

  end

end

class Planet < Body

  def initialize(name,mass,day,year)
    super(name,mass)
    @day  = day
    @year = year
  end

end

class Star < Body
  def initialize(name,mass,type)
    super(name,mass,type)
    @type = type

  end

end

class Moon < Body

  def initialize(name,mass,month)
    @month = month
    @planet = planet
  end


end
