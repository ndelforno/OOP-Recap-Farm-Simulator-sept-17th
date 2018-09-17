require_relative 'field'

class Program


  def initialize(name)
    puts "Welcome to " + name
    @name = name
  end

  def menu
    while true
      print_menu
      user_selected = gets.chomp.to_s
      call_option(user_selected)
    end
  end

  def print_menu
    puts "Options:"
    puts "field -> adds a new field"
    puts "harvest -> harvests crops and adds to total harvested"
    puts "status -> displays some information about the farm"
    puts "relax -> provides lovely descriptions of your fields"
    puts "exit -> exits the program"
  end



  def call_option(user_selected)
    if user_selected == "field"
      self.add_new_field
    elsif user_selected == "harvest"
      self.harvest
    elsif user_selected == "status"
      self.status
    elsif user_selected == "relax"
      self.relax
    elsif user_selected == "exit"
      exit!
    end
  end

  def add_new_field
    puts "what kind of field is it: corn or wheat?"
    type = gets.chomp.to_s
    puts "how large is the field in hectare ?"
    area = gets.chomp.to_i
    Field.create(type,area)
    puts "Added a #{type} field of #{area} hectares!"
    p Field.fields
  end


  def harvest
      total = 0
      food_corn = 0
      food_wheat = 0
      Field.fields.each do |field|
      if field.type == "corn"
        food_corn += field.amount_per_hectares(field.type,field.area)
        puts "Harvesting #{food_corn} from #{field.area} hectare corn field"
      elsif field.type == "wheat"
        food_wheat += field.amount_per_hectares(field.type,field.area)
        puts "Harvesting #{food_wheat} from #{field.area} hectare wheat field"
      end
      total = food_corn + food_wheat
      end
      Field.total_food += total
      puts "The farm has #{Field.total_food} harvested so far"
    end

  def status
    puts "Corn field is #{Field.corn_total} hectares."
    puts "Wheat field is #{Field.wheat_total} Hectares"
    puts "The farm has #{Field.total_food} harvested so far"
  end

  def relax
    puts "#{Field.corn_total} hectares of tall green stalks rustling in the breeze fill your horizon.
          The sun hangs low, casting an orange glow on a sea of #{Field.wheat_total} hectares of wheat."
  end


end

prog1 = Program.new("My Farm")
prog1.menu
