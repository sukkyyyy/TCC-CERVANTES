<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

$host = "localhost";
$db_name = "divine_cherie_db";
$username = "root";
$password = "";

try {
    $conn = new PDO("mysql:host=" . $host . ";dbname=" . $db_name . ";charset=utf8mb4", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $exception) {
    http_response_code(500);
    echo json_encode(array("error" => "Falha na conexão: " . $exception->getMessage()));
    exit();
}

$query = "SELECT 
            p.id, 
            p.nome, 
            p.preco, 
            p.essencia_principal, 
            p.descricao, 
            f.nome AS familia_olfativa,
            n.saida, 
            n.corpo, 
            n.fundo
          FROM perfumes p
          LEFT JOIN familias_olfativas f ON p.familia_id = f.id
          LEFT JOIN notas_olfativas n ON p.id = n.perfume_id
          ORDER BY p.id ASC";

try {
    $stmt = $conn->prepare($query);
    $stmt->execute();
    
    $perfumes = array();
    
    while ($row = $stmt->fetch(PDO::ATTR_ASSOC)) {
        $nomeLimpo = strtolower(str_replace(' ', '-', iconv('UTF-8', 'ASCII//TRANSLIT', $row['nome'])));
        
        $perfume_item = array(
            "id" => (int)$row['id'],
            "nome" => $row['nome'],
            "preco" => (float)$row['preco'],
            "familia_olfativa" => $row['familia_olfativa'],
            "essencia_principal" => $row['essencia_principal'],
            "descricao" => $row['descricao'],
            "imagem" => "Imagens/" . $nomeLimpo . ".jpg",
            "notas_detalhadas" => null
        );
        
        if ($row['saida'] !== null || $row['corpo'] !== null || $row['fundo'] !== null) {
            $perfume_item["notas_detalhadas"] = array(
                "saida" => $row['saida'],
                "corpo" => $row['corpo'],
                "fundo" => $row['fundo']
            );
        }
        
        array_push($perfumes, $perfume_item);
    }
    
    http_response_code(200);
    echo json_encode($perfumes, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

} catch(PDOException $exception) {
    http_response_code(500);
    echo json_encode(array("error" => "Erro na consulta: " . $exception->getMessage()));
}
?>