class TouristSite
  attr_reader :id,
              :name,
              :address,
              :place_id

  def initialize(data)
    @id
    @name = data[:properties][:name]
    @address = data[:properties][:formatted]
    @place_id = data[:properties][:place_id]
  end
end