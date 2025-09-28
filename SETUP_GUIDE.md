# PeJota Setup Guide

## Prerequisites

Before setting up PeJota, ensure you have the following installed:

1. **PHP 8.2 or higher** with the following extensions:
   - SQLite extension (php_sqlite3.dll)
   - PDO SQLite extension (php_pdo_sqlite.dll)
   - EXIF extension (php_exif.dll) - optional but recommended
   - Other common Laravel extensions

2. **Composer** - PHP dependency manager
3. **Node.js** (version 16 or higher) and npm
4. **Git** (if cloning from repository)

## Setup Instructions

### Option 1: Automated Setup (Recommended)

1. Open Command Prompt or PowerShell as Administrator
2. Navigate to the project directory:
   ```cmd
   cd c:\Users\sidva\Desktop\pejota
   ```
3. Run the setup script:
   ```cmd
   setup.bat
   ```

### Option 2: Manual Setup

1. **Install PHP Dependencies**
   ```cmd
   composer install --ignore-platform-req=ext-exif
   ```

2. **Copy Environment File**
   ```cmd
   copy .env.example .env
   ```

3. **Generate Application Key**
   ```cmd
   php artisan key:generate
   ```

4. **Create Database**
   ```cmd
   type nul > database\database.sqlite
   ```

5. **Run Migrations**
   ```cmd
   php artisan migrate
   ```

6. **Install Node Dependencies**
   ```cmd
   npm install
   ```

7. **Build Assets**
   ```cmd
   npm run build
   ```

8. **Run PeJota Installation**
   ```cmd
   php artisan pj:install
   ```

## Troubleshooting

### SQLite Driver Not Found
If you get "could not find driver" error:

1. Check your PHP installation includes SQLite:
   ```cmd
   php -m | findstr sqlite
   ```

2. If SQLite is missing, enable it in your `php.ini` file:
   ```ini
   extension=sqlite3
   extension=pdo_sqlite
   ```

3. Restart your web server/command prompt

### EXIF Extension Missing
If you get EXIF extension errors:

1. Enable in `php.ini`:
   ```ini
   extension=exif
   ```

2. Or continue installation ignoring the requirement:
   ```cmd
   composer install --ignore-platform-req=ext-exif
   ```

### Node.js Issues
If npm install fails:

1. Update Node.js to version 20 or higher
2. Clear npm cache:
   ```cmd
   npm cache clean --force
   ```
3. Try installing again:
   ```cmd
   npm install
   ```

## Running the Application

1. **Start the Development Server**
   ```cmd
   php artisan serve
   ```

2. **Access the Application**
   Open your browser and go to: `http://localhost:8000`

3. **Login**
   Use the credentials you created during the `php artisan pj:install` step

## Default Configuration

The application is configured to use:
- **Database**: SQLite (database/database.sqlite)
- **Environment**: Local development
- **URL**: http://localhost:8000

## Next Steps

After successful setup:

1. Configure your company settings in the admin panel
2. Create your first client and project
3. Start tracking your work sessions
4. Explore the features: tasks, invoices, notes, subscriptions

## Support

If you encounter issues:
1. Check the Laravel logs in `storage/logs/`
2. Ensure all PHP extensions are properly installed
3. Verify file permissions are correct
4. Check the project's GitHub issues page

## Features Available

- **Client Management**: Register and manage clients
- **Project Management**: Create and organize projects
- **Task Management**: Track tasks with due dates and effort estimation
- **Work Sessions**: Time tracking for billable hours
- **Invoice Generation**: Create and export invoices to PDF
- **Notes**: Save links, rich text, markdown, and code snippets
- **Subscriptions**: Manage your recurring subscriptions
- **Contracts**: Simple contract management
- **Vendors**: Manage vendor relationships

Enjoy using PeJota for your freelance business management!