<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;


class board_list extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
    ];
    
    public function getList($board_id)
    {
        # code...
        $user = DB::table('board_lists')
        ->where('board_id', '=', $board_id)
        ->get();
        return $user;
    }

    public function getMembers($board_id)
    {
        # code...
        $members = DB::table('board_members')
        ->where('board_id', '=', $board_id)
        ->get();
        return $members;
    }

    public function getBoard($board_id)
    {
        # code...
        $board = DB::table('boards')
        ->where('id', '=', $board_id)
        ->get();
        return $board;
    }
}
