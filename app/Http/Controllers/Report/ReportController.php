<?php
 
namespace App\Http\Controllers\Report;

use Illuminate\Http\Request; 
use App\Http\Controllers\Controller;

use DB;
use Crypt;
use Exception;

use App\Models\TrxHPenjualan\TrxHPenjualan;
use App\Models\TrxDPenjualan\TrxDPenjualan;

class ReportController extends Controller
{
    public function index(Request $request)
    {
        try
        {
            $reports = cache()->remember('reportPenjualan', 600, function () {
                return TrxHPenjualan::where('created_by', auth()->user()->id)->paginate(10);
            });

            return view('front.report.index', [
                'reports' => $reports
            ]);    
        }
        catch (Exception $e)
        {
            abort(500);
        }
    }

    public function show(Request $request, $id)
    {
        try
        {
            $report = TrxHPenjualan::with('trxDetail')
                ->where('id', decrypt($id))
            ->first();
            return view('front.report.show', [
                'report' => $report
            ]);    
        }
        catch (Exception $e)
        {
            abort(500);
        }
    }
}