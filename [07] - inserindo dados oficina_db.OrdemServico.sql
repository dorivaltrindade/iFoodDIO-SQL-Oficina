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