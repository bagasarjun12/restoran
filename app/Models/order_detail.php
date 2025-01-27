<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class order_detail extends Model
{
    use HasFactory;

    protected $primaryKey = 'id';

    protected $fillable = [
        'id_order',
        'id_item',
        'harga',
        'jumlah',
    ];

    /**
     * Get the user that owns the order_detail
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function items(): BelongsTo
    {
        return $this->belongsTo(items::class, 'id_item', 'id');
    }
}
