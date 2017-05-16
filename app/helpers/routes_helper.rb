module RoutesHelper
  def link_to_add_route(f)
    #c = City.new
    r = Route.new
    #r.city = c
    f.fields_for :route, r do |fr|
      render('routes/route_form', fr: fr, i: 0)
    end
  end
end
