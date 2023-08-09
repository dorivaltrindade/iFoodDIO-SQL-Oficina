-- [05] inserindo dados para tabela Veiculo
		insert into Veiculo (	PlacaVeiculo, 	MarcaVeiculo, 	ModeloVeiculo, 	AnoVeiculo, 	MotorizacaoVeiculo, 	CorVeiculo, 	QuilometragemVeiculo, 	NomeResponsavel, 	TelefoneResponsavel)
					values	(	'JED8146', 		'Toyota', 		'Corola', 		'2020',			'1.6 FLEX',				'prata',		28467,					'Paulo Fernandes',	'11972587452'),
							(	'SLO6402', 		'Nissan', 		'Tida', 		'2015',			'1.4 GAS',				'branco',		220670,					'Justino Barbosa',	'11962587431'),
							(	'LXF0267', 		'Renault', 		'Logan', 		'2011',			'1.6 FLEX',				'preto',		310000,					'Carlos Andrade',	'12952587442'),
							(	'CVN4608', 		'Hyundai', 		'HB20', 		'2017',			'1.3 FLEX',				'vermelho',		90370,					'Hélio Nunes',		'13942585553'),
							(	'BNX3079', 		'Chevrolet', 	'Chevette', 	'1978',			'1.4 GAS',				'verde',		430710,					'Benedito Silva',	'13932566454'),
							(	'LWO4031', 		'Volkswagen',	'Gol',	 		'1992',			'1.8 GAS',				'azul',			303570,					'Hélio Abrantes',	'12938277455');                                

		select * from Veiculo;