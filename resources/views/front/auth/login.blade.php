@extends('front.layouts.app')
@section('content')
    <div class="card">
        <div class="card-header">
            Login
        </div>
        <form action="{{ route('login') }}" method="POST">
            <div class="card-body">
                @csrf
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required autocomplete="off" autofocus />
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required />
                </div>
                <div class="mb-1">
                    <a href="{{ route('register') }}">Register Account</a>
                </div>
            </div>
            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>
    </div>
@stop
@section('javascript')
    
@endsection