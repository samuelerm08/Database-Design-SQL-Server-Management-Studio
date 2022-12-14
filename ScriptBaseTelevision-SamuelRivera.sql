USE [Television]
GO
/****** Object:  Table [dbo].[Canales]    Script Date: 13/7/2022 20:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canales](
	[CanalID] [int] IDENTITY(1,1) NOT NULL,
	[Canal] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Canales] PRIMARY KEY CLUSTERED 
(
	[CanalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Categorias] UNIQUE NONCLUSTERED 
(
	[Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dias]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias](
	[DiaID] [int] IDENTITY(1,1) NOT NULL,
	[Dia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dias] PRIMARY KEY CLUSTERED 
(
	[DiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grilla]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grilla](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NULL,
	[Estado] [varchar](50) NOT NULL,
	[ProgramaID] [int] NOT NULL,
	[CanalID] [int] NOT NULL,
	[DiaID] [int] NOT NULL,
	[HorarioID] [int] NOT NULL,
 CONSTRAINT [PK_Grilla] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horarios]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horarios](
	[HorarioID] [int] IDENTITY(1,1) NOT NULL,
	[Horario] [int] NOT NULL,
 CONSTRAINT [PK_Horarios] PRIMARY KEY CLUSTERED 
(
	[HorarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programas]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programas](
	[ProgramaID] [int] IDENTITY(1,1) NOT NULL,
	[Programa] [varchar](50) NOT NULL,
	[CategoriaID] [int] NOT NULL,
 CONSTRAINT [PK_Programas] PRIMARY KEY CLUSTERED 
(
	[ProgramaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Programas] UNIQUE NONCLUSTERED 
(
	[Programa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Grilla]  WITH CHECK ADD  CONSTRAINT [FK_Grilla_Canales] FOREIGN KEY([CanalID])
REFERENCES [dbo].[Canales] ([CanalID])
GO
ALTER TABLE [dbo].[Grilla] CHECK CONSTRAINT [FK_Grilla_Canales]
GO
ALTER TABLE [dbo].[Grilla]  WITH CHECK ADD  CONSTRAINT [FK_Grilla_Dias] FOREIGN KEY([DiaID])
REFERENCES [dbo].[Dias] ([DiaID])
GO
ALTER TABLE [dbo].[Grilla] CHECK CONSTRAINT [FK_Grilla_Dias]
GO
ALTER TABLE [dbo].[Grilla]  WITH CHECK ADD  CONSTRAINT [FK_Grilla_Horarios] FOREIGN KEY([HorarioID])
REFERENCES [dbo].[Horarios] ([HorarioID])
GO
ALTER TABLE [dbo].[Grilla] CHECK CONSTRAINT [FK_Grilla_Horarios]
GO
ALTER TABLE [dbo].[Grilla]  WITH CHECK ADD  CONSTRAINT [FK_Grilla_Programas] FOREIGN KEY([ProgramaID])
REFERENCES [dbo].[Programas] ([ProgramaID])
GO
ALTER TABLE [dbo].[Grilla] CHECK CONSTRAINT [FK_Grilla_Programas]
GO
ALTER TABLE [dbo].[Programas]  WITH CHECK ADD  CONSTRAINT [FK_Programas_Categorias] FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[Categorias] ([CategoriaID])
GO
ALTER TABLE [dbo].[Programas] CHECK CONSTRAINT [FK_Programas_Categorias]
GO
/****** Object:  StoredProcedure [dbo].[alta_grilla]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[alta_grilla] 
 @fechainicio date
,@fechafin date
,@estado varchar(50)
,@programa varchar(50)
,@categoria varchar(50)
,@canal varchar(50)
,@dia varchar(50)
,@horario int

as

declare @ret int=0
declare @programaid int, @canalid int, @horarioid int, @diaid int

exec @programaid = [dbo].[upd_programa] @programa,@categoria
exec @canalid = [dbo].[upd_canales] @canal
exec @horarioid = [dbo].[upd_horarios] @horario
exec @diaid = [dbo].[upd_dias] @dia

select @ret=ID 
from Grilla gr
join Horarios hr on hr.HorarioID = gr.HorarioID
join Canales cn on cn.CanalID = gr.CanalID
join Dias di on di.DiaID = gr.DiaID
where hr.Horario=@horario and cn.Canal=@canal and di.Dia=@dia

if @ret=0 
	begin
		insert into Grilla (FechaInicio, FechaFin, Estado, ProgramaID, CanalID, HorarioID, DiaID)
			values (@fechainicio,@fechafin,@estado,@programaid,@canalid,@horarioid,@diaid)
		set @ret=@@IDENTITY
	end
else 
	update gr
	set  ProgramaID=@programaid
	from Grilla gr
	where @ret=ID and (HorarioID<>@horarioid or
		CanalID<>@canalid or
		DiaID<>@diaid)

return @ret


	
GO
/****** Object:  StoredProcedure [dbo].[hrs_disponibles]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE proc [dbo].[hrs_disponibles]
	
	@fechainicio date=null, @canal varchar(50)=null

	as
	
	select hr.Horario, coalesce(pr.Programa, 'Disponible')[Programas]
	from Horarios hr
	left join Grilla gr on (@fechainicio is null or gr.FechaInicio=@fechainicio) and gr.HorarioID = hr.HorarioID
	left join Canales ca on (@canal is null or ca.Canal=@canal) and ca.CanalID= gr.CanalID
	left join Programas pr on pr.ProgramaID = gr.ProgramaID
	
	
	
	
	
	


GO
/****** Object:  StoredProcedure [dbo].[upd_canales]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[upd_canales]
@canal varchar(50)
as
declare @ret int = 0

select @ret=CanalID from Canales cn where cn.Canal=@canal
if	@ret = 0
	begin
		insert into Canales(Canal) values (@canal)
		set @ret=@@IDENTITY
	end
return @ret
GO
/****** Object:  StoredProcedure [dbo].[upd_categorias]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[upd_categorias]
@categoria varchar(50)
as
declare @ret int = 0
if @categoria is null
set @categoria = 'N/A'

select @ret=CategoriaID from Categorias cat where cat.Categoria=@categoria

if	@ret = 0
	begin
		insert into Categorias (Categoria) values (@categoria)
		set @ret=@@IDENTITY
	end
return @ret
GO
/****** Object:  StoredProcedure [dbo].[upd_dias]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[upd_dias]
@dia varchar(50)
as
declare @ret int = 0

select @ret=DiaID from Dias di where di.Dia=@dia
if	@ret = 0
	begin
		insert into Dias (Dia) values (@dia)
		set @ret=@@IDENTITY
	end
return @ret
GO
/****** Object:  StoredProcedure [dbo].[upd_horarios]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[upd_horarios]
@horario int
as
declare @ret int = 0

select @ret=HorarioID from Horarios hr where hr.Horario=@horario
if	@ret = 0
	begin
		insert into Horarios(Horario) values (@horario)
		set @ret=@@IDENTITY
	end
return @ret
GO
/****** Object:  StoredProcedure [dbo].[upd_programa]    Script Date: 13/7/2022 20:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[upd_programa]
@programa varchar(50),@categoria varchar(50)
as
if @programa is null
set @programa = 'Diversion sin Fin'
declare @ret int = 0
declare @categoriaid int
exec @categoriaid = [dbo].[upd_categorias] @categoria

select @ret=ProgramaID from Programas pr where pr.Programa=@programa

if	@ret = 0
	begin
		insert into Programas (Programa, CategoriaID) values (@programa, @categoriaid)
		set @ret=@@IDENTITY
	end
return @ret
GO
