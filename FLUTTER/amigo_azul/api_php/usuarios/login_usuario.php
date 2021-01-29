
<?php
include_once('../conexao.php');


$email = $_POST['email'];
$senha = $_POST['senha'];


$dados = array();

$query = $pdo->query("SELECT * FROM CAD_USUARIO WHERE email = '".$email."' AND senha = '".$senha."'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($res); $i++) {
    foreach ($res[$i] as $key => $value) {}
    $dados = $res;
}

echo ($res)?json_encode(array("codigo"=>1,"resultado"=>$dados)):json_encode(array("codigo"=>0,"resultado"=>"USUARIO NAO ENCONTRADOS!"));

?>