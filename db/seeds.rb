# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creando usuarios..."

admin = User.create!(
  name: "Administrador",
  email: "admin@promanager.com",
  password: "password123",
  password_confirmation: "password123"
)

manager = User.create!(
  name: "Juan Pérez",
  email: "juan@promanager.com",
  password: "password123",
  password_confirmation: "password123"
)

developer1 = User.create!(
  name: "María García",
  email: "maria@promanager.com",
  password: "password123",
  password_confirmation: "password123"
)

developer2 = User.create!(
  name: "Carlos López",
  email: "carlos@promanager.com",
  password: "password123",
  password_confirmation: "password123"
)

designer = User.create!(
  name: "Ana Rodríguez",
  email: "ana@promanager.com",
  password: "password123",
  password_confirmation: "password123"
)

puts "Usuarios creados: #{User.count}"

puts "Creando proyectos..."

proyecto_web = Project.create!(
  name: "Sitio Web Corporativo",
  description: "Desarrollo de un sitio web moderno para la empresa con funcionalidades de e-commerce",
  status: "active",
  start_date: Date.current - 30.days,
  due_date: Date.current + 60.days,
)

proyecto_mobile = Project.create!(
  name: "Aplicación Móvil",
  description: "Desarrollo de una aplicación móvil nativa para iOS y Android",
  status: "active",
  start_date: Date.current - 15.days,
  due_date: Date.current + 90.days,
)

proyecto_marketing = Project.create!(
  name: "Campaña de Marketing Digital",
  description: "Campaña completa de marketing digital incluyendo redes sociales y SEO",
  status: "completed",
  start_date: Date.current - 90.days,
  due_date: Date.current - 10.days,
)

puts "Proyectos creados: #{Project.count}"

puts "Creando tareas..."

Task.create!(
  title: "Diseño de wireframes",
  description: "Crear wireframes para todas las páginas del sitio web",
  status: "completed",
  due_date: Date.current - 20.days,
  project: proyecto_web,
  assigned_to: designer,
  created_by: manager
)

Task.create!(
  title: "Desarrollo del frontend",
  description: "Implementar el diseño en HTML, CSS y JavaScript",
  status: "in_progress",
  due_date: Date.current + 30.days,
  project: proyecto_web,
  assigned_to: developer1,
  created_by: manager
)

Task.create!(
  title: "Configuración de base de datos",
  description: "Diseñar y configurar la base de datos para el e-commerce",
  status: "pending",
  due_date: Date.current + 15.days,
  project: proyecto_web,
  assigned_to: developer2,
  created_by: manager
)


puts "Tareas creadas: #{Task.count}"

puts "¡Datos de ejemplo creados exitosamente!"
puts "Puedes acceder a la aplicación con los siguientes usuarios:"
puts "- Admin: admin@promanager.com (password: password123)"
puts "- Manager: juan@promanager.com (password: password123)"
puts "- Developers: maria@promanager.com, carlos@promanager.com (password: password123)"
puts "- Designer: ana@promanager.com (password: password123)"
