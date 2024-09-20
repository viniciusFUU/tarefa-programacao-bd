use venda;
-- Exercícios --x
--      1     --
SELECT 
	* 
FROM cliente
ORDER BY cli_nome;

--      2     --
SELECT 
cli_codigo,
cli_nome,
cli_estado
FROM cliente
WHERE cli_estado = 'SP' 
AND 
cli_nome LIKE 'B%' 
OR cli_nome LIKE 'F%';

--      3     --
SELECT 
p.ped_numero,
c.cli_nome
FROM pedido p
LEFT JOIN cliente c
ON p.cli_codigo = c.cli_codigo
WHERE ped_numero = 1;

 --      4     --
SELECT 
p.ped_numero,
c.cli_nome,
v.ven_nome
FROM pedido p
LEFT JOIN cliente c
ON p.cli_codigo = c.cli_codigo
LEFT JOIN vendedor v
ON p.ven_codigo = v.ven_codigo
WHERE ped_numero = 2;

--      5     --
SELECT COUNT(*) FROM pedido;

--      6     --
SELECT 
ven_codigo AS id_vendedor,
COUNT(ped_numero) AS qtd_vendas
FROM pedido
GROUP BY (ven_codigo);

--      7     --
SELECT 
ip.ped_numero,
p.prod_descricao
FROM item_pedido ip
LEFT JOIN produto p
ON ip.pro_codigo = p.pro_codigo
WHERE ped_numero = 1;

--      8     --
SELECT 
p.pro_codigo AS id_produto,
p.prod_descricao AS nome_produto,
ip.item_quantidade AS qtd_pedido,
p.pro_valor_unidade AS preco_produto,
p.pro_valor_unidade * item_quantidade AS valor_total
FROM item_pedido ip
LEFT JOIN produto p
ON ip.pro_codigo = p.pro_codigo
WHERE PED_NUMERO = 1;

--      9     --
SELECT 
t.tel_codigo,
c.cli_nome,
t.tel_numero
FROM cliente c
LEFT JOIN telefone t
ON c.cli_codigo = t.cli_codigo
WHERE tel_numero IS NOT NULL;

--      10     --
SELECT 
t.tel_codigo,
c.cli_nome,
t.tel_numero
FROM cliente c
LEFT JOIN telefone t
ON c.cli_codigo = t.cli_codigo;

--      11     --
SELECT 
prod_descricao,
pro_quantidade
FROM produto;

--      12     --
SELECT * FROM pedido
WHERE ped_data = '2010-10-01';

--      13     --
SELECT * FROM pedido
WHERE ped_data = '2010-10-01' AND
ped_prazo_entrega > 3;

--      14     --
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
