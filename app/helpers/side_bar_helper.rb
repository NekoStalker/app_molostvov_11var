module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Сслыка без детей',
      :icon => 'list',
      :controller => :welcome, 
      :action => :index
    }
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
      :name => 'Ссылки на таблицы',
      :icon => 'search',
      :children => [
      {:name => 'Города',
       :controller => :cities, :action => :index,
       :icon => 'home',
       :class => 'long'},
      {:name => 'Экскурсии',
       :controller => :excursions, :action => :index,
       :icon => 'flag',
       :class => 'long'},
      {:name => 'Маршруты',
       :controller => :routes, :action => :index,
       :icon => 'random',
       :class => 'long'},
      {:name => 'Туры',
       :controller => :tours, :action => :index,
       :icon => 'plane',
       :class => 'long'}
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
