module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'}
    ]} 
    result << {
      :name => 'Экскурсионные туры',
      :icon => 'flag',
      :children => [
=begin
      {:name => 'Города',
       :controller => :cities, :action => :index,
       :icon => 'home',
       :class => 'long'},
=end
      {:name => 'Экскурсии',
       :controller => :excursions, :action => :index,
       :icon => 'camera',
       :class => 'long'},
=begin
      {:name => 'Маршруты',
       :controller => :routes, :action => :index,
       :icon => 'random',
       :class => 'long'},
=end
      {:name => 'Туры',
       :controller => :tours, :action => :index,
       :icon => 'plane',
       :class => 'long'},
      {:name => 'Поиск туров',
       :controller => :tours, :action => :search,
       :icon => 'search',
       :class => 'long'},
    ]}
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
