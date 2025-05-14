<!-- Welcome Page -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
 
  {{-- @vite('resources/css/app.css') --}}

    @vite('resources/css/app.css')

    @stack('styles')
</head>
<body>
    <div class="welcome-page">
        <header class="main-header">
            <div class="container">
                <div class="logo">
                    <a href="{{ Auth::check() ? route('dashboard') : url('/') }}">My Project</a>
                </div>
                <nav class="nav-links">
                    <ul>
                        <li><a href="{{ url('/') }}">Dashboard</a></li>
                        <li><a href="{{ url('/about') }}">About</a></li>
                        <li><a href="{{ url('/contact') }}">Contact</a></li>
                        <li><a href="{{url('/Formation')}}">Formation</a></li>
                       
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

    
</body>
</html>