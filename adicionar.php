<?php
    include 'conexao.php';

    $nome = $_POST['nome'];
    $descricao = $_POST['descricao'];
    $preco = $_POST['preco'];
    $tipo = $_POST['tipo'];
    $categoria = $_POST['categoria'];
    $data_lancamento = $_POST['data_lancamento'];
    $desconto = $_POST['desconto'];

    $sql = $pdo->prepare("INSERT INTO produto (nome, descricao, preco, tipo, categoria, data_lancamento, desconto) VALUES (?, ?, ?, ?, ?, ?, ?)");

    $sql->execute([$nome, $descricao, $preco, $tipo, $categoria, $data_lancamento, $desconto]);

    header("Location: produtos.php");
    exit;
