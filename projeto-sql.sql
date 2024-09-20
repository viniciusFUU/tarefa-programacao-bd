use venda;

--        14         --
SELECT 
ip.ped_numero,
p.pro_codigo,
p.prod_descricao
FROM item_pedido ip
LEFT JOIN produto p
ON ip.pro_codigo = p.pro_codigo
WHERE ip.pro_codigo = 1;

--        15         --
SELECT 
p.ped_numero,
p.ped_data,
c.cli_nome
FROM PEDIDO p
LEFT JOIN cliente c
ON p.cli_codigo = c.cli_codigo;

--        16         --
SELECT 
p.ped_numero,
c.cli_codigo,
c.cli_nome
FROM pedido p
LEFT JOIN cliente c
ON p.cli_codigo = c.cli_codigo
WHERE p.cli_codigo = 2;

--        17         --
SELECT 
prod_descricao, 
MAX(pro_valor_unidade) 
FROM produto
GROUP BY (prod_descricao);

--        18         --
SELECT ped_numero, SUM(item_quantidade) AS total_quantidade
FROM item_pedido
WHERE item_quantidade > 5
GROUP BY ped_numero;

--        19         --
SELECT 
p.ped_numero,
p.cli_codigo,
c.cli_estado,
p.ped_prazo_entrega
FROM pedido p
LEFT JOIN cliente c
ON c.cli_codigo = p.cli_codigo
WHERE p.ped_prazo_entrega > 15
AND c.cli_estado = "RJ" OR c.cli_estado = "SP";

--        20         --
-- 1- Quais clientes realizaram pedidos?--
SELECT c.cli_nome, p.ped_numero
FROM cliente c
INNER JOIN pedido p
ON c.cli_codigo = p.cli_codigo;

-- 2- Quais clientes, incluindo os que não fizeram pedidos, e os números de seus pedidos, se houver? --
SELECT c.cli_nome, p.ped_numero
FROM cliente c
LEFT JOIN pedido p
ON c.cli_codigo = p.cli_codigo;

-- 3- Quais pedidos foram feitos, e o nome dos clientes que realizaram esses pedidos, incluindo os pedidos que não têm clientes associados? --
SELECT c.cli_nome, p.ped_numero
FROM cliente c
RIGHT JOIN pedido p
ON c.cli_codigo = p.cli_codigo;

-- 4- Quais clientes e pedidos existem, incluindo todos os clientes que não têm pedidos e todos os pedidos que não têm clientes associados? --
SELECT c.cli_nome, p.ped_numero
FROM cliente c
LEFT JOIN pedido p
ON c.cli_codigo = p.cli_codigo

UNION

SELECT c.cli_nome, p.ped_numero
FROM cliente c
RIGHT JOIN pedido p
ON c.cli_codigo = p.cli_codigo;

-- 5- Quais clientes não realizaram nenhum pedido? -- 
SELECT c.cli_nome
FROM cliente c
LEFT JOIN pedido p
ON c.cli_codigo = p.cli_codigo
WHERE p.ped_numero IS NULL;

-- 6- Quais pedidos não estão associados a nenhum cliente? --
SELECT p.ped_numero
FROM cliente c
RIGHT JOIN pedido p
ON c.cli_codigo = p.cli_codigo
WHERE c.cli_codigo IS NULL;

-- 7- Quantos clientes existem em cada estado? --
SELECT c.cli_estado, COUNT(c.cli_codigo) AS total_clientes
FROM cliente c
GROUP BY c.cli_estado
HAVING COUNT(c.cli_codigo) > 1;
