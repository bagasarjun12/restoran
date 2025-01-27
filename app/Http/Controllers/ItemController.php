<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\items;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ItemController extends Controller
{
    public function item(Request $request){
        $request->validate([
            'nama' => 'required|max:255',
            'harga' => 'integer|required',
            'input_gambar' => 'nullable|mimes:png,jpg,jpeg',
        ]);

        if($request->file('input_gambar')){
            $file = $request->file('input_gambar');
            $fileName = $file->getClientOriginalName();
            $renamedFile = Carbon::now()->timestamp.'_'.$fileName;
            $request['gambar'] = $renamedFile;
            Storage::disk('public')->putFileAs('items', $file, $renamedFile);
        }

        $item = items::create($request->all());
        return response(['Item Berhasil Dibuat', 'data' => $item]);
    }

    public function itemUpdate(Request $request){
        $request->validate([
            'id' => 'required',
            'nama' => 'required|max:255',
            'harga' => 'integer|required',
            'input_gambar' => 'nullable|mimes:png,jpg,jpeg',
        ]);
        
        // ambil data yang akan diupdate
        $item = Items::find($request->id);

        // message jika tidak ditemukan
        if (!$item) {
            return response()->json(['message' => 'Item dengan ID ' . $request->id . ' tidak ditemukan.'], 404);
        }

        if($request->file('input_gambar')){
            $file = $request->file('input_gambar');
            $fileName = $file->getClientOriginalName();
            $renamedFile = Carbon::now()->timestamp.'_'.$fileName;
            $request['gambar'] = $renamedFile;
            Storage::disk('public')->putFileAs('items', $file, $renamedFile);
        }

        // Update data item
        $item->update($request->all());
        return response(['Item Berhasil Di Update', 'data' => $item]);
    }
    
}
