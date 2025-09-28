<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return redirect('/app');
});

Route::get(
    '/attachments/{module}/{companyId}/{fileName}',
    [App\Http\Controllers\AttachmentsController::class, 'getAttachment']
)
    ->name('attachments.get')
    ->middleware(\Illuminate\Auth\Middleware\Authenticate::class);
