<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
 
    @vite('resources/css/app.css')
    <div class="g-recaptcha" data-sitekey="{{ env('NOCAPTCHA_SITEKEY') }}"></div>

    @stack('styles')
</head>
<body>
    <div class="welcome-page">
        <header class="main-header">
            <div class="container">
                <div class="logo">
                    <a href="{{ url('/') }}">My Project</a>
                </div>
                <nav class="nav-links">
                    <ul>
                        <li><a href="{{ url('/') }}">Home</a></li>
                        <li><a href="{{ url('/about') }}">About</a></li>
                        <li><a href="{{ url('/contact') }}">Contact</a></li>
                        @guest
                            <li><a href="{{ route('login') }}">Login</a></li>
                            <li><a href="{{ route('register') }}">Register</a></li>
                        @else
                            <li><a href="{{ route('dashboard') }}">Dashboard</a></li>
                            <li>
                                <form action="{{ route('logout') }}" method="POST">
                                    @csrf
                                    <button type="submit">Logout</button>
                                </form>
                            </li>
                        @endguest
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
            @guest
                <section>
                    <h2>Introduction</h2>
                    <p>This is the homepage of your project. Customize it as needed!</p>
                </section>
            @else
                <section>
                    <h2>Dashboard</h2>
                    <p>Welcome back, {{ Auth::user()->name }}! This is your dashboard.</p>
                </section>
            @endguest
        </main>
        <footer>
            <p>&copy; {{ date('Y') }} My Project. All rights reserved.</p>
        </footer>
    </div>

    @push('styles')
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
    @endpush
</body>
</html>