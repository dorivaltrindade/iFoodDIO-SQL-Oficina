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