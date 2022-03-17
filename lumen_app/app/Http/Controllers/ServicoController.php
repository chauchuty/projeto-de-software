<?php

namespace App\Http\Controllers;

use App\Models\Servico;
use Illuminate\Http\Request;

class ServicoController extends Controller
{
    
    public function showAllServicos()
    {
        return response()->json(Servico::all());
    }

    public function showOneServico($id)
    {
        return response()->json(Servico::find($id));
    }

    public function create(Request $request)
    {
        $Servico = Servico::create($request->all());

        return response()->json($Servico, 201);
    }

    public function update($id, Request $request)
    {
        $Servico = Servico::findOrFail($id);
        $Servico->update($request->all());

        return response()->json($Servico, 200);
    }

    public function delete($id)
    {
        Servico::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }
}