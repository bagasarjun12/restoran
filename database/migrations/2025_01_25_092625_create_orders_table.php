<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('nama_customer');
            $table->string('nomor_meja');
            $table->date('tanggal');
            $table->time('waktu');
            $table->string('status');
            $table->integer('total');
            $table->unsignedBigInteger('id_kasir')->nullable();
            $table->unsignedBigInteger('id_waitress');
            $table->timestamps();
            $table->foreign('id_kasir')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('id_waitress')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
