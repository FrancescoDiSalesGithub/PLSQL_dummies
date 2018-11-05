create or replace trigger sh_backup
before insert or update or delete on superheroes
for each row
begin

if inserting then 
 insert into superheroes_backup values(:NEW.sh_name);
elsif updating then
  update superheroes_backup set sh_name=:NEW.sh_name where sh_name=:OLD.sh_name;
elsif deleting then
  delete from superheroes_backup where sh_name=:OLD.sh_name;
end if;

end;
