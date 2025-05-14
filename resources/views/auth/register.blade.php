<x-guest-layout>
    <form method="POST" action="{{ route('register') }}">
        @csrf

        <!-- Name -->
        <div>
            <x-input-label for="name" :value="__('Name')" />
            <x-text-input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name')" required autofocus autocomplete="name" />
            <x-input-error :messages="$errors->get('name')" class="mt-2" />
        </div>

        <!-- First Name -->
        <div class="mt-4">
            <x-input-label for="prenom" :value="__('First Name')" />
            <x-text-input id="prenom" class="block mt-1 w-full" type="text" name="prenom" required />
            <x-input-error :messages="$errors->get('prenom')" class="mt-2" />
        </div>

        <!-- Last Name -->
        <div class="mt-4">
            <x-input-label for="nom" :value="__('Last Name')" />
            <x-text-input id="nom" class="block mt-1 w-full" type="text" name="nom" required />
            <x-input-error :messages="$errors->get('nom')" class="mt-2" />
        </div>

        <!-- Email Address -->
        <div class="mt-4">
            <x-input-label for="email" :value="__('Email')" />
            <x-text-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required autocomplete="username" />
            <x-input-error :messages="$errors->get('email')" class="mt-2" />
        </div>

        <!-- Password -->
        <div class="mt-4">
            <x-input-label for="password" :value="__('Password')" />

            <x-text-input id="password" class="block mt-1 w-full"
                            type="password"
                            name="password"
                            required autocomplete="new-password" />

            <x-input-error :messages="$errors->get('password')" class="mt-2" />
        </div>

        <!-- Confirm Password -->
        <div class="mt-4">
            <x-input-label for="password_confirmation" :value="__('Confirm Password')" />

            <x-text-input id="password_confirmation" class="block mt-1 w-full"
                            type="password"
                            name="password_confirmation" required autocomplete="new-password" />

            <x-input-error :messages="$errors->get('password_confirmation')" class="mt-2" />
        </div>

        <!-- Security Question -->
        <div class="mt-4">
            <x-input-label for="securite_question_id" :value="__('Security Question')" />
            <select id="securite_question_id" name="securite_question_id" class="block mt-1 w-full" required>
                @foreach(App\Models\SecuriteQuestion::all() as $question)
                    <option value="{{ $question->id }}">{{ $question->question }}</option>
                @endforeach
            </select>
            <x-input-error :messages="$errors->get('securite_question_id')" class="mt-2" />
        </div>

        <!-- Security Answer -->
        <div class="mt-4">
            <x-input-label for="reponse" :value="__('Answer')" />
            <x-text-input id="reponse" class="block mt-1 w-full" type="text" name="reponse" required />
            <x-input-error :messages="$errors->get('reponse')" class="mt-2" />
        </div>

        <!-- Date of Birth -->
        <div class="mt-4">
            <x-input-label for="date_naissance" :value="__('Date of Birth')" />
            <x-text-input id="date_naissance" class="block mt-1 w-full" type="date" name="date_naissance" required />
            <x-input-error :messages="$errors->get('date_naissance')" class="mt-2" />
        </div>

        <!-- Phone Number -->
        <div class="mt-4">
            <x-input-label for="telephone" :value="__('Phone Number')" />
            <x-text-input id="telephone" class="block mt-1 w-full" type="text" name="telephone" required />
            <x-input-error :messages="$errors->get('telephone')" class="mt-2" />
        </div>

        <div class="flex items-center justify-end mt-4">
            <a class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" href="{{ route('login') }}">
                {{ __('Already registered?') }}
            </a>

            <x-primary-button class="ms-4">
                {{ __('Register') }}
            </x-primary-button>
        </div>
    </form>
</x-guest-layout>
