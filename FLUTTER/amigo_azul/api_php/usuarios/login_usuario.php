/*https://www.youtube.com/watch?v=-FP3e1UvPfM&ab_channel=ShajedulIslamShawon*/
<?php
include_once('../conexao.php');

$email = $_POST['email'];
$senha = $_POST['senha'];

$sql = "SELECT * FROM cad_usuario WHERE email = '".$email."' AND senha = '".$senha."'";

$resultado = mysqli_query($sql);
$count = mysqli_num_rows($resultado);

if ($count ==1){
    echo json_encode ("erro");
} else{
    echo json_encode ("sucesso");
}


?>