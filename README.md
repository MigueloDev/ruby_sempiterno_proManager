# ProManager

ProManager es una plataforma completa de gestión de proyectos desarrollada en Ruby on Rails que permite a los usuarios crear, editar y eliminar proyectos, gestionar tareas, asignar usuarios y visualizar estadísticas en un dashboard intuitivo.

## Características Principales

### Gestión de Proyectos
- ✅ Crear, editar y eliminar proyectos
- ✅ Asignar fechas de inicio y vencimiento
- ✅ Estados de proyecto: Activo, Completado, En pausa, Cancelado
- ✅ Seguimiento del progreso con barras de progreso
- ✅ Filtros por estado de proyecto

### Gestión de Tareas
- ✅ Crear, editar y eliminar tareas dentro de proyectos
- ✅ Asignar tareas a usuarios específicos
- ✅ Estados de tarea: Pendiente, En progreso, Completada, Cancelada
- ✅ Prioridades: Sin prioridad, Baja, Media, Alta
- ✅ Fechas de vencimiento con alertas de tareas vencidas
- ✅ Marcar tareas como completadas

### Gestión de Usuarios
- ✅ Crear y gestionar usuarios del sistema
- ✅ Roles: Usuario, Manager, Administrador
- ✅ Asignar tareas a usuarios
- ✅ Seguimiento de tareas por usuario

### Dashboard
- ✅ Estadísticas generales de proyectos y tareas
- ✅ Proyectos recientes
- ✅ Tareas de alta prioridad
- ✅ Tareas próximas a vencer
- ✅ Acciones rápidas para crear proyectos y usuarios

## Tecnologías Utilizadas

- **Backend**: Ruby on Rails 8.0
- **Base de datos**: PostgreSQL
- **Frontend**: Tailwind CSS
- **JavaScript**: Stimulus (incluido en Rails)
- **Contenedorización**: Docker
**ProManager** - Gestión de proyectos simplificada y eficiente.


# Instalacion
## Configuracion
- docker-compose up --build
- docker-compose exec app bundle install
- docker-compose exec app rails db:create db:migrate

## Comandos utiles
- docker-compose exec app bash

## Pruebas
- docker-compose exec app rspec

## Ver Logs
docker-compose logs app