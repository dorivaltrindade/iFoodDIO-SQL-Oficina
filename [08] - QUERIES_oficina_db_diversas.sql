use oficina_db;

-- [01] Quantos veículos foram conduzidos para atendimento na oficina agrupados por data de entrada?

		-- (a) Independentemente da aprovação do orçamento:
				select Orcamento.DataInicio as 'Data de Entrada', count(*) as 'Nº de Veículos'
				from Orcamento 
				join Veiculo on Veiculo.idVeiculo = Orcamento.idVeiculo_fk
				group by Orcamento.DataInicio order by Orcamento.DataInicio;
        
        -- (b) Cujo orçamento foi aprovado:
				select Orcamento.DataInicio as 'Data de Entrada', count(*) as 'Nº de Veículos'
				from Orcamento 
				join Veiculo on Veiculo.idVeiculo = Orcamento.idVeiculo_fk
				where Orcamento.Aprova = 'S'
				group by Orcamento.DataInicio order by Orcamento.DataInicio;
        
        -- (c) Cujo orçamento foi reprovado:
				select Orcamento.DataInicio as 'Data de Entrada', count(*) as 'Nº de Veículos'
				from Orcamento 
				join Veiculo on Veiculo.idVeiculo = Orcamento.idVeiculo_fk
				where Orcamento.Aprova = 'N'
				group by Orcamento.DataInicio order by Orcamento.DataInicio;
        
        -- (d) Cujo orçamento está em aberto (sem resposta) - Recepcionista, favor contatar o responsável:
				select 	Veiculo.NomeResponsavel 'Pessoa responsável:',
						Veiculo.TelefoneResponsavel  as 'Telefone de Contato:',
                        Veiculo.ModeloVeiculo as 'Carro:',
                        Orcamento.DataInicio as 'Compareceu em:',
                        Orcamento.Descricao as 'Serviço(s):',
                        concat('R$ ',format( Orcamento.Valor,2)) as 'Valor do Orçamento'
				from Orcamento 
				join Veiculo on Veiculo.idVeiculo = Orcamento.idVeiculo_fk
				where Orcamento.Aprova is null;
        
-- [02] Quantos orçamentos foram aprovados?
		select count(*) as 'Número de Orçamentos aprovados:'
        from Orcamento
        where Orcamento.Aprova = 'S';


-- [03] Qual é o faturamento da oficina?
		-- (a) Indiferente, GLOBAL, independentemente da aprovação do orçamento:
        select sum(Valor) from Orcamento;
        
        -- (b) Realizado, REAL, conforme os orçamentos aprovados:
        select sum(Valor) from Orcamento
        where Aprova='S';
        
        -- (c) PEDIDO, pela falta de aprovação:
        select sum(Valor) from Orcamento
        where Aprova='N';
        
		-- (d) Possível, RECUPERAR, após contato com o responsável:
        select sum(Valor) from Orcamento
        where Aprova is null;
        
        -- (e) Demonstração das quatro situações simultaneamente:
        select 
			concat('R$ ',format(sum(case
				when Orcamento.Aprova = 'S' then Orcamento.Valor
				else 0
			end),2)) as 'REAL (aprovados):',
            
			concat('R$ ',format(sum(case
				when Orcamento.Aprova = 'N' then Orcamento.Valor
				else 0
			end),2)) as 'PERDIDO (reprovados):',
            
			concat('R$ ',format(sum(case
				when Orcamento.Aprova is null then Orcamento.Valor
				else 0
			end),2)) as 'RECUPERAR (s/resposta):',
            
			concat('R$ ',format(sum(Orcamento.Valor),2)) as 'GLOBAL (somatório):'
		from Orcamento;
        
        -- (f) Demonstração das quatro situações com a indicação dos respectivos percentuais:
        
				select 
					concat('R$ ', format(sum(Orcamento.Valor), 2)) as 'GLOBAL: (100%)',
					concat('R$ ', format(sum(case when Orcamento.Aprova = 'S' then Orcamento.Valor else 0 end), 2)) as 'REAL:',
					concat(format((sum(case when Orcamento.Aprova = 'S' then Orcamento.Valor else 0 end) / sum(Orcamento.Valor)) * 100, 2), ' %') as 'Real(%)',
					concat('R$ ', format(sum(case when Orcamento.Aprova = 'N' then Orcamento.Valor else 0 end), 2)) as 'PERDIDO:',
					concat(format((sum(case when Orcamento.Aprova = 'N' then Orcamento.Valor else 0 end) / sum(Orcamento.Valor)) * 100, 2), ' %') as 'Perdido(%)',
					concat('R$ ', format(sum(case when Orcamento.Aprova is null then Orcamento.Valor else 0 end), 2)) as 'RECUPERAR:',
					concat(format((sum(case when Orcamento.Aprova is null then Orcamento.Valor else 0 end) / sum(Orcamento.Valor)) * 100, 2), ' %') as 'Recupear(%)'
				from Orcamento;

