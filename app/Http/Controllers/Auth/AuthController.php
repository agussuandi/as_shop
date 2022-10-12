<?php
 
namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request; 
use App\Http\Controllers\Controller;

use DB;
use Auth;
use Hash;
use Exception;

use App\Models\User;

class AuthController extends Controller
{
    public function index()
    {
        try
        {
            return view('front.auth.login');
        }
        catch (Exception $e)
        {
            abort(500);
        }
    }

    public function register(Request $request)
    {
        try
        {
            return view('front.auth.register');
        }
        catch (Exception $e)
        {
            abort(500);
        }
    }

    public function registerStore(Request $request)
    {
        try
        {
            DB::beginTransaction();
            $user               = new User;
            $user->name         = $request->name;
            $user->username     = $request->username;
            $user->password     = Hash::make($request->password);
            $user->email        = $request->email;
            $user->created_by   = 1;
            $user->created_at   = now();
            $user->save();
            DB::commit();

            return redirect('/login')->with('success', 'Registrasi berhasil, silahkan login dengan Username dan Passowrd');
        }
        catch (Exception $e)
        {
            DB::rollBack();
            return back()->with('error', 'Terjadi kesalahan saat registrasi');
        }
    }

    public function login(Request $request)
    {
        try
        {
            $data = [
                'username' => $request->username,
                'password' => $request->password
            ];

            Auth::attempt($data);
            if (Auth::check())
            {
                cache()->forget('reportPenjualan');
                return redirect('/')->with('success', 'Login success');;
            }
            else
            {
                return back()->with('error', 'Email atau password salah');
            }
        }
        catch (Exception $e)
        {
            return back()->with('error', 'Opps, terjadi kesalahan saat login');
        }
    }

    public function logout()
    {
        Auth::logout();
        return redirect('/');
    }
}