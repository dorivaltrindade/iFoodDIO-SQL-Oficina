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