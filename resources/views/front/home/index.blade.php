@extends('front.layouts.app')
@section('content')
    <div class="card">
        <div class="card-header">
            Selamat Belanja!
        </div>
        <div class="card-body">
            <div class="row">
                @forelse ($products as $keyProduct => $product)
                    <div class="col-md-4 mt-3">
                        <div class="card" style="width: 18rem;">
                            <img src="{{ url($product->thumbnail) }}" class="card-img-top" alt="product" loading="lazy" style="cursor: pointer" data-uri="{{ route('home.product', encrypt($product->id)) }}" onclick="handleProductDetail(this)" />
                            <div class="card-body">
                                <p class="mb-1">{{ $product->name }}</p>
                                <p class="card-text">
                                    @if ((int)$product->discount > 0)
                                        Rp. <del>{{ AppHelper::formatCurrency($product->price) }}</del> {{ AppHelper::handleDiscount($product->price, $product->discount) }}
                                    @else
                                        Rp. {{ AppHelper::formatCurrency($product->price) }}
                                    @endif
                                </p>
                                <a href="{{ route('cart.store') }}" class="btn btn-primary" onclick="event.preventDefault(); document.getElementById('buy-form-{{ $product->id }}').submit();" class="btn btn-danger btn-sm">
                                    <span>Buy</span>
                                    <form id="buy-form-{{ $product->id }}" action="{{ route('cart.store') }}" method="POST" style="display: none;">
                                        @csrf
                                        <input type="hidden" value="{{ encrypt($product->id) }}" name="id" readonly />
                                    </form>
                                </a>
                            </div>
                        </div>
                    </div>
                @empty
                    <p class="text-dark">Barang Kosong</p>
                @endforelse
            </div>
            {{ $products->links('pagination::bootstrap-4') }}
        </div>
    </div>
@stop
@section('javascript')
    <script>
        handleProductDetail = obj => {
            window.location.href = obj.getAttribute('data-uri')       
        }
    </script>
@endsection