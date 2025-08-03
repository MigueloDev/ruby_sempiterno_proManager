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

## Instalación y Configuración

### Prerrequisitos
- Docker y Docker Compose
- Git

### Pasos de Instalación

1. **Clonar el repositorio**
   ```bash
   git clone <url-del-repositorio>
   cd ruby_sempiterno_proManager
   ```

2. **Construir y ejecutar con Docker**
   ```bash
   docker-compose up --build
   ```

3. **Ejecutar las migraciones**
   ```bash
   docker-compose exec web rails db:create
   docker-compose exec web rails db:migrate
   ```

4. **Cargar datos de ejemplo**
   ```bash
   docker-compose exec web rails db:seed
   ```

5. **Acceder a la aplicación**
   Abrir http://localhost:3000 en tu navegador

## Estructura de la Base de Datos

### Tabla: users
- `id`: Identificador único
- `name`: Nombre completo del usuario
- `email`: Correo electrónico (único)
- `role`: Rol del usuario (user, manager, admin)
- `created_at`, `updated_at`: Timestamps

### Tabla: projects
- `id`: Identificador único
- `name`: Nombre del proyecto
- `description`: Descripción del proyecto
- `status`: Estado del proyecto (active, completed, on_hold, cancelled)
- `start_date`: Fecha de inicio
- `due_date`: Fecha de vencimiento
- `created_by_id`: Referencia al usuario creador
- `created_at`, `updated_at`: Timestamps

### Tabla: tasks
- `id`: Identificador único
- `title`: Título de la tarea
- `description`: Descripción de la tarea
- `status`: Estado de la tarea (pending, in_progress, completed, cancelled)
- `due_date`: Fecha de vencimiento
- `project_id`: Referencia al proyecto
- `assigned_to_id`: Referencia al usuario asignado
- `created_by_id`: Referencia al usuario creador
- `created_at`, `updated_at`: Timestamps

## Usuarios de Ejemplo

Al ejecutar `rails db:seed`, se crean los siguientes usuarios de ejemplo:

- **Administrador**: admin@promanager.com
- **Manager**: juan@promanager.com
- **Developer 1**: maria@promanager.com
- **Developer 2**: carlos@promanager.com
- **Designer**: ana@promanager.com

## Rutas Principales

- `/` - Dashboard principal
- `/projects` - Lista de proyectos
- `/projects/new` - Crear nuevo proyecto
- `/projects/:id` - Ver proyecto específico
- `/users` - Lista de usuarios
- `/users/new` - Crear nuevo usuario
- `/projects/:project_id/tasks/new` - Crear nueva tarea

## Funcionalidades por Rol

### Usuario (user)
- Ver tareas asignadas
- Marcar tareas como completadas
- Ver proyectos y tareas

### Manager (manager)
- Todas las funcionalidades de usuario
- Crear y gestionar proyectos
- Crear y asignar tareas
- Ver estadísticas de proyectos

### Administrador (admin)
- Todas las funcionalidades de manager
- Crear y gestionar usuarios
- Acceso completo al sistema

## Desarrollo

### Estructura del Proyecto
```
app/
├── controllers/
│   ├── dashboard_controller.rb
│   ├── projects_controller.rb
│   ├── tasks_controller.rb
│   └── users_controller.rb
├── models/
│   ├── project.rb
│   ├── task.rb
│   └── user.rb
└── views/
    ├── dashboard/
    ├── projects/
    ├── tasks/
    └── users/
```

### Comandos Útiles

```bash
# Ejecutar tests
docker-compose exec web rails test

# Consola de Rails
docker-compose exec web rails console

# Ver logs
docker-compose logs web

# Reiniciar aplicación
docker-compose restart web
```

## Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## Contacto

Para preguntas o soporte, contacta al equipo de desarrollo.

---

**ProManager** - Gestión de proyectos simplificada y eficiente.
