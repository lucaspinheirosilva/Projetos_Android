<?php
include_once('../conexao.php');

$dados = array();

$query = $pdo->query("SELECT * FROM CAD_USUARIO");
$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0;$i < count($res);$i++){
    foreach($res[$i] as key => $value){}
    $dados = $res;    
}

echo ($res)?json_encode(array("codigo"=>1,"resultado"=>$dados)):json_encode(array("codigo"=>0"resultado"=>"DADOS NÃO ENCONTRADOS!"));
>?

