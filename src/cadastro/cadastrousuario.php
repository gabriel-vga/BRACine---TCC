<?php 
    ob_start();
    session_start();

    require 'conexao.php';

                $Erro = "";
                if (!isset($_GET['acao']) and empty($_GET['acao'])) { //pressionou o botão
                  if (isset($_POST['incluir'])) {
                    if (empty($_POST['email'])
                      OR empty($_POST['nome'])
                      OR empty($_POST['senha'])) { //não preencheu os dados obrigatórios
                      $Erro = "<h5>Preencha os campo obrigatórios!</h5>";
                      echo "<script>alert('Preencha os campos obrigatórios para se cadastrar.')</script>";
                      echo "<script>window.location.href='signup.html'</script>";
                    } else { //preencheu corretamente
                      $nome      = $_POST['nome'];
                      $email     = $_POST['email'];
                      $senha      = $_POST['senha'];
                      //inciar o cadastro

                      $sql = "INSERT INTO user 
                      (email,
                      nome,
                      senha) 
                      VALUES
                      ('$nome',
                      '$email',
                      '$senha')";
                      //inserção do dado
                      if (mysqli_query($conexao, $sql)) {
                        echo "<script>alert('Cliente cadastrado com sucesso')</script>";
                        echo "<script>window.location.href = 'signin.html'</script>";
                      } else {
                        echo "<script>alert('Erro ao cadastrar')</script>";
                      }
                    }
                  }
                }


    ob_end_flush();
?>