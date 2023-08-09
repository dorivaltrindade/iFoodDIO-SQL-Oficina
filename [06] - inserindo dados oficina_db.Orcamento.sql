-- [06] inserindo dados para tabela Orcamento
		insert into Orcamento 	(	idResponsavel_fk, 	idVeiculo_fk, 	Descricao, 										DataInicio,		Valor,	Aprova,	DataTermino,	FormaPagamento)
					values 		(	11,					1,				'Instalar pneus novos',							'2023-08-10',	1800,	'S',	'2023-08-10',	default),
								(	11,					2,				'Instalar farois novos',						'2023-08-11',	1600,	'N',	NULL,			NULL),
								(	11,					3,				'Trocar oleo do motor',							'2023-08-11',	180,	'S',	'2023-08-11',	'PIX'),
								(	11,					4,				'Corrigir falhas do cambio automatico',			'2023-08-12',	960,	'S',	'2023-08-13',	default),
								(	11,					5,				'Substituir a embreagem',						'2023-08-13',	675,	'S',	'2023-08-14',	default),
								(	11,					6,				'Substituir a bateria',							'2023-08-14',	680,	'S',	'2023-08-14',	default),
								(	11,					1,				'Polimento geral da pintura',					'2023-08-15',	330,	'S',	'2023-08-17',	default),
								(	11,					5,				'Instalacao do sistema de alarme anti-furto',	'2023-08-16',	485,	'S',	'2023-08-16',	default),
								(	11,					6,				'Substituicao dos amortecedores',				'2023-08-17',	595,	'N',	NULL,			NULL);
                                
		select * from Orcamento;