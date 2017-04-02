require_relative "system"

System.system_create("Solar")
System.show_all_systems.each(&method(:puts))

System.show_all_systems.each {|s| puts s.system_name}

solar_planets=[["Mercury",100,1,1],["Venus",200,2,2], ["Earth",300,3,3], ["Mars",400,4,4], ["Jupiter",500,5,5], ["Saturn",600,6,6], ["Uranus",700,7,7], ["Neptune",800,8,8]]

solar_planets.each do |p|
  System.show_all_systems[0].body_create( p[0],p[1],p[2],p[3] )
end

puts System.show_all_systems[0].bodies_name
System.show_all_systems[0].show_all_bodies

puts  "The total mass of #{System.show_all_systems[0].system_name} is #{System.show_all_systems[0].system_total_mass}"




System.show_all_systems[0].body_create( "Earth",1111,11,111 )
puts System.show_all_systems[0].bodies.inspect
