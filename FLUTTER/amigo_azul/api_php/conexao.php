//https://www.youtube.com/watch?v=Fl8oy3vynBI&list=PLxNM4ef1Bpxj1f7omT1wuZLJWu1deF_Nq&index=6&ab_channel=HugoVasconcelos
<?php
$banco = 'id15982740_amigo_azul';
$usuario = 'id15982740_admin';
$senha = 'uxL?Lh*yOx38jTD8';
$servidor ='localhost';
date_default_timezone_set('America/Sao_Paulo');

try{
 $pdo = new PDO ("mysql:dbname=$banco;host=$servidor;charset=utf8","$usuario","$senha");
//echo"Conexão Bem Sucedida!";
}catch( PDOException $erro){
 $error = $erro->getMessage();
 echo "Erro ao Conectar ao Banco de dados!".$error;
}