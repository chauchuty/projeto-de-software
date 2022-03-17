<?php
    namespace App\Models;
    use Illuminate\Database\Eloquent\Model;
    
    class Pacote extends Model
    {
        protected $table = 'pacote';

        protected $fillable = [
            'id', 
            'nome', 
            'descricao', 
            'fk_promocao'
        ];

        protected $hidden = [];

        // public static $rules = [
        //     "name" => "required|max:120",
        //     "lastname" => "required|max:120",
        //     "email" => "required|email|max:60",
        //     "telephone" => "required|max:32",
        // ];
    }
?>