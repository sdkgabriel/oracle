--         Nome: sequence_reset.sql
--        Autor: Sadrake Gabriel Silva
--    Descricao: Zera valor de sequence
--   Requisitos: Permissao para criar procedure e alterar a sequence informada por parametro

create or replace
procedure prc_seq_reset( p_seq in varchar2 )
is
    vAtual number;
begin
    -- seta valor atual
    execute immediate
    'select ' || p_seq || '.nextval from dual' INTO vAtual;

    -- altera incremento para -vAtual
    execute immediate
    'alter sequence ' || p_seq || ' increment by -' || vAtual || ' minvalue 0';

    -- faz select zerando o valor
    execute immediate
    'select ' || p_seq || '.nextval from dual' INTO vAtual;

    -- volta incremento para 1
    execute immediate
    'alter sequence ' || p_seq || ' increment by 1 minvalue 0';
end;
/