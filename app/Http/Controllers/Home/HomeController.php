<?php
 
namespace App\Http\Controllers\Home;

use Illuminate\Http\Request; 
use App\Http\Controllers\Controller;

use Exception;

use App\Models\MProducts\MProducts;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        try
        {
            $products = cache()->remember('products', 600, function () {
                return MProducts::paginate(10);
            });
            
            return view('front.home.index', [
                'products' => $products
            ]);    
        }
        catch (Exception $e)
        {
            abort(500);
        }
    }

    public function product($id)
    {
        try
        {
            $product = MProducts::find(decrypt($id));

            return view('front.home.product', [
                'product' => $product
            ]);
        }
        catch (Exception $e)
        {
            abort(500);
        }
    }
}