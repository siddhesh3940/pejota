# PeJota - Freelancer ERP & CRM

Solo entrepreneurs and Freelancer ERP and CRM built with PHP, Laravel, FilamentPHP, and SQLite.

![PeJota Screenshot](https://github.com/user-attachments/assets/b859236d-6511-4e2f-96ad-b6278b57ab5d)

## Features

- **Client Management** - Register and manage clients
- **Project Management** - Create and organize projects with tags
- **Task Management** - Track tasks with due dates and effort estimation
- **Work Sessions** - Time tracking for billable hours
- **Invoice Generation** - Create and export invoices to PDF
- **Contract Management** - Simple contract management with signatures
- **Notes** - Save links, rich text, markdown, and code snippets
- **Subscriptions** - Manage recurring subscriptions
- **Vendor Management** - Track vendor relationships
- **Multi-language Support** - English, Spanish, Portuguese

## Requirements

- **PHP 8.2+** with extensions:
  - SQLite (`php_sqlite3`, `php_pdo_sqlite`)
  - EXIF (`php_exif`) - optional
- **Composer** - PHP dependency manager
- **Node.js 16+** and npm
- **Git** (for cloning)

## Quick Setup

### 1. Clone Repository
```bash
git clone https://github.com/mazer-dev/pejota.git
cd pejota
```

### 2. Install Dependencies
```bash
composer install --ignore-platform-req=ext-exif
npm install
```

### 3. Environment Setup
```bash
cp .env.example .env
php artisan key:generate
```

### 4. Database Setup
```bash
# Create SQLite database
touch database/database.sqlite  # Linux/Mac
# OR
type nul > database\database.sqlite  # Windows

# Run migrations
php artisan migrate
```

### 5. Build Assets
```bash
npm run build
```

### 6. Create Admin User
```bash
php artisan pj:install
```
Follow prompts to create your admin user and company.

### 7. Start Server
```bash
php artisan serve
```

Visit `http://localhost:8000` and login with your credentials.

## Windows Setup Script

For Windows users, run the automated setup:

```cmd
setup.bat
```

## Troubleshooting

### SQLite Driver Missing
Enable in `php.ini`:
```ini
extension=sqlite3
extension=pdo_sqlite
```

### EXIF Extension Error
Either enable in `php.ini`:
```ini
extension=exif
```
Or install ignoring the requirement:
```bash
composer install --ignore-platform-req=ext-exif
```

### User Already Exists Error
If `php artisan pj:install` fails with "user exists":
```bash
# Reset database
php artisan migrate:fresh
php artisan pj:install

# OR use different email when prompted
```

### Node.js Version Issues
Update to Node.js 20+ or clear cache:
```bash
npm cache clean --force
npm install
```

## Configuration

### Database
Default: SQLite (`database/database.sqlite`)

For MySQL/PostgreSQL, update `.env`:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=pejota
DB_USERNAME=root
DB_PASSWORD=
```

### Application URL
```env
APP_URL=http://localhost:8000
```

## Upgrading

### From 0.1.0 to 0.2.0
⚠️ **Breaking Change**: Database refresh required

1. Backup your data
2. Export data only (not structure)
3. Run: `php artisan migrate:refresh`
4. Import your data
5. Update work sessions: `UPDATE work_sessions SET is_running = 0;`

## Development

### Start Development Server
```bash
php artisan serve
```

### Watch Assets (Development)
```bash
npm run dev
```

### Run Tests
```bash
php artisan test
```

## Production Deployment

1. Set environment to production:
```env
APP_ENV=production
APP_DEBUG=false
```

2. Optimize application:
```bash
composer install --optimize-autoloader --no-dev
php artisan config:cache
php artisan route:cache
php artisan view:cache
npm run build
```

3. Set proper file permissions:
```bash
chmod -R 755 storage bootstrap/cache
```

## File Structure

```
pejota/
├── app/
│   ├── Filament/App/        # Main application panels
│   ├── Models/              # Eloquent models
│   ├── Console/Commands/    # Artisan commands
│   └── Http/Controllers/    # Controllers
├── database/
│   ├── migrations/          # Database migrations
│   └── database.sqlite      # SQLite database
├── resources/
│   ├── css/                 # Stylesheets
│   ├── js/                  # JavaScript
│   └── views/               # Blade templates
└── public/                  # Web accessible files
```

## Contributing

1. Fork the repository
2. Create feature branch: `git checkout -b feature-name`
3. Commit changes: `git commit -am 'Add feature'`
4. Push branch: `git push origin feature-name`
5. Submit pull request

See issues labeled **ready to develop** for available tasks.

## License

MIT License - see LICENSE file for details.

## Support

- **Documentation**: Check this README and setup guides
- **Issues**: [GitHub Issues](https://github.com/mazer-dev/pejota/issues)
- **Logs**: Check `storage/logs/` for error details

## Credits

Built by [MAZER.DEV](https://mazer.dev)

- [LinkedIn](https://www.linkedin.com/company/mazer-dev)
- [GitHub](https://github.com/mazer-dev/pejota)

---

**Current Version**: 0.2.0  
**Laravel Version**: 11.x  
**PHP Version**: 8.2+
