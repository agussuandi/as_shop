@extends('front.layouts.app')
@section('content')
    <div class="card">
        <div class="card-header">
            Report Penjualan
        </div>
        <div class="card-body">
            <div class="row">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Code</th>
                                <th>Date</th>
                                <th>Total</th>
                                <th>#</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($reports as $keyReport => $report)
                                <tr>
                                    <td>{{ $reports->firstItem() + $keyReport }}</td>
                                    <td>{{ $report->code }}</td>
                                    <td>{{ $report->trans_date }}</td>
                                    <td>Rp. {{ AppHelper::formatCurrency($report->total) }}</td>
                                    <td>
                                        <a href="{{ route('report.show', encrypt($report->id)) }}" class="btn btn-primary btn-sm">Detail</a>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="5" class="text-center">Data Kosong</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
                {{ $reports->links('pagination::bootstrap-4') }}
            </div>
        </div>
    </div>
@stop
@section('javascript')
    
@endsection