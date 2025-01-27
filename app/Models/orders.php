<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class orders extends Model
{
    use HasFactory;

    protected $primaryKey = 'id';

    protected $fillable = [
        'nama_customer', 
        'nomor_meja', 
        'tanggal',
        'waktu',
        'status',
        'total',
        'id_kasir',
        'id_waitress'
    ];

    /**
     * Get all of the orderDetail for the orders
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function orderDetail(): HasMany
    {
        return $this->hasMany(order_detail::class, 'id_order', 'id');
    }

    /**
     * Get the user that owns the orders
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function waitress(): BelongsTo
    {
        return $this->belongsTo(User::class, 'id_waitress', 'id');
    }

    /**
     * Get the kasir that owns the orders
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function kasir(): BelongsTo
    {
        return $this->belongsTo(User::class, 'id_kasir', 'id');
    }
}
