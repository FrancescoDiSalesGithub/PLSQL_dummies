declare

i integer;
m integer;
j integer;

nodata exception;
update_data exception;

begin

for m in(select count(matricola) as numero from studentebk) loop

if(m.numero=0)then
 raise nodata;
else
 raise update_data;
end if;

end loop;
 

exception 

when nodata then

dbms_output.put_line('inserito nel ramo nodata');
  for i in (select * from studente) loop
  insert into studentebk values(i.matricola,i.nome,i.cognome);
  end loop; 

when update_data then

for i in(select * from studente) loop
for j in(select * from studentebk) loop
 if(i.matricola=j.matricola) then
  dbms_output.put_line('inserito nel ramo update');
  update studentebk set nome=i.nome,cognome=i.cognome where matricola=i.matricola;
  else
  dbms_output.put_line('inserito nel ramo insert');
  insert into studentebk values(i.matricola,i.nome,i.cognome);
  end if;

  end loop;
  end loop;


 
  when others then
    dbms_output.put_line(SQLERRM); 


end;
