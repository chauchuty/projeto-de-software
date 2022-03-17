<?php
    namespace App\Models;
    use Illuminate\Database\Eloquent\Model;
    
    class Servico extends Model
    {
        protected $table = 'servico';

        protected $fillable = [
            'id', 
            'nome', 
            'descricao', 
            'preco'
        ];

        protected $hidden = [
            'created_at',
            'updated_at'
        ];

        // public static $rules = [
        //     "name" => "required|max:120",
        //     "lastname" => "required|max:120",
        //     "email" => "required|email|max:60",
        //     "telephone" => "required|max:32",
        // ];
    }
?>