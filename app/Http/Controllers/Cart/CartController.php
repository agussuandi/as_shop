<?php
 
namespace App\Http\Controllers\Cart;

use Illuminate\Http\Request; 
use App\Http\Controllers\Controller;

use Exception;
use AppHelper;

use App\Models\MProducts\MProducts;

class CartController extends Controller
{
    public function index(Request $request)
    {
        try
        {
            $carts = session()->get('cart', []);
            return view('front.cart.index', [
                'carts' => $carts
            ]);    
        }
        catch (Exception $e)
        {
            abort(500);
        }
    }

    public function store(Request $request)
    {
        try
        {
            $product = MProducts::findOrFail(decrypt($request->id));
            $cart    = session()->get('cart', []);
    
            if (isset($cart[decrypt($request->id)]))
            {
                $cart[decrypt($request->id)]['quantity']++;
            }
            else
            {
                $cart[decrypt($request->id)] = [
                    'id'            => decrypt($request->id),
                    'name'          => $product->name,
                    'code'          => $product->code,
                    'price'         => $product->price,
                    'currency'      => $product->currency,
                    'discount'      => $product->discount,
                    'discountPrice' => AppHelper::handleDiscount($product->price, $product->discount, false),
                    'dimension'     => $product->dimension,
                    'unit'          => $product->unit,
                    'thumbnail'     => $product->thumbnail,
                    'quantity'      => 1
                ];
            }
            
            session()->put('cart', $cart);
            return redirect()->back()->with('success', 'Product added to cart successfully!');
        }
        catch (Exception $e)
        {
            abort(500);
        }
    }

    public function destroy(Request $request, $id)
    {
        $cart = session()->get('cart');
        if(isset($cart[decrypt($request->id)]))
        {
            unset($cart[decrypt($request->id)]);
            session()->put('cart', $cart);
        }
        return redirect()->back()->with('success', 'Product removed successfully');
    }
}