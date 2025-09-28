@echo off
echo Setting up PeJota project...
echo.

echo Step 1: Installing PHP dependencies...
composer install --ignore-platform-req=ext-exif
if %errorlevel% neq 0 (
    echo Error: Failed to install PHP dependencies
    pause
    exit /b 1
)

echo.
echo Step 2: Generating application key...
php artisan key:generate
if %errorlevel% neq 0 (
    echo Error: Failed to generate application key
    pause
    exit /b 1
)

echo.
echo Step 3: Creating SQLite database...
if not exist "database\database.sqlite" (
    type nul > database\database.sqlite
)

echo.
echo Step 4: Running database migrations...
php artisan migrate
if %errorlevel% neq 0 (
    echo Error: Failed to run migrations. Please check your PHP SQLite extension.
    echo You may need to enable the SQLite extension in your php.ini file.
    pause
    exit /b 1
)

echo.
echo Step 5: Installing Node.js dependencies...
npm install
if %errorlevel% neq 0 (
    echo Warning: Failed to install Node.js dependencies. You may need to run this manually.
)

echo.
echo Step 6: Building frontend assets...
npm run build
if %errorlevel% neq 0 (
    echo Warning: Failed to build assets. You may need to run this manually.
)

echo.
echo Step 7: Running PeJota installation command...
php artisan pj:install

echo.
echo Setup complete! You can now start the development server with:
echo php artisan serve
echo.
pause