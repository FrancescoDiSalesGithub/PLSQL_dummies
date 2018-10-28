declare

i integer;
j integer;
nodata exception;
cursor ctrl_bk is select * from studentebk;

begin

for i in(select * from studente) loop
 
open ctrl_bk;
dbms_output.put_line(ctrl_bk%rowcount);


if(ctrl_bk%rowcount=0)then
raise nodata;
else
for j in(select * from studentebk) loop
 if(i.matricola=j.matricola) then
  dbms_output.put_line('inserito nel ramo update');
  update studentebk set nome=i.nome,cognome=i.cognome where matricola=i.matricola;
  else
  dbms_output.put_line('inserito nel ramo insert');
  insert into studentebk values(i.matricola,i.nome,i.cognome);
  end if;

  end loop;
end if;

end loop;

close ctrl_bk;

exception when nodata then

dbms_output.put_line('inserito nel ramo nodata');
  for i in (select * from studente) loop
  insert into studentebk values(i.matricola,i.nome,i.cognome);
  end loop; 
 
  when others then
    dbms_output.put_line('eccezzione'); 


end;
