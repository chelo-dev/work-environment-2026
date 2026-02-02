# Mi entorno de trabajo en Arch Linux y más

Una guía completa y detallada de mi configuración como desarrollador full-stack en Arch Linux. Este repositorio documenta todas las herramientas, configuraciones, personalizaciones y optimizaciones que utilizo en mi día a día para el desarrollo web con Laravel, Angular, Ionic y más.

Desde la instalación inicial del sistema hasta la configuración de entornos de desarrollo específicos, esta documentación está diseñada para servir como referencia rápida y guía de restauración en caso de necesitar replicar mi entorno de trabajo en una nueva instalación.

---

**👤 Autor:** Angel Paredes Torres  
**🐧 Sistema Operativo:** Arch Linux  
**📅 Última actualización:** 1 de febrero de 2026

---

## 📋 Tabla de Contenidos

1. [🔧 Instalación de LAMP Stack](#-instalación-de-lamp-stack)
   - [PHP 8.4.*](#php-84)
   - [Apache](#apache)
   - [MySQL / MariaDB](#mysql--mariadb)
   - [Composer](#composer)
   - [Laravel](#laravel)
   - [Verificación final del stack](#-verificación-final-del-stack)
2. [💻 Herramientas de Desarrollo](#-herramientas-de-desarrollo)
   - [Visual Studio Code](#visual-studio-code)
   - [DBeaver Community](#dbeaver-community)
   - [Navegadores](#navegadores)
3. [🎨 Personalizaciónes](#-personalización-de-terminal)
   - [Kitty Terminal](#kitty-terminal)
   - [Neofetch](#neofetch)
   - [Waybar](#waybar)
   - [Wofi](#wofi)
   - [Zsh](#zsh)
   - [Hyprland](#hyprland)
---

## 🔧 Instalación de LAMP Stack

### PHP 8.4.*

**Instalación:**
```bash
sudo pacman -S php php-apache
```

**Verificar instalación:**
```bash
php -v
```

**Output esperado:**
```
PHP 8.4.x (cli) (built: ...)
Copyright (c) The PHP Group
Zend Engine v4.4.x, Copyright (c) Zend Technologies
```

**Extensiones adicionales recomendadas:**
```bash
sudo pacman -S php-gd php-intl php-sqlite php-pgsql php-fpm
```

---

### Apache

**Instalación:**
```bash
sudo pacman -S apache
```

**Habilitar e iniciar el servicio:**
```bash
sudo systemctl enable httpd
sudo systemctl start httpd
```

**Verificar estado:**
```bash
sudo systemctl status httpd
```

**Output esperado:**
```
● httpd.service - Apache Web Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disabled)
     Active: active (running) since ...
```

**Configurar PHP con Apache:**

Editar `/etc/httpd/conf/httpd.conf` y agregar/descomentar:
```apache
LoadModule php_module modules/libphp.so
AddHandler php-script .php
Include conf/extra/php_module.conf
```

**Reiniciar Apache:**
```bash
sudo systemctl restart httpd
```

**Verificar PHP en Apache:**

Crear archivo de prueba en `/srv/http/info.php`:
```php
<?php phpinfo(); ?>
```

Acceder a: `http://localhost/info.php`

---

### MySQL / MariaDB

**Instalación:**
```bash
sudo pacman -S mariadb
```

**Inicializar la base de datos:**
```bash
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
```

**Habilitar e iniciar el servicio:**
```bash
sudo systemctl enable mariadb
sudo systemctl start mariadb
```

**Verificar estado:**
```bash
sudo systemctl status mariadb
```

**Output esperado:**
```
● mariadb.service - MariaDB database server
     Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; preset: disabled)
     Active: active (running) since ...
```

**Configuración inicial de seguridad:**
```bash
sudo mysql_secure_installation
```

**Verificar versión:**
```bash
mysql --version
```

**Output esperado:**
```
mysql  Ver 15.1 Distrib 11.x.x-MariaDB, for Linux (x86_64)
```

**Acceder a MySQL:**
```bash
sudo mysql -u root -p
```

---

### Composer

**Instalación:**
```bash
sudo pacman -S composer
```

**Verificar instalación:**
```bash
composer --version
```

**Output esperado:**
```
Composer version 2.x.x
```

---

### Laravel

**Instalar Laravel globalmente:**
```bash
composer global require laravel/installer
```

**Agregar Composer al PATH:**

Editar `~/.bashrc` o `~/.zshrc` y agregar:
```bash
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
```

**Recargar configuración:**
```bash
source ~/.bashrc  # o source ~/.zshrc
```

**Verificar instalación:**
```bash
laravel --version
```

**Output esperado:**
```
Laravel Installer x.x.x
```

**Crear proyecto de prueba:**
```bash
laravel new test-project
cd test-project
php artisan --version
```

**Output esperado:**
```
Laravel Framework 11.x.x
```

---

### ✅ Verificación final del stack
```bash
# PHP
php -v

# Apache
sudo systemctl status httpd

# MySQL/MariaDB
mysql --version

# Composer
composer --version

# Laravel
laravel --version
```

**Todos los servicios corriendo:**
```bash
sudo systemctl status httpd mariadb
```

---

## 💻 Herramientas de Desarrollo

### Visual Studio Code

**Editor de código principal** para desarrollo full-stack.

**Instalación:**
```bash
yay -S visual-studio-code-bin
```

**Características principales:**
- 🎨 Soporte completo para PHP, JavaScript, TypeScript
- 🔌 Extensiones para Laravel, Angular, Ionic
- 🐛 Debugging integrado
- 📦 Control de versiones Git integrado
- 🎯 IntelliSense y autocompletado avanzado

**Extensiones recomendadas:**
- PHP Intelephense
- Laravel Blade Snippets
- Angular Language Service
- ESLint
- Prettier
- GitLens

---

### DBeaver Community

**Gestor de bases de datos universal** para administración de MySQL/MariaDB, PostgreSQL y más.

**Instalación:**
```bash
sudo pacman -S dbeaver
```

**Características principales:**
- 🗄️ Soporte multi-base de datos (MySQL, PostgreSQL, SQLite, etc.)
- 📊 Editor SQL con autocompletado
- 📈 Visualización de datos y diagramas ER
- 🔄 Importación/exportación de datos
- 🔍 Navegación de esquemas y metadatos
- 📝 Generación de scripts DDL

---

### Navegadores

#### Mozilla Firefox

**Navegador principal** para desarrollo y pruebas.

**Instalación:**
```bash
sudo pacman -S firefox
```

**Características para desarrollo:**
- 🔧 DevTools avanzadas
- 🎨 Inspector de CSS Grid y Flexbox
- 📱 Modo diseño responsivo
- 🐛 Debugger de JavaScript
- 🌐 Editor de Storage (cookies, localStorage, etc.)

---

#### Brave

**Navegador alternativo** basado en Chromium para pruebas de compatibilidad.

**Instalación:**
```bash
yay -S brave-bin
```

**Características principales:**
- ⚡ Motor Chromium para compatibilidad
- 🛡️ Bloqueador de anuncios integrado
- 🔒 Privacidad por defecto
- 🌐 Compatibilidad con Chrome DevTools
- 🧪 Testing en motor diferente a Firefox

---

## 🎨 Personalización de Terminal

### Kitty Terminal

**Terminal emulator** moderno con soporte GPU y alta personalización.

**Instalación:**
```bash
sudo pacman -S kitty
```

**Verificar instalación:**
```bash
kitty --version
```

**Output esperado:**
```
kitty 0.x.x
```

---

**Aplicar configuración personalizada:**

**Backup de configuración default (opcional):**
```bash
mkdir -p ~/.config/kitty
cp ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.backup
```

**Copiar dotfile personalizado:**
```bash
cp config/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

**O crear enlace simbólico:**
```bash
ln -sf $(pwd)/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

**Recargar configuración:**
```bash
# Dentro de Kitty presionar: Ctrl+Shift+F5
# O reiniciar Kitty
```

**Verificar configuración aplicada:**
```bash
kitty --debug-config
```

---

### Neofetch

**Herramienta de información del sistema** para mostrar detalles del hardware y software en la terminal.

**Instalación:**
```bash
sudo pacman -S neofetch
```

**Verificar instalación:**
```bash
neofetch --version
```

**Output esperado:**
```
Neofetch 7.x.x
```

---

**Aplicar configuración personalizada:**

**Backup de configuración default (opcional):**
```bash
mkdir -p ~/.config/neofetch
cp ~/.config/neofetch/config.conf ~/.config/neofetch/config.conf.backup
```

**Copiar dotfile personalizado:**
```bash
cp config/neofetch/config.conf ~/.config/neofetch/config.conf
```

**O crear enlace simbólico:**
```bash
ln -sf $(pwd)/config/neofetch/config.conf ~/.config/neofetch/config.conf
```

**Ejecutar con configuración personalizada:**
```bash
neofetch
```

**Agregar a shell startup (opcional):**

Editar `~/.bashrc` o `~/.zshrc` y agregar al final:
```bash
neofetch
```

---

### Waybar

**Barra de estado personalizable** para compositores Wayland (Hyprland, Sway, etc.).

**Instalación:**
```bash
sudo pacman -S waybar
```

**Verificar instalación:**
```bash
waybar --version
```

**Output esperado:**
```
Waybar v0.x.x
```

---

**Aplicar configuración personalizada:**

**Backup de configuración default (opcional):**
```bash
mkdir -p ~/.config/waybar
cp -r ~/.config/waybar ~/.config/waybar.backup
```

**Copiar dotfiles personalizados:**
```bash
cp -r config/waybar/* ~/.config/waybar/
```

**O crear enlace simbólico:**
```bash
rm -rf ~/.config/waybar
ln -sf $(pwd)/config/waybar ~/.config/waybar
```

**Reiniciar Waybar:**
```bash
killall waybar
waybar &
```

**O recargar configuración:**
```bash
# Presionar: Ctrl+Shift+R (si está configurado)
# O reiniciar el compositor
```

---

### Wofi

**Lanzador de aplicaciones** para Wayland, alternativa a Rofi.

**Instalación:**
```bash
sudo pacman -S wofi
```

**Verificar instalación:**
```bash
wofi --version
```

**Output esperado:**
```
wofi x.x.x
```

---

**Aplicar configuración personalizada:**

**Backup de configuración default (opcional):**
```bash
mkdir -p ~/.config/wofi
cp ~/.config/wofi/config ~/.config/wofi/config.backup 2>/dev/null
cp ~/.config/wofi/style.css ~/.config/wofi/style.css.backup 2>/dev/null
```

**Copiar dotfiles personalizados:**
```bash
mkdir -p ~/.config/wofi
cp config/wofi/config ~/.config/wofi/config
cp config/wofi/style.css ~/.config/wofi/style.css
```

**O crear enlaces simbólicos:**
```bash
mkdir -p ~/.config/wofi
ln -sf $(pwd)/config/wofi/config ~/.config/wofi/config
ln -sf $(pwd)/config/wofi/style.css ~/.config/wofi/style.css
```

**Ejecutar Wofi:**
```bash
wofi --show drun
```

---

### Zsh

**Shell avanzado** con autocompletado, sintaxis highlighting y alta personalización.

**Instalación:**
```bash
sudo pacman -S zsh
```

**Verificar instalación:**
```bash
zsh --version
```

**Output esperado:**
```
zsh 5.x.x (x86_64-pc-linux-gnu)
```

---

**Establecer Zsh como shell predeterminado:**
```bash
chsh -s $(which zsh)
```

**Nota:** Cerrar sesión e iniciar sesión nuevamente para aplicar los cambios.

---

**Aplicar configuración personalizada:**

**Backup de configuración default (opcional):**
```bash
cp ~/.zshrc ~/.zshrc.backup 2>/dev/null
```

**Copiar dotfile personalizado:**
```bash
cp zsh/zshrc.conf ~/.zshrc
```

**O crear enlace simbólico:**
```bash
ln -sf $(pwd)/zsh/zshrc.conf ~/.zshrc
```

**Recargar configuración:**
```bash
source ~/.zshrc
```

**Verificar shell actual:**
```bash
echo $SHELL
```

**Output esperado:**
```
/usr/bin/zsh
```

---

### Hyprland

**Compositor Wayland dinámico** con animaciones fluidas y alta personalización.

**Instalación:**
```bash
sudo pacman -S hyprland
```

**Verificar instalación:**
```bash
hyprctl version
```

**Output esperado:**
```
Hyprland, built from branch main at commit ...
```

---

**Aplicar configuración personalizada:**

**Backup de configuración default (opcional):**
```bash
mkdir -p ~/.config/hypr
cp -r ~/.config/hypr ~/.config/hypr.backup
```

**Copiar dotfiles personalizados:**
```bash
cp -r hypr/* ~/.config/hypr/
```

**O crear enlace simbólico:**
```bash
rm -rf ~/.config/hypr
ln -sf $(pwd)/hypr ~/.config/hypr
```

**Recargar configuración de Hyprland:**
```bash
hyprctl reload
```

**O reiniciar Hyprland:**
```bash
# Presionar: Super+Shift+Q (si está configurado para salir)
# Luego iniciar sesión nuevamente en Hyprland
```

**Verificar configuración:**
```bash
hyprctl monitors
hyprctl workspaces
```

---