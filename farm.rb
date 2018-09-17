require_relative 'field'
class Farm < Program

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
  end
