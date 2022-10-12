@extends('front.layouts.app')
@section('content')
    <div class="card">
        <div class="card-header">
            Register Account
        </div>
        <form action="{{ route('register.store') }}" method="POST">
            <div class="card-body">
                @csrf
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required autocomplete="off" autofocus maxlength="200" />
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required autocomplete="off" autofocus maxlength="100" />
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required maxlength="150" />
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required maxlength="255" />
                </div>
            </div>
            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Registrasi</button>
            </div>
        </form>
    </div>
@stop
@section('javascript')
    
@endsection