<?php

namespace App\Http\Controllers;

use App\Models\items;
use App\Models\orders;
use App\Models\order_detail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    public function order(Request $request){
        $request->validate([
            'nama_customer' => 'required|max:255',
            'nomor_meja' => 'required',
            'total' => 'integer|required',
        ]);
        
        try {
            DB::beginTransaction();
                // Buat semua penyimpanan disini
                $request['tanggal'] = now()->toDateString(); // Format: YYYY-MM-DD
                $request['waktu'] = now()->toTimeString(); // Format: HH:MM:SS
                $request['status'] = 'order';
                $request['id_waitress'] = auth()->user()->id;
                $order = orders::create($request->all());

                $totalHarga = 0;

                // Simpan data order_details
                collect($request->items)->map(function($item) use($order, &$totalHarga){
                    $dataItem = items::where('id', $item)->first();
                    $totalHarga += $dataItem->harga;
                    order_detail::create([
                        'id_order' => $order->id,
                        'id_item' => $dataItem->id,
                        'harga' => $dataItem->harga,
                        'jumlah' => $item['qty'],
                    ]);
                });

            DB::commit();
        } catch (\Throwable $th) {
            DB::rollback();
            return response($th);
        }

        return response(['Berhasil menyimpan order', 'data' => $order, $totalHarga]);
    }

    public function showOrder(){
        $allOrders = orders::select('id', 'nama_customer', 'nomor_meja', 'tanggal', 'waktu', 'status')->get();
        return response(['data' => $allOrders]);
    }

    public function onlyOrder(){
        $allOrders = orders::where('status', 'order')->get();
        return response(['data' => $allOrders]);
    }

    public function onlyPaid(){
        $allOrders = orders::where('status', 'paid')->get();
        return response(['data' => $allOrders]);
    }

    public function setToPaid(Request $request){
        $order = orders::findOrFail($request->id);
        if($order->status != 'order'){
            return response('Cannot change order data if its status is not "Order"', 403);
        }
        $order->status = 'paid';
        $order->save();
        return response(['data' => $order]);
    }

    public function detailOrder($id){
        $data = orders::findOrFail($id);
        return response (['data' => $data->loadMissing(['orderDetail:id_order,harga,jumlah,id_item','orderDetail.items:id,nama,gambar','waitress:id,name','kasir:id,name'])]);
    }
    

    public function setToDone($id){
        $order = orders::findOrFail($id);
        if($order->status != 'paid'){
            return response('Cannot change order data if its status is not "Paid"', 403);
        }
        $order->status = 'done';
        $order->save();
        return response(['data' => $order]);
    }

    public function payment($id){
        $order = orders::findOrFail($id);
        if($order->status != 'done'){
            return response('Cannot change order data if its status is not "Done"', 403);
        }
        $order->status = 'paid';
        $order->save();
        return response(['data' => $order]);
    }
}
