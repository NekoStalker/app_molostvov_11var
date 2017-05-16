module CitiesHelper 
  def link_to_add_city(f)
    f.fields_for :city, City.new do |fr|
      render('cities/city_form', fr: fr, i: 0)
    end
  end
end
