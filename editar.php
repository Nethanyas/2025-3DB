<?php
include 'conexao.php';
$id = $_POST['btnEditar'];
$sql = $pdo->prepare("SELECT * FROM produto WHERE id = ?");
$sql->execute([$id]);
$linha = $sql->fetch(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Aluno</title>
</head>

<body>
    <h1>Editar o produto: <?php echo $linha['nome'] ?></h1>

    <div class="container">
        <form action="atualizar.php" method="POST">
            <input type="hidden" name="id"
                value="<?php echo $linha['id'] ?>">

            <input type="text" name="nome" value="<?php echo $linha['nome'] ?>">

            <input type="descricao" name="descricao" value="<?php echo $linha['descricao'] ?>">

            <input type="preco" name="preco"
                value="<?php echo $linha['preco'] ?>">

            <input type="tipo" name="tipo"
            value="<?php echo $linha['tipo'] ?>">

            <input type="categoria" name="catedoria"
                value="<?php echo $linha['categoria'] ?>">

             <input type="data_lancamento" name="data_lancamento"
                value="<?php echo $linha['data_lancamento'] ?>">
                
            <input type="desconto_usados" name="desconto_usados"
                value="<?php echo $linha['desconto_usados'] ?>">

           
            <input type="submit" name="btnSalvar" value="Salvar"
                class="btn btn-primary">
        </form>
    </div>
</body>

</html>