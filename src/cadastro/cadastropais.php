<?php
require 'conexao.php';

$paisErro = "";
$pais = "";

/** EXCLUSÃO **/
if (isset($_POST['excluir'])) { //Botão excluir pressionado
  if (!empty($_POST['cat'])) { //Verifica se existem categorias
    foreach ($_POST['cat'] as $cat => $id) {
      echo $id . "<br>";
      $sql = "DELETE FROM pais WHERE id = '$id'";
      if (mysqli_query($conexao, $sql)) {
        echo "<script>alert('País(es) apagado(s) com sucesso!')</script>";
        echo "<script>window.location.href = 'cadastropais.php'</script>"; //Limpando URL
      } else {
        echo "Erro: " . $sql . " " . mysqli_error($conexao);
      }
    }
  }
}

/** EDIÇÃO **/
if (isset($_GET['acao'])) {
  echo $_GET['cat']; //Está vindo via URL
  $id = $_GET['cat']; //Guarda o id do país

  if (isset($_POST['editar'])) {
    $pais = $_POST['pais']; //Recebe o novo pais que vem do form
    $sql = "UPDATE pais SET nome = '$pais' WHERE id = '$id'";
    if (mysqli_query($conexao, $sql)) {
      echo "<script>alert('País alterado com sucesso!')</script>";
      echo "<script>window.location.href = 'cadastropais.php'</script>";
    }
    //header("Location:cadastropais.php");
  }
?>
  <!-- FORMULÁRIO DE EDIÇÃO DE PAÍSES -->
  <fieldset>
    <legend>.::Editar Países::.</legend>
    <form action="" method="post">
      <p>* obrigatório </p>
      <p>
        <label for="pais">País: </label>
        <input type="text" name="pais"> * <?php echo $paisErro ?>
      </p>
      <input type="submit" name="editar" value="Editar">
    </form>
  </fieldset>
  <hr>
  <br>
<?php
}

if (!isset($_GET['acao'])) { //pressionou o botão

  if (empty($_POST['pais'])) { //não preencheu o nome do pais
    $paisErro = "obrigatório";
  } else { // preencheu corretamente
    $pais = $_POST['pais'];
    //inciar o cadastro

    $sql = "INSERT INTO pais (nome) VALUES ('$pais')";
    //inserção do dado
    if (mysqli_query($conexao, $sql)) {
      echo "<script>alert('País cadastrado com sucesso')</script>";
    } else {
      echo "<script>alert('Erro ao cadastrar')</script>";
    }
  }
?>

  <!-- FORMULÁRIO DE CADASTRO DE PAÍSES -->
  <fieldset>
    <legend>.::Cadastro de Países::.</legend>
    <form action="" method="post">
      <p>* obrigatório </p>
      <p>
        <label for="pais">País: </label>
        <input type="text" name="pais"> * <?php echo $paisErro ?>
      </p>
      <input type="submit" name="cadastrar" class="btn btn-primary" value="Cadastrar">
    </form>
  </fieldset>
  <hr>
  <p>
  <?php
}
//Listar os países cadastrados
require 'conexao.php';

$sql = "SELECT * FROM pais";

$result = mysqli_query($conexao, $sql); //guarda o resultado da consulta

if (mysqli_num_rows($result) > 0) {
  ?>
  <form action="" method="post">
    <table class="table table-striped">
      <tr>
        <th>Código</th>
        <th>País</th>
        <th>EDITAR</th>
        <th>EXCLUIR</th>
      </tr>
      <?php
      while ($pais = mysqli_fetch_assoc($result)) {
      ?>
        <tr>
          <td><?php echo $pais['id'] ?></td>
          <td><a href="paisespg.php?pg=paisespgx&id=<?php echo $pais['id'] ?>"><?php echo $pais['nome'] ?></a></td>
          <td><a href="?acao=edit&cat=<?php echo $pais['id'] ?>">editar</a></td>
          <td><input type="checkbox" name="cat[]" value="<?php echo $pais['id'] ?>"></td>
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