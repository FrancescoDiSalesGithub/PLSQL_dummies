declare 

nome_studente studente%rowtype;

begin

select * into nome_studente from studente where nome='giovanni';
dbms_output.put_line(nome_studente.nome);





end;