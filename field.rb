class Field
@@fields = []
@@total_food = 0
@@corn_total = 0
@@wheat_total = 0
  def initialize(type,area)
    @type = type
    @area = area
  end

  def type
    return @type
  end

  def area
    return @area
  end

  def type=()
    return @type
  end

  def area=()
    return @area
  end

  def amount_per_hectares(type,area)
    if type == "corn"
      amount = area * 20
    elsif type =="wheat"
      amount = area * 30
    end
    return amount
  end


  def self.total_food
    return @@total_food
  end

  def self.total_food=(t)
    return @@total_food = t
  end

  def self.fields
    return @@fields
  end

  def self.fields=()
    return @@fields
  end

  def self.corn_total
    return @@corn_total
  end

  def self.wheat_total
    return @@wheat_total
  end

  def self.corn_total=()
    return @@corn_total
  end

  def self.wheat_total
    return @@wheat_total
  end


  def self.create(type,area)
    field = Field.new(type,area)
    @@fields << field
    if type == "corn"
      @@corn_total += area
    elsif type == "wheat"
      @@wheat_total += area
    end
    return field
  end

end
