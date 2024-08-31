-- 1. Quantos chamados foram abertos no dia 01/04/2023?
SELECT COUNT(*) AS total_chamados
FROM `datario.adm_central_atendimento_1746.chamado`
WHERE DATE(data_inicio) = '2023-04-01';

#total_chamados == 1756

-- 2. Qual o tipo de chamado que teve mais chamados abertos no dia 01/04/2023?
SELECT tipo, COUNT(*) AS total_chamados
FROM `datario.adm_central_atendimento_1746.chamado`
WHERE DATE(data_inicio) = '2023-04-01'
GROUP BY tipo
ORDER BY total_chamados DESC
LIMIT 1;

#tipo == Estacionamento irregular
#total_chamados == 366


-- 3. Quais os nomes dos 3 bairros que mais tiveram chamados abertos nesse dia?
SELECT b.nome, COUNT(*) AS total_chamados
FROM `datario.adm_central_atendimento_1746.chamado` c
JOIN `datario.dados_mestres.bairro` b
ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
GROUP BY b.nome
ORDER BY total_chamados DESC
LIMIT 3;

#nome == {Campo Grande, Tijuca, Barra da Tijuca}
#total_chamados == {113, 89, 59}

-- 4. Qual o nome da subprefeitura com mais chamados abertos nesse dia?
SELECT b.subprefeitura, COUNT(*) AS total_chamados
FROM `datario.adm_central_atendimento_1746.chamado` c
JOIN `datario.dados_mestres.bairro` b
ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
GROUP BY b.subprefeitura
ORDER BY total_chamados DESC
LIMIT 1;
#Zona Norte 510

-- 5. Existe algum chamado aberto nesse dia que não foi associado a um bairro ou subprefeitura na tabela de bairros? Se sim, por que isso acontece?
SELECT COUNT(*) AS total_chamados
FROM `datario.adm_central_atendimento_1746.chamado` c
LEFT JOIN `datario.dados_mestres.bairro` b
ON c.id_bairro = b.id_bairro
WHERE DATE(c.data_inicio) = '2023-04-01'
AND b.id_bairro IS NULL;

#Sim, existem 73 chamadas. Pode ser que o chamado não esteja associado a um bairro devido a dados faltantes,
#erro na inserção dos dados ou um código de bairro que não foi mapeado corretamente.

-- 6. Quantos chamados com o subtipo "Perturbação do sossego" foram abertos desde 01/01/2022 até 31/12/2023?
SELECT COUNT(*) AS total_chamados
FROM `datario.adm_central_atendimento_1746.chamado`
WHERE subtipo = 'Perturbação do sossego'
AND DATE(data_inicio) BETWEEN '2022-01-01' AND '2023-12-31';

#42830

-- 7. Selecione os chamados com esse subtipo que foram abertos durante os eventos contidos na tabela de eventos (Reveillon, Carnaval e Rock in Rio).
SELECT c.*
FROM `datario.adm_central_atendimento_1746.chamado` c
JOIN `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` e
ON DATE(c.data_inicio) BETWEEN e.data_inicial AND e.data_final
WHERE c.subtipo = 'Perturbação do sossego';

#Foram selecionadas 2428

-- 8. Quantos chamados desse subtipo foram abertos em cada evento?
SELECT e.evento, COUNT(*) AS total_chamados
FROM `datario.adm_central_atendimento_1746.chamado` c
JOIN `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` e
ON DATE(c.data_inicio) BETWEEN e.data_inicial AND e.data_final
WHERE c.subtipo = 'Perturbação do sossego'
GROUP BY e.evento;
	
#Carnaval 482	
#Rock in Rio 1668	
#Reveillon 278 

-- 9. Qual evento teve a maior média diária de chamados abertos desse subtipo?
SELECT e.evento, COUNT(*) / COUNT(DISTINCT DATE(c.data_inicio)) AS media_diaria_chamados
FROM `datario.adm_central_atendimento_1746.chamado` c
JOIN `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` e
ON DATE(c.data_inicio) BETWEEN e.data_inicial AND e.data_final
WHERE c.subtipo = 'Perturbação do sossego'
GROUP BY e.evento
ORDER BY media_diaria_chamados DESC
LIMIT 1;

#Rock in Rio 238.28571428571

-- 10. Compare as médias diárias de chamados abertos desse subtipo durante os eventos específicos (Reveillon, Carnaval e Rock in Rio) e a média diária de chamados abertos desse subtipo considerando todo o período de 01/01/2022 até 31/12/2023.

-- Média diária durante os eventos específicos
SELECT e.evento, COUNT(*) / COUNT(DISTINCT DATE(c.data_inicio)) AS media_diaria_evento
FROM `datario.adm_central_atendimento_1746.chamado` c
JOIN `datario.turismo_fluxo_visitantes.rede_hoteleira_ocupacao_eventos` e
ON DATE(c.data_inicio) BETWEEN e.data_inicial AND e.data_final
WHERE c.subtipo = 'Perturbação do sossego'
GROUP BY e.evento;



#Rock in Rio 238.28571428571428	
#Carnaval 120.5	
#Reveillon 92.66666666666667

-- Média diária geral
SELECT COUNT(*) / COUNT(DISTINCT DATE(data_inicio)) AS media_diaria_geral
FROM `datario.adm_central_atendimento_1746.chamado`
WHERE subtipo = 'Perturbação do sossego'
AND DATE(data_inicio) BETWEEN '2022-01-01' AND '2023-12-31';

#61.982633863965269