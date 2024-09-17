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
