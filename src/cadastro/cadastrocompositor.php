<?php
require 'conexao.php';

$compositorErro = "";
$compositor = "";

/** EXCLUSÃO **/
if (isset($_POST['excluir'])) { //Botão excluir pressionado
    if (!empty($_POST['cat'])) { //Verifica se existem categorias
        foreach ($_POST['cat'] as $cat => $id) {
            echo $id . "<br>";
            $sql = "DELETE FROM compositor WHERE id = '$id'";
            if (mysqli_query($conexao, $sql)) {
                echo "<script>alert('Compositor(es) apagado(s) com sucesso!')</script>";
                echo "<script>window.location.href = 'cadastrocompositor.php'</script>"; //Limpando URL
            } else {
                echo "Erro: " . $sql . " " . mysqli_error($conexao);
            }
        }
    }
}

/** EDIÇÃO **/
if (isset($_GET['acao'])) {
    echo $_GET['cat']; //Está vindo via URL
    $id = $_GET['cat']; //Guarda o id do compositor

    if (isset($_POST['editar'])) {
        $nome = $_POST['nome']; //Recebe o novo nome que vem do form
        $sql = "UPDATE compositor SET nome = '$nome' WHERE id = '$id'";
        if (mysqli_query($conexao, $sql)) {
            echo "<script>alert('Compositor alterado com sucesso!')</script>";
            echo "<script>window.location.href = 'cadastrocompositor.php'</script>";
        }
        //header("Location:cadastrocompositor.php");
    }
?>
    <!-- FORMULÁRIO DE EDIÇÃO DE COMPOSITORES -->
    <fieldset>
        <legend>.::Editar Compositores::.</legend>
        <form action="" method="post">
            <p>* obrigatório </p>
            <p>
                <label for="nome">Compositor: </label>
                <input type="text" name="nome"> * <?php echo $nomeErro ?>
            </p>
            <input type="submit" name="editar" value="Editar">
        </form>
    </fieldset>
    <hr>
    <br>
<?php
}

if (!isset($_GET['acao'])) { //pressionou o botão

    if (empty($_POST['nome'])) { //não preencheu o nome do compositor
        $nomeErro = "obrigatório";
    } else if (empty($_POST['nascimento'])) { //não preencheu o nome do compositor
        $nascimentoErro = "obrigatório";
    } else if (empty($_POST['naturalidade'])) { //não preencheu o nome do compositor
        $naturalidadeErro = "obrigatório";
    } else if (empty($_POST['biografia'])) { //não preencheu o nome do compositor
        $biografiaErro = "obrigatório";
    } else { // preencheu corretamente
        $nome = $_POST['nome'];
        //inciar o cadastro

        $sql = "INSERT INTO compositor (nome) VALUES ('$compositor')";
        //inserção do dado
        if (mysqli_query($conexao, $sql)) {
            echo "<script>alert('Compositores cadastrado com sucesso')</script>";
        } else {
            echo "<script>alert('Erro ao cadastrar')</script>";
        }
    }
?>

    <!-- FORMULÁRIO DE CADASTRO DE COMPOSITORES -->
    <fieldset>
        <legend>.::Cadastro de Compositores::.</legend>
        <form action="" method="post">
            <p>* obrigatório </p>
            <p>
                <label for="compositor">Compositor: </label>
                <input type="text" name="nome"> * <?php echo $nomeErro ?>
            </p>
            <input type="submit" name="cadastrar" class="btn btn-primary" value="Cadastrar">
        </form>
    </fieldset>
    <hr>
    <p>
    <?php
}
//Listar os compositores cadastradas
require 'conexao.php';

$sql = "SELECT * FROM compositor";

$result = mysqli_query($conexao, $sql); //guarda o resultado da consulta

if (mysqli_num_rows($result) > 0) {
    ?>
    <form action="" method="post">
        <table class="table table-striped">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Nascimento</th>
                <th>Naturalidade</th>
                <th>Biografia</th>
                <th>EDITAR</th>
                <th>EXCLUIR</th>
            </tr>
            <?php
            while ($compositor = mysqli_fetch_assoc($result)) {
            ?>
                <tr>
                    <td><?php echo $compositor['id'] ?></td>
                    <td><?php echo $compositor['nome'] ?></td>
                    <td><?php echo $compositor['nascimento'] ?></td>
                    <td><?php echo $compositor['naturalidade'] ?></td>
                    <td><?php echo $compositor['biografia'] ?></td>
                    <td><a href="?acao=edit&cat=<?php echo $compositor['id'] ?>">editar</a></td>
                    <td><input type="checkbox" name="cat[]" value="<?php echo $compositor['id'] ?>"></td>
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