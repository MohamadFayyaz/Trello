<?php

namespace App\Http\Controllers;

use App\Models\Board;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class BoardsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct() {
        $this->Board = new Board();
    }
    
    public function index()
    {
        //
        // $boards = Board::orderBy('created_at', 'DESC')->get();
        $allBoards = $this->Board->getAllBoards(Auth::id()); 
        $response = [
            'message' => 'List Boards order By DESC',
            'data' => $allBoards,
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
        
        $validator = Validator::make($request->all(), [
            'name' => 'required',
        ]);
        
        if ($validator->fails()) {
            return response()->json($validator->errors(), Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        try {
            $dataBoars = [
                'creator_id' => Auth::id(),
                'name' => request()->name,
            ];


            $id = $this->Board->addData($dataBoars);
            
            $board_members = [
                'board_id' => $id,
                'user_id' => Auth::id()
            ];

            $this->Board->addMember($board_members);
            
            $response = [
                'message' => 'Board Created',
            ];

            return response()->json($response, Response::HTTP_CREATED);
        } catch (QueryException $e) {
            //throw $th;
            return $response = [
                        'error' => $e->errorInfo,
                    ];
        }
    }



    public function addBoardMember(Request $request)
    {
        # code...
        try {

            //code...
        } catch (QueryException $e) {
            //throw $th;
            return $response = [
                        'error' => $e->errorInfo,
                    ];
        }
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
        $members = $this->Board->getMembers($id); 
        $list = $this->Board->getList($id); 
        $board = $this->Board->getBoard($id); 
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
        $board = Board::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        try {
            $board->update($request->all());
            $response = [
                'message' => 'Transaction Update',
                'data' => $board,
            ];

            return response()->json($board, Response::HTTP_OK);
        } catch (QueryException $e) {
            //throw $th;
            $response = [
                        'message' => 'Failed ' . $e->errorInfo,
                    ];
            return response()->json($response, Response::HTTP_BAD_REQUEST);
        }
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
        $board = Board::findOrFail($id);
        try {
            $board->delete();
            $response = [
                'message' => 'Board Delete',
            ];

            return response()->json($response, Response::HTTP_OK);
        } catch (QueryException $e) {
            //throw $th;
            return $response = [
                        'message' => 'Failed ' . $e->errorInfo,
                    ];
        }
    }
}
