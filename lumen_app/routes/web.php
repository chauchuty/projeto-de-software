<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['prefix' => 'api/v1/'], function () use ($router) {  
    // Serviços
    $router->get('servicos',         ['uses' => 'ServicoController@showAll']);
    $router->get('servicos/{id}',    ['uses' => 'ServicoController@showOne']);
    $router->post('servicos',        ['uses' => 'ServicoController@create']);
    $router->delete('servicos/{id}', ['uses' => 'ServicoController@delete']);
    $router->put('servicos/{id}',    ['uses' => 'ServicoController@update']);
    
    // Pacotes
    $router->get('pacotes',         ['uses' => 'PacoteController@showAll']);
    $router->get('pacotes/{id}',    ['uses' => 'PacoteController@showOne']);
    $router->post('pacotes',        ['uses' => 'PacoteController@create']);
    $router->delete('pacotes/{id}', ['uses' => 'PacoteController@delete']);
    $router->put('pacotes/{id}',    ['uses' => 'PacoteController@update']);
});