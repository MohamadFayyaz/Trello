<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Board extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
    ];

    public function addData($data)
    {
        # code...
        $id = DB::table('boards')->insertGetId($data);
        return $id;
    }

    public function addMember($data)
    {
        # code...
        DB::table('board_members')->insert($data);
    }

    public function getAllBoards($user_id)
    {
        # code...
        $allBoard = DB::table('boards')
        ->leftJoin('board_members', 'boards.id', '=', 'board_members.board_id')
        ->where('board_members.user_id', '=', $user_id)
        ->select('boards.id', 'boards.name', 'boards.creator_id')
        ->get();
        return $allBoard;
    }

    public function getList($board_id)
    {
        # code...
        $user = DB::table('board_lists')
        ->where('board_id', '=', $board_id)
        ->select('id', 'name', 'order')
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
