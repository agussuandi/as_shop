@extends('front.layouts.app')
@section('content')
    <style>
        ul {
           list-style-type: none;
           padding: 0;
           margin: 0 0 0 0;
        }
    </style>
    <div class="card">
        <div class="card-header">
            Product Detail
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <div>
                        <img src="{{ url($product->thumbnail) }}" alt="product" loading="lazy" />
                    </div>
                </div>
                <div class="col-md-8">
                    <div>
                        <ul>
                            <li>{{ $product->name }}</li>
                            <li>
                                @if ((int)$product->discount > 0)
                                    Rp. <del>{{ AppHelper::formatCurrency($product->price) }}</del> {{ AppHelper::handleDiscount($product->price, $product->discount) }}
                                @else
                                    Rp. {{ AppHelper::formatCurrency($product->price) }}
                                @endif
                            </li>
                            <li>Dimension : {{ $product->dimension }}</li>
                            <li>Price Unit : {{ $product->unit }}</li>
                        </ul>
                        <a href="{{ route('cart.store') }}" class="btn btn-primary mt-3" onclick="event.preventDefault(); document.getElementById('buy-form-{{ $product->id }}').submit();" class="btn btn-danger btn-sm">
                            <span>Buy</span>
                            <form id="buy-form-{{ $product->id }}" action="{{ route('cart.store') }}" method="POST" style="display: none;">
                                @csrf
                                <input type="hidden" value="{{ encrypt($product->id) }}" name="id" readonly />
                            </form>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop
@section('javascript')

@endsection