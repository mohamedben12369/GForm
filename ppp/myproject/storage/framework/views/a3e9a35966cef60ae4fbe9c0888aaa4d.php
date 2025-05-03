<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
 
    <?php echo app('Illuminate\Foundation\Vite')('resources/css/app.css'); ?>

    <?php echo $__env->yieldPushContent('styles'); ?>
</head>
<body>
    <div class="welcome-page">
        <header class="main-header">
            <div class="container">
                <div class="logo">
                    <a href="<?php echo e(url('/')); ?>">My Project</a>
                </div>
                <nav class="nav-links">
                    <ul>
                        <li><a href="<?php echo e(url('/')); ?>">Home</a></li>
                        <li><a href="<?php echo e(url('/about')); ?>">About</a></li>
                        <li><a href="<?php echo e(url('/contact')); ?>">Contact</a></li>
                        <?php if(auth()->guard()->guest()): ?>
                            <li><a href="<?php echo e(route('login')); ?>">Login</a></li>
                            <li><a href="<?php echo e(route('register')); ?>">Register</a></li>
                        <?php else: ?>
                            <li><a href="<?php echo e(route('dashboard')); ?>">Dashboard</a></li>
                            <li>
                                <form action="<?php echo e(route('logout')); ?>" method="POST">
                                    <?php echo csrf_field(); ?>
                                    <button type="submit">Logout</button>
                                </form>
                            </li>
                        <?php endif; ?>
                        <li><a href="#" class="cta-button">Get Started</a></li>
                    </ul>
                </nav>
                <div class="hamburger-menu">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </header>
        <main>
            <?php if(auth()->guard()->guest()): ?>
                <section>
                    <h2>Introduction</h2>
                    <p>This is the homepage of your project. Customize it as needed!</p>
                </section>
            <?php else: ?>
                <section>
                    <h2>Dashboard</h2>
                    <p>Welcome back, <?php echo e(Auth::user()->name); ?>! This is your dashboard.</p>
                </section>
            <?php endif; ?>
        </main>
        <footer>
            <p>&copy; <?php echo e(date('Y')); ?> My Project. All rights reserved.</p>
        </footer>
    </div>

    <?php $__env->startPush('styles'); ?>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        .main-header {
            position: fixed;
            top: 0;
            width: 100%;
            background: linear-gradient(to bottom, rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0));
            color: white;
            font-family: 'Poppins', sans-serif;
            z-index: 1000;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s;
        }

        .main-header.scrolled {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            background: rgba(0, 0, 0, 0.9);
        }

        .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        .logo a {
            font-size: 24px;
            font-weight: 600;
            color: white;
            text-decoration: none;
        }

        .nav-links ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
        }

        .nav-links ul li a {
            color: white;
            text-decoration: none;
            font-weight: 400;
            transition: color 0.3s;
        }

        .nav-links ul li a:hover {
            color: #f39c12;
        }

        .cta-button {
            background: #f39c12;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s;
        }

        .cta-button:hover {
            background: #e67e22;
        }

        .hamburger-menu {
            display: none;
            flex-direction: column;
            gap: 5px;
            cursor: pointer;
        }

        .hamburger-menu span {
            width: 25px;
            height: 3px;
            background: white;
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .hamburger-menu {
                display: flex;
            }
        }
    </style>
    <?php $__env->stopPush(); ?>
</body>
</html><?php /**PATH C:\Users\pc\Desktop\ppp\myproject\resources\views/welcome.blade.php ENDPATH**/ ?>