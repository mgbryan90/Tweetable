# Comandos

## User

```rb
rails g model User email:string:uniq password username:string:uniq name avatar
rails g model Tweet body:text comments_count:integer user:references
rails g model Comment user:references tweet:references body:text
```

## Installing Devise

Follow steps

```rb
rails g devise:install
```

When finish all steps run

```rb
rails g devise:views
```

```rb
rails active_storage:install   // una migracion para poder manejar imagenes
rails generate devise User  // la migracion que requiere Devise 
```

## Create Controllers

```rb
rails g controller Users index create new show edit update destroy
rails g controller Tweets index create new show edit update destroy
rails g controller Comments create new show edit update destroy
```

## App/Controllers/concerns

Entramos a application_controller.rb para validar el devise

```rb
class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: %i[index show] # Para no permitir que un usuario pueda realizar cambios sin antes autenticarse

  protected
  
  # Para permitir mas parametros en un formulario
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email]) # Para logear usuario.
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email username name avatar]) # Para crear un usuario.
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email username name avatar]) # Para editar un usuario.
  end
end

```

## Extras CSS - Botones

Cree los siguientes archivos para las vistas de Login y Edit Profile como extra.

```css
button_login.css
cancel_account.css
```
