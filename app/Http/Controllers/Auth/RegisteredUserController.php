<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    
public function create(): View
{
    return view('auth.register');
}

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
          
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'securite_question_id' => ['required', 'exists:securite_question,id'],
            'reponse' => ['required', 'string', 'max:255'],
            'date_de_naissance' => ['required', 'date'],
            'tel' => ['required', 'string', 'max:15'],
            'prenom' => ['required', 'string', 'max:255'],
            'nom' => ['required', 'string', 'max:255'],
          
        ]);

        $user = User::create([
           
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'securite_question_id' => $request->securite_question_id,
            'reponse' => Hash::make($request->reponse),
            'date_naissance' => $request->date_de_naissance,
            'tel' => $request->tel,
            'prenom' => $request->prenom,
            'nom' => $request->nom,
            'role_id' => $request->role_id ?? null,
            'is_active' => $request->is_active ?? true,
        
        ]);

        event(new Registered($user));

        Auth::login($user);

        return redirect(route('dashboard', absolute: false));
    }
}
