class System
#----------------class--------------------
  @@systems = []

  def self.system_create(system_name)
    @@systems.push(System.new(system_name))
  end

  def self.universe_total_mass
    @@systems.map(&:system_total_mass).sum
  end

  def self.show_all_systems
    @@systems
  end
#---------------instance----------------
  attr_reader :bodies, :system_name, :bodies_name
  def initialize(system_name)
    @system_name = system_name
    @bodies = []
    @bodies_name = []
  end

  def body_create(name,mass,type_day_month=nil,year_planet=nil)

    if @bodies_name.include?(name)
      puts "#{name} already existed"
    else

      puts "What kind of body to create? Type 1 for Star, 2 for Planet, 3 for Moon or anything for any type of body"
      body_type = gets.chomp
      case body_type
      when "1"
        @bodies.push(Star.new(name,mass,type_day_month))
      when "2"
        @bodies.push(Planet.new(name,mass,type_day_month,year_planet))
      when "3"
        @bodies.push(Moon.new(name,mass,type_day_month,year_planet))
      else
        @bodies.push(Body.new(name,mass))
      end
      @bodies_name.push(name)

    end

  end

  def system_total_mass
    @bodies.map(&:mass).sum
  end

  def show_all_bodies
    puts "What kind of body to display? Type 1 for Star, 2 for Planet, 3 for Moon or anything for any type of body"
    body_type = gets.chomp

    case body_type
    when "1"
      body_class = "Star"
    when "2"
      body_class = "Planet"
    when "3"
      body_class = "Moon"
    else
      body_class = "Body"
    end
    body_to_display = @bodies.select { |body| body.class.name == body_class }

    body_to_display.each {|b| puts b.name }


  end

end

#-----------------class Body--------------------
class Body

  attr_reader :name, :mass
  def initialize(name, mass)
    @name = name
    @mass = mass.to_i
  end

end
#-----------class Planet < Body-----------------
class Planet < Body

  attr_reader :day, :year

  def initialize(name,mass,day,year)
    super(name,mass)
    @day  = day.to_i
    @year = year.to_i
  end

end
#-----------class Star < Body-----------------
class Star < Body
    attr_reader :type

  def initialize(name,mass,type)
    super(name,mass)
    @type = type
  end

end
#-----------class Moon < Body-----------------
class Moon < Body

    attr_reader :month, :planet

  def initialize(name,mass,month,planet)
    super(name,mass)
    @month = month.to_i
    @planet = planet
  end

end
