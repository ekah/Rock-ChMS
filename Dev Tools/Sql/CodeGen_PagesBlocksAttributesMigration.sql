set nocount on
declare
@crlf varchar(2) = char(13) + char(10)


begin

IF OBJECT_ID('tempdb..#codeTable') IS NOT NULL
    DROP TABLE #codeTable

create table #codeTable (
    Id int identity(1,1) not null,
    CodeText nvarchar(max),
    CONSTRAINT [pk_codeTable] PRIMARY KEY CLUSTERED  ( [Id]) );
    


-- pages
    insert into #codeTable
    SELECT '            AddPage("' +
        CONVERT( nvarchar(50), [parentPage].[Guid]) + '","'+ 
        [p].[Name]+  '","'+  
        ISNULL([p].[Description],'')+  '","'+
        ISNULL([p].[Layout],'')+  '","'+
        CONVERT( nvarchar(50), [p].[Guid])+  '","'+  
        ISNULL([p].[IconCssClass],'')+ '");'
    FROM 
      [Page] p
    join [Page] [parentPage] on [p].[ParentPageId] = [parentPage].[Id]
    where [p].[IsSystem] = 0
    order by [p].[Id]

    -- block types
    insert into #codeTable
    SELECT '            AddBlockType("'+
        [Name]+ '","'+  
        ISNULL([Description],'')+ '","'+  
        [Path]+ '","'+  
        CONVERT( nvarchar(50),[Guid])+ '");'
    from [BlockType]
    where [IsSystem] = 0
    order by [Id]

    -- blocks
    insert into #codeTable
    SELECT 
        '            AddBlock("'+
        CONVERT(nvarchar(50), [p].[Guid])+ '","'+ 
        CONVERT(nvarchar(50), [bt].[Guid])+ '","'+
        [b].[Name]+ '","'+
        ISNULL([b].[Layout],'')+ '","'+
        [b].[Zone]+ '",'+
        CONVERT(varchar, [b].[Order])+ ',"'+
        CONVERT(nvarchar(50), [b].[Guid])+ '");'+
        @crlf
    from [Block] [b]
    left outer join [Page] [p] on [p].[Id] = [b].[PageId]
    join [BlockType] [bt] on [bt].[Id] = [b].[BlockTypeId]
    where 
      [b].[IsSystem] = 0
    order by [b].[Id]

    -- attributes
    if object_id('tempdb..#attributeIds') is not null
    begin
      drop table #attributeIds
    end

    select * into #attributeIds from (select [Id] from [dbo].[Attribute] where [IsSystem] = 0) [newattribs]
    
    insert into #codeTable
    SELECT 
        '            // Attrib for BlockType: ' + bt.Name + ':'+ a.Name+
        @crlf +
        '            AddBlockTypeAttribute("'+ 
        CONVERT(nvarchar(50), bt.Guid)+ '","'+   
        CONVERT(nvarchar(50), ft.Guid)+ '","'+     
        a.Name+ '","'+  
        a.[Key]+ '","'+ 
        ''+ '","'+ 
        --ISNULL(a.Category,'')+ '","'+ 
        ISNULL(a.Description,'')+ '",'+ 
        CONVERT(varchar, a.[Order])+ ',"'+ 
        ISNULL(a.DefaultValue,'')+ '","'+
        CONVERT(nvarchar(50), a.Guid)+ '");' +
        @crlf
    from [Attribute] [a]
    left outer join [FieldType] [ft] on [ft].[Id] = [a].[FieldTypeId]
    left outer join [BlockType] [bt] on [bt].[Id] = cast([a].[EntityTypeQualifierValue] as int)
    where EntityTypeQualifierColumn = 'BlockTypeId'
    and [a].[id] in (select [Id] from #attributeIds)

    -- attributes values    
    insert into #codeTable
    SELECT 
        '            // Attrib Value for '+ b.Name+ ':'+ a.Name+
        @crlf +
        '            AddBlockAttributeValue("'+     
        CONVERT(nvarchar(50), b.Guid)+ '","'+ 
        CONVERT(nvarchar(50), a.Guid)+ '","'+ 
        ISNULL(av.Value,'')+ '");'+
        @crlf
    from [AttributeValue] [av]
    join Block b on b.Id = av.EntityId
    join Attribute a on a.id = av.AttributeId
    where ([av].[AttributeId] in (select [Id] from #attributeIds))
    or (b.IsSystem = 0)

    drop table #attributeIds

	-- Field Types
	insert into #codeTable
	SELECT
        '            UpdateFieldType("'+    
        ft.Name+ '","'+ 
        ISNULL(ft.Description,'')+ '","'+ 
        ft.Assembly+ '","'+ 
        ft.Class+ '","'+ 
        CONVERT(nvarchar(50), ft.Guid)+ '");'+
        @crlf
    from [FieldType] [ft]
    where (ft.IsSystem = 0)

    select CodeText [MigrationUp] from #codeTable order by Id
    delete from #codeTable

    -- generate MigrationDown

    insert into #codeTable SELECT '// Attrib for BlockType: ' + bt.Name + ':'+ a.Name + @crlf + 'DeleteAttribute("'+ CONVERT(nvarchar(50), [A].[Guid])+ '");' 
       from [Attribute] [A]
       left outer join [BlockType] [bt] on [bt].[Id] = cast([a].[EntityTypeQualifierValue] as int)
       where [A].[IsSystem] = 0 and [A].[EntityTypeQualifierColumn] = 'BlockTypeId' 
       order by [A].[Id] desc   
    


    insert into #codeTable SELECT '            DeleteBlock("'+ CONVERT(nvarchar(50), [Guid])+ '"); // '+ [Name] from [Block] where [IsSystem] = 0 order by [Id] desc
    insert into #codeTable SELECT '            DeleteBlockType("'+ CONVERT(nvarchar(50), [Guid])+ '"); // '+ [Name] from [BlockType] where [IsSystem] = 0 order by [Id] desc
    insert into #codeTable SELECT '            DeletePage("'+ CONVERT(nvarchar(50), [Guid])+ '"); // '+ [Name]  from [Page] where [IsSystem] = 0 order by [Id] desc 

    select CodeText [MigrationDown] from #codeTable order by Id

IF OBJECT_ID('tempdb..#codeTable') IS NOT NULL
    DROP TABLE #codeTable

end


