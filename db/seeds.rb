require 'down'

puts "Iniciando o seed..."

Admin.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = '123456'
  admin.password_confirmation = '123456'
  admin.name = 'Admin'
  admin.nickname = 'admin'
end

User.find_or_create_by!(email: 'user@example.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
  user.name = 'User'
  user.nickname = 'user'
end

puts "Admin and User seeds created!"

categorias_nomes = [
  'Tecnologia',
  'Marketing',
  'Música',
  'Gastronomia',
  'Saúde',
  'Educação',
  'Negócios',
  'Arte',
  'Esporte'
]


event_categories = categorias_nomes.map do |nome|
  EventCategory.find_or_create_by!(name: nome)
end

puts "Categorias de Evento criadas/encontradas: #{event_categories.count}"

admin_para_eventos = Admin.find_by(email: 'admin@example.com')

unless admin_para_eventos
  puts "ERRO: Admin 'admin@example.com' não encontrado para associar eventos. Por favor, verifique o seed do Admin."
  exit 
end

puts "Associando eventos ao Admin: #{admin_para_eventos.email}"

event_categories.each do |category|
  puts "Criando eventos para a categoria: '#{category.name}'..."

  5.times do |i| 
    event_number = i + 1
    event_title = "#{category.name} - Evento #{event_number} da Sorte"
    event_description = "Participe do #{event_number}º evento exclusivo sobre #{category.name}. Uma oportunidade única para aprender e conectar!"
    event_date = Date.today + rand(30..365).days 
    event_time = Time.new(event_date.year, event_date.month, event_date.day, rand(9..20), [0, 30].sample) 
    event_location = ["Centro de Convenções de #{Faker::Address.city}", "Auditório da #{Faker::Company.name}", "Espaço Cultural #{Faker::Restaurant.name}", "Online via Zoom"].sample 
    event_capacity = rand(30..200) 
    event_price = rand(50.0..500.0).round(2) 
    event_organizer = Faker::Company.name 

    Event.find_or_create_by!(title: event_title) do |event|
      event.description = event_description
      event.date = event_date
      event.time = event_time
      event.location = event_location
      event.capacity = event_capacity
      event.price = event_price
      event.remote_image_url = "https://picsum.photos/800/600"
      event.organizer = event_organizer
      event.event_category = category
      event.admin = admin_para_eventos     
    end
    puts "- Criado evento: '#{event_title}'"
  end
end

puts "Seed concluído! Total de categorias: #{EventCategory.count}, Total de eventos: #{Event.count}"