-- [04] Quantos veículos por marca foram conduzidos para orçamento na oficina?
		select MarcaVeiculo, count(*) from Veiculo
        group by MarcaVeiculo;

-- [05] Relação de atividades por veículo (Veiculo + Orcamento + OrdemServico + Servico + Peca + Produto).
		select
			Veiculo.PlacaVeiculo as 'Placa do Veículo',
            Veiculo.ModeloVeiculo as 'Carro',
			Orcamento.Descricao as 'Motivo do Orçamento',
			Servico.HorasServico as 'Duração do Serviço (h)',
			Servico.DescricaoServico as 'Descrição do Serviço',
 			Peca.NomePeca as 'Descriçao das Peças',
            Produto.NomeProduto as 'Produto utilizado',
            concat('R$ ',format(Servico.CustoServico,2)) as 'Custo da Mão-de-obra',
            concat('R$ ',format(Peca.CustoPeca,2)) as 'Custo das Peças',
            concat('R$ ',format(Produto.CustoProduto,2)) as 'Custo do Produto',
            concat('R$ ',format(OrdemServico.Custo,2)) as 'Custo da OS',
            concat('R$ ',format(Orcamento.Valor,2)) as 'Custo do Orçamento'
        from OrdemServico
			left join Servico on Servico.idServico = OrdemServico.idServico_fk
			left join Peca on Peca.idPeca = OrdemServico.idPeca_fk
			left join Produto on Produto.idProduto = OrdemServico.idProduto_fk
			join Orcamento on OrdemServico.idOrcamento_fk = Orcamento.idOrcamento
			join Veiculo on Orcamento.idVeiculo_fk = Veiculo.idVeiculo
			order by Veiculo.PlacaVeiculo;

-- [06] Qual é o orçamento com o maior número de tipos de peças?
		select 	Orcamento.idOrcamento as 'Nº do Orçamento', 
				Orcamento.descricao as 'Motivo', 
                count(Peca.idPeca) as 'Nº de Tipos de Peças'
        from Orcamento
			left join OrdemServico on OrdemServico.idOrcamento_fk = Orcamento.idOrcamento
			left join Peca on OrdemServico.idPeca_fk = Peca.idPeca
			group by Orcamento.IdOrcamento, Orcamento.Descricao
			order by count(Peca.idPeca) desc
        limit 1;

-- [07] Qual é o orçamento com o maior número de serviços?
		select 	Orcamento.idOrcamento as 'Nº do Orçamento',
				Orcamento.descricao as 'Motivo',
                count(Servico.idServico) as 'Nº de Serviços'
        from Orcamento
				left join OrdemServico on OrdemServico.idOrcamento_fk = Orcamento.idOrcamento
				left join Servico on OrdemServico.idServico_fk = Servico.idServico
				group by Orcamento.IdOrcamento, Orcamento.Descricao
				order by count(Servico.idServico) desc
        limit 1;

-- [08] Relação do número de produtos por orçamento?
		select 	Orcamento.idOrcamento as 'Nº do Orçamento',
				Orcamento.descricao as 'Motivo',
                count(Produto.idProduto) as 'Nº de Produtos'
        from Orcamento
				left join OrdemServico on OrdemServico.idOrcamento_fk = Orcamento.idOrcamento
				left join Produto on OrdemServico.idProduto_fk = Produto.idProduto
				group by Orcamento.IdOrcamento, Orcamento.Descricao
				order by count(Produto.idProduto) desc;

-- [09] Qual funcionário está mais envolvido com a execução das ordem de serviços?
		select Funcionario.idFuncionario as 'Nº do Funcionário', Funcionario.NomeFuncionario as 'Nome do Funcionário', Funcionario.FuncaoFuncionario as 'Função', count(OrdemServico.idResponsavelOS_fk) as 'Nº de OS'
        from Funcionario
        left join OrdemServico on OrdemServico.idResponsavelOS_fk = Funcionario.idFuncionario
		group by Funcionario.idFuncionario, Funcionario.NomeFuncionario
        order by count(OrdemServico.idResponsavelOS_fk) desc
        limit 1;

-- [10] Qual é média de quilometragem rodada por ano para cada veículo?
		select 
			PlacaVeiculo as'PLACA',
            MarcaVeiculo as 'MARCA',
            ModeloVeiculo as 'MODELO',
            AnoVeiculo as 'Ano de Fabricação',
			format(QuilometragemVeiculo / (year(now()) - AnoVeiculo + 1),1) as 'Quilometragem por Ano'
		from Veiculo;
		
-- [11] Recuperações simples com SELECT statement:

		select * from Funcionario;
		select * from Servico;
		select * from Peca;
		select * from Produto;
		select * from Veiculo;
		select * from Orcamento;
		select * from OrdemServico;