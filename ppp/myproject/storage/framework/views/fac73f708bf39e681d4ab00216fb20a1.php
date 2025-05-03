<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <?php echo app('Illuminate\Foundation\Vite')('resources/css/register.css'); ?> 
    
    <!-- Google reCAPTCHA script -->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
    <div class="register-page">
        <h1>Register</h1>
        <form method="POST" action="<?php echo e(route('register')); ?>">
            <?php echo csrf_field(); ?>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="password_confirmation">Confirm Password:</label>
            <input type="password" id="password_confirmation" name="password_confirmation" required>

            <!-- Google reCAPTCHA widget -->
            <div class="g-recaptcha" data-sitekey="6LfT4ywrAAAAAEjVmdKhHWdeosBrlsvXFiGHZZZ8') }}"></div>
            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
<?php /**PATH C:\Users\pc\Desktop\ppp\myproject\resources\views/auth/register.blade.php ENDPATH**/ ?>