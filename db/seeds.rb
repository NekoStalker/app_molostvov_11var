if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

c1 = City.create(cname: 'Москва')
c2 = City.create(cname: 'Лондон')
c3 = City.create(cname: 'Берлин')

e1 = Excursion.create(ename: 'Кремль', city: c1, edesc: 'Очень интересная', eprice: 3000)
e2 = Excursion.create(ename: 'Красная площадь', city: c1, edesc: 'Не очень интересная', eprice: 1000)
e3 = Excursion.create(ename: 'Биг Бэн', city: c2, edesc: 'Вполне интересная', eprice: 2000)
e4 = Excursion.create(ename: 'Рейхстаг', city: c3, edesc: 'Немного интересная', eprice: 1500)

rt1 = Route.create(rname: 'Города России', city: c1, rdesc: 'Москва - Владивосток', rprice: 8000)
rt2 = Route.create(rname: 'Города Англии', city: c2, rdesc: 'Лондон - Манчестер', rprice: 3000)
rt3 = Route.create(rname: 'Города Германии', city: c3, rdesc: 'Берлин - Мюнхен', rprice: 4000)

t = Tour.create(route: rt1, tdate: DateTime.now, days: 11, payment: 300, tdesc: 'Средний')
t = Tour.create(route: rt1, tdate: DateTime.now, days: 25, payment: 500, tdesc: 'Долгий')
t = Tour.create(route: rt2, tdate: DateTime.now, days: 4, payment: 100, tdesc: 'Короткий')
t = Tour.create(route: rt3, tdate: DateTime.now, days: 10, payment: 200, tdesc: 'Средний')

