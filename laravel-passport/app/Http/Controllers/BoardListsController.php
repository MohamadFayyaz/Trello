<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Models\board_list;
use Symfony\Component\HttpFoundation\Response;

class BoardListsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     public function __construct() {
         $this->board_list= new board_list();  
     }    
    public function index($board_id)
    {
        //
        $members = $this->board_list->getMembers($board_id); 
        $list = $this->board_list->getList($board_id); 
        $board = $this->board_list->getBoard($board_id); 
        $response = [
            'message' => 'List All Data order By DESC',
            'id' => $board[0]->id,
            'name' => $board[0]->name,
            'creator_id' => $board[0]->creator_id,
            'members' => $members,
            'list' => $list,
        ];

        return response()->json($response, Response::HTTP_OK);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}