<?php
require 'conexao.php';

$generoErro = "";
$genero = "";

/** EXCLUSÃO **/
if (isset($_POST['excluir'])) { //Botão excluir pressionado
  if (!empty($_POST['cat'])) { //Verifica se existem categorias
    foreach ($_POST['cat'] as $cat => $id) {
      echo $id . "<br>";
      $sql = "DELETE FROM genero WHERE id = '$id'";
      if (mysqli_query($conexao, $sql)) {
        echo "<script>alert('Gênero(s) apagado(s) com sucesso!')</script>";
        echo "<script>window.location.href = 'cadastrogenero.php'</script>"; //Limpando URL
      } else {
        echo "Erro: " . $sql . " " . mysqli_error($conexao);
      }
    }
  }
}

/** EDIÇÃO **/
if (isset($_GET['acao'])) {
  echo $_GET['cat']; //Está vindo via URL
  $id = $_GET['cat']; //Guarda o id do genero

  if (isset($_POST['editar'])) {
    $genero = $_POST['genero']; //Recebe o novo nome que vem do form
    $sql = "UPDATE genero SET nome = '$genero' WHERE id = '$id'";
    if (mysqli_query($conexao, $sql)) {
      echo "<script>alert('Gênero alterado com sucesso!')</script>";
      echo "<script>window.location.href = 'cadastrogenero.php'</script>";
    }
    //header("Location:cadastrogenero.php");
  }
?>
  <!-- FORMULÁRIO DE EDIÇÃO DE GÊNEROS -->
  <fieldset>
    <legend>.::Editar Gênero::.</legend>
    <form action="" method="post">
      <p>* obrigatório </p>
      <p>
        <label for="genero">Gênero: </label>
        <input type="text" name="genero"> * <?php echo $generoErro ?>
      </p>
      <input type="submit" name="editar" value="Editar">
    </form>
  </fieldset>
  <hr>
  <br>
<?php
}

if (!isset($_GET['acao'])) { //pressionou o botão

  if (empty($_POST['genero'])) { //não preencheu o nome do genero
    $generoErro = "obrigatório";
  } else { // preencheu corretamente
    $genero = $_POST['genero'];
    //inciar o cadastro

    $sql = "INSERT INTO genero (nome) VALUES ('$genero')";
    //inserção do dado
    if (mysqli_query($conexao, $sql)) {
      echo "<script>alert('Gênero cadastrado com sucesso')</script>";
    } else {
      echo "<script>alert('Erro ao cadastrar')</script>";
    }
  }
?>

  <!-- FORMULÁRIO DE CADASTRO DE GÊNEROS -->
  <fieldset>
    <legend>.::Cadastro de Gêneros::.</legend>
    <form action="" method="post">
      <p>* obrigatório </p>
      <p>
        <label for="genero">Gênero: </label>
        <input type="text" name="genero"> * <?php echo $generoErro ?>
      </p>
      <input type="submit" name="cadastrar" class="btn btn-primary" value="Cadastrar">
    </form>
  </fieldset>
  <hr>
  <p>
  <?php
}
//Listar os gêneros cadastradas
require 'conexao.php';

$sql = "SELECT * FROM genero";

$result = mysqli_query($conexao, $sql); //guarda o resultado da consulta

if (mysqli_num_rows($result) > 0) {
  ?>
  <form action="" method="post">
    <table class="table table-striped">
      <tr>
        <th>Código</th>
        <th>Gênero</th>
        <th>EDITAR</th>
        <th>EXCLUIR</th>
      </tr>
      <?php
      while ($genero = mysqli_fetch_assoc($result)) {
      ?>
        <tr>
          <td><?php echo $genero['id'] ?></td>
          <td><a href="generospg.php?pg=generospgx&id=<?php echo $genero['id'] ?>"><?php echo $genero['nome'] ?></a></td>
          <td><a href="?acao=edit&cat=<?php echo $genero['id'] ?>">editar</a></td>
          <td><input type="checkbox" name="cat[]" value="<?php echo $genero['id'] ?>"></td>
        </tr>
      <?php
      }
      ?>
    </table>
    <div align="left"><input type="submit" name="excluir" class="btn btn-primary" value="Excluir"></div>
  </form>
<?php
}

?>
</p>