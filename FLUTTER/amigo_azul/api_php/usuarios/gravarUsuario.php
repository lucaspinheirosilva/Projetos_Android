<?php 
$banco = 'id15982740_amigo_azul';
$usuario = 'id15982740_admin';
$senha = 'uxL?Lh*yOx38jTD8';
$servidor ='localhost';

$conn = mysqli_connect($servidor,$usuario,$senha,$banco);
if(!conn){
    echo("Erro de conexao". mysqli_connect_error());
}


  /*$email = $_POST['email'];
  $senha = $_POST['senha'];
  $nome = $_POST['nome'];
  $idade = $_POST['idade'];
  $foto = $_POST['foto'];
  $nivelTea = $_POST['nivelTea'];*/
  
  $email = "elaine@gmail.com";
  $senha = "1111";
  $nome = "teste";
  $idade = "22";
  $foto = null;
  $nivelTea = "1";

  $select = "SELECT * FROM cad_user WHERE email = '".$email."'";
  /*$insert = "INSERT INTO cad_user VALUES(55,'".$nome."','".$idade."','".$senha."','".$foto."','".$email."','".$nivelTea."')";*/

    $insert = "INSERT INTO cad_user (nome, idade, senha, foto, email, nivel_tea) VALUES('teste',22,'123456','foto','elaine@gmail.com','3')";

  $resultado = mysqli_query($conn,$select);
  $contador = mysqli_num_rows($resultado);
  echo  $contador;

  if($contador >0){
      echo json_encode(array("resultado"=>"ja existe"));
  }else{
      
        //$query = mysqli_query($conn,$insert);
        if (mysqli_query($conn, $insert)) {
          echo (array("resultado"=>"sucesso"));
        } else {
          echo "Error: " . $insert . "<br>" . mysqli_error($conn);
        }
        
  }
  mysqli_close($conn);

?>

