<?php

namespace App\Http\Controllers;

use App\Models\Pacote;
use Illuminate\Http\Request;

class PacoteController extends Controller
{
    
    public function showAllPacotes()
    {
        return response()->json(Pacote::all());
    }

    public function showOnePacote($id)
    {
        return response()->json(Pacote::find($id));
    }

    public function create(Request $request)
    {
        $Pacote = Pacote::create($request->all());

        return response()->json($Pacote, 201);
    }

    public function update($id, Request $request)
    {
        $Pacote = Pacote::findOrFail($id);
        $Pacote->update($request->all());

        return response()->json($Pacote, 200);
    }

    public function delete($id)
    {
        Pacote::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }
}