<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBoardMembersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('board_members', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('board_id');
            $table->foreign('board_id')->references('id')->on('boards')->onUpdate('cascade')->onDelete('cascade');
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onUpdate('cascade')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('board_members');
    }
}
