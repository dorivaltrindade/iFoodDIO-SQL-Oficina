use oficina_db;

-- [01] inserindo dados para tabela Funcionario
		insert into Funcionario (NomeFuncionario, 		FuncaoFuncionario )
						values	('João Macedo',			'Gerente'),
								('Ailton Souza',		'Mecanico'),
                                ('Fausto Fragoso',		'Pintor'),
                                ('Pedro Pacheco',		'Funileiro'),
                                ('Roberto Nobre',		'Mecanico'),
                                ('Antonio Candido',		'Eletricista'),
                                ('José Fernandes',		'Auxiliar'),
                                ('Francisco Macedo',	'Auxiliar'),
                                ('Regina Macedo',		'Recepcionista'),
                                ('Joaquim Nobre',		'Auxiliar'),
                                ('Renato Souza',		'Supervisor');
                                
		select * from Funcionario;
        
-- [02] inserindo dados para tabela Servico 
		insert into Servico	(DescricaoServico, 					CustoServico, 	HorasServico, 	CategoriaServico)
					values	('Troca da correia dentada', 		850, 			3,				'Mecanica'),
							('Troca de óleo do motor',			120,			1,				'Mecanica'),
                            ('Troca da Embreagem', 				250, 			2,				'Mecanica'),
                            ('Troca de pneus',					50,				1,				'Rodas'),
                            ('Balanceamento',					50,				1,				'Rodas'),
                            ('Alinhamento',						120,			1,				'Rodas'),
                            ('Pintura',							2800,			30,				'Funilaria'),
                            ('Troca de bateria',				40,				1,				'Eletrica'),
                            ('Troca de freios',					160,			1,				'Freios'),
                            ('Troca de amortecedores',			250,			3,				'Suspensao'),
                            ('Instalação de Alarem',			100,			2,				'Eletrica'),
                            ('Troca de farois e lanternas',		120,			1,				'Eletrica'),
                            ('Regulagem do cambio automatico',	800,			2,				'Mecanica'),
                            ('Polimento',						250,			2,				'Funilaria'),
                            ('Manutencao do ar condicionado',	200,			1,				'Mecanica');
                            
        select * from Servico;

-- [03] inserindo dados para tabela Peca
		insert into Peca 	(NomePeca, 							CustoPeca)
				values		('Correia Dentada',					120),
							('Rolamento correia dentada',		80),
							('Arruela de vedacao do carter', 	10),
							('Kit de embreagem',				400),
							('Pneu',							320),
							('Tinta de fundo preparador',		120),
							('Tinta de acabamento',				250),
							('Amortecedor',						140),
							('Kit de alarme positronico',		360),
							('Farol', 							800),
							('Lanterna dianteira',				220),
							('Lanterna trazeira',				310),
							('Correia de ar condicionado',		75),
                            ('Bateria',							590);
                
		select * from Peca;
        
-- [04] inserindo dados para tabela Produto
		insert into Produto	(NomeProduto, 				CustoProduto)
					values	('Desengripante (spray)',	25),
							('Oleo de motor',			45),
							('Graxa branca',			85),
							('Graxa preta',				65),
							('Lixa 5000',				20),
							('Lixa 2000',				15),
							('Lixa 500',				10),
							('Pasta polidora',			80),
							('Anti-corrosivo',			50),
							('Vaselina pastosa',		25),
							('Oleo de freio',			25),
							('Oleo de cambio',			80),
							('Gas de arcondicionado',	200),
							('Kit de juntas', 			60),
							('Kit de retentores',		90);
        
		select * from Produto;

-- [05] inserindo dados para tabela Veiculo
		insert into Veiculo (	PlacaVeiculo, 	MarcaVeiculo, 	ModeloVeiculo, 	AnoVeiculo, 	MotorizacaoVeiculo, 	CorVeiculo, 	QuilometragemVeiculo, 	NomeResponsavel, 	TelefoneResponsavel)
					values	(	'JED8146', 		'Toyota', 		'Corola', 		'2020',			'1.6 FLEX',				'prata',		28467,					'Paulo Fernandes',	'11972587452'),
							(	'SLO6402', 		'Nissan', 		'Tida', 		'2015',			'1.4 GAS',				'branco',		220670,					'Justino Barbosa',	'11962587431'),
							(	'LXF0267', 		'Renault', 		'Logan', 		'2011',			'1.6 FLEX',				'preto',		310000,					'Carlos Andrade',	'12952587442'),
							(	'CVN4608', 		'Hyundai', 		'HB20', 		'2017',			'1.3 FLEX',				'vermelho',		90370,					'Hélio Nunes',		'13942585553'),
							(	'BNX3079', 		'Chevrolet', 	'Chevette', 	'1978',			'1.4 GAS',				'verde',		430710,					'Benedito Silva',	'13932566454'),
							(	'LWO4031', 		'Volkswagen',	'Gol',	 		'1992',			'1.8 GAS',				'azul',			303570,					'Hélio Abrantes',	'12938277455');                                

		select * from Veiculo;
        
-- [06] inserindo dados para tabela Orcamento
		insert into Orcamento 	(	idResponsavel_fk, 	idVeiculo_fk, 	Descricao, 										DataInicio)
					values 		(	11,					1,				'Instalar pneus novos',							'2023-08-10'),
								(	11,					2,				'Instalar farois novos',						'2023-08-11'),
								(	11,					3,				'Trocar oleo do motor',							'2023-08-11'),
								(	11,					4,				'Corrigir falhas do cambio automatico',			'2023-08-12'),
								(	11,					5,				'Substituir a embreagem',						'2023-08-13'),
								(	11,					6,				'Substituir a bateria',							'2023-08-14'),
								(	11,					1,				'Polimento geral da pintura',					'2023-08-15'),
								(	11,					5,				'Instalacao do sistema de alarme anti-furto',	'2023-08-16'),
								(	11,					6,				'Substituicao dos amortecedores',				'2023-08-17');
                                
		select * from Orcamento;
        
-- [07] inserindo dados para tabela OrdemServico
		insert into OrdemServico (	idOrcamento_fk,	idResponsavelOS_fk,	idServico_fk,	idPeca_fk,	idProduto_fk,	Custo)
						values	(	1,				7,					4,				5,			NULL,			1480),
								(	1,				8,					5,				NULL,		NULL,			200),
                                (	1,				5,					6,				NULL,		NULL,			120),
                                
								(	2,				6,					12,				10,			NULL,			1600),
                                
                                (	3,				2,					2,				3,			2,				180),
                                
                                (	4,				2,					13,				NULL,		12,				960),
                                
                                (	5,				2,					3,				4,			1,				675),
                                
                                (	6,				6,					8,				14,			9,				680),
                                
                                (	7,				3,					14,				NULL,		8,				330),
                                
                                (	8,				6,					11,				9,			10,				485),
                                
                                (	9,				5,					10,				8,			4,				595);
                                
        select * from OrdemServico;

