PGDMP                           {            quizapp     15.1 (Ubuntu 15.1-1.pgdg22.04+1)     15.1 (Ubuntu 15.1-1.pgdg22.04+1) 3   :           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ;           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            <           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            =           1262    18913    quizapp    DATABASE     s   CREATE DATABASE quizapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE quizapp;
                postgres    false            	            2615    18920    crud    SCHEMA        CREATE SCHEMA crud;
    DROP SCHEMA crud;
                postgres    false            
            2615    18921    helper    SCHEMA        CREATE SCHEMA helper;
    DROP SCHEMA helper;
                postgres    false                        2615    19889    logs    SCHEMA        CREATE SCHEMA logs;
    DROP SCHEMA logs;
                postgres    false                        2615    18919    mapper    SCHEMA        CREATE SCHEMA mapper;
    DROP SCHEMA mapper;
                postgres    false                        2615    20522    quizapp    SCHEMA        CREATE SCHEMA quizapp;
    DROP SCHEMA quizapp;
                postgres    false                        2615    18918    utils    SCHEMA        CREATE SCHEMA utils;
    DROP SCHEMA utils;
                postgres    false                        3079    19620    pgcrypto 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA utils;
    DROP EXTENSION pgcrypto;
                   false    7            >           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    2            m           1247    20525 
   answer_dto    TYPE     L   CREATE TYPE quizapp.answer_dto AS (
	question_id integer,
	choices jsonb
);
    DROP TYPE quizapp.answer_dto;
       quizapp          postgres    false    12            p           1247    20528    level_create_dto    TYPE     v   CREATE TYPE quizapp.level_create_dto AS (
	code character varying,
	subject character varying,
	translations jsonb
);
 $   DROP TYPE quizapp.level_create_dto;
       quizapp          postgres    false    12            s           1247    20531    question_create_dto    TYPE     ?   CREATE TYPE quizapp.question_create_dto AS (
	title character varying,
	subject character varying,
	level character varying,
	language character varying,
	choices jsonb,
	translations jsonb
);
 '   DROP TYPE quizapp.question_create_dto;
       quizapp          postgres    false    12            v           1247    20534    quiz_generate_dto    TYPE     ?   CREATE TYPE quizapp.quiz_generate_dto AS (
	language character varying,
	subject character varying,
	level character varying,
	questioncount integer
);
 %   DROP TYPE quizapp.quiz_generate_dto;
       quizapp          postgres    false    12            y           1247    20537    subject_create_dto    TYPE     u   CREATE TYPE quizapp.subject_create_dto AS (
	code character varying,
	name character varying,
	translations jsonb
);
 &   DROP TYPE quizapp.subject_create_dto;
       quizapp          postgres    false    12            |           1247    20540    user_register_dto    TYPE     ?   CREATE TYPE quizapp.user_register_dto AS (
	username character varying,
	password character varying,
	language character varying,
	role character varying
);
 %   DROP TYPE quizapp.user_register_dto;
       quizapp          postgres    false    12            4           1247    19256    category_create_dto    TYPE     f   CREATE TYPE utils.category_create_dto AS (
	category_name character varying,
	language_id smallint
);
 %   DROP TYPE utils.category_create_dto;
       utils          postgres    false    7            7           1247    19271    category_update_dto    TYPE     f   CREATE TYPE utils.category_update_dto AS (
	category_name character varying,
	category_id smallint
);
 %   DROP TYPE utils.category_update_dto;
       utils          postgres    false    7                       1247    18923    no_null_length_zero_varchar    DOMAIN     ?   CREATE DOMAIN utils.no_null_length_zero_varchar AS character varying NOT NULL
	CONSTRAINT no_null_length_zero_varchar_check CHECK ((length(TRIM(BOTH FROM VALUE)) > 0));
 /   DROP DOMAIN utils.no_null_length_zero_varchar;
       utils          postgres    false    7            I           1247    19770    create_language_dto    TYPE        CREATE TYPE utils.create_language_dto AS (
	code utils.no_null_length_zero_varchar,
	name utils.no_null_length_zero_varchar
);
 %   DROP TYPE utils.create_language_dto;
       utils          postgres    false    7    1038    1038            ?           1247    29086    create_user_dto    TYPE     ?   CREATE TYPE utils.create_user_dto AS (
	full_name character varying,
	username character varying,
	password character varying,
	email character varying,
	language_id smallint,
	role character varying
);
 !   DROP TYPE utils.create_user_dto;
       utils          postgres    false    7            j           1247    19977    get_test    TYPE     k   CREATE TYPE utils.get_test AS (
	category_id smallint,
	number_of_questions integer,
	level_id smallint
);
    DROP TYPE utils.get_test;
       utils          postgres    false    7            :           1247    19282    level_create_dto    TYPE     `   CREATE TYPE utils.level_create_dto AS (
	level_name character varying,
	category_id smallint
);
 "   DROP TYPE utils.level_create_dto;
       utils          postgres    false    7            =           1247    19303    level_update_dto    TYPE     l   CREATE TYPE utils.level_update_dto AS (
	level_id integer,
	level_name character varying,
	power integer
);
 "   DROP TYPE utils.level_update_dto;
       utils          postgres    false    7                       1247    18926    no_null_length_zero_text    DOMAIN     ?   CREATE DOMAIN utils.no_null_length_zero_text AS text NOT NULL
	CONSTRAINT no_null_length_zero_text_check CHECK ((length(TRIM(BOTH FROM VALUE)) > 0));
 ,   DROP DOMAIN utils.no_null_length_zero_text;
       utils          postgres    false    7            .           1247    19236    variant_create    TYPE     ?   CREATE TYPE utils.variant_create AS (
	question_id smallint,
	variant_body utils.no_null_length_zero_text,
	is_correct boolean,
	created_by bigint
);
     DROP TYPE utils.variant_create;
       utils          postgres    false    7    1042            R           1247    19801    question_create    TYPE     ?   CREATE TYPE utils.question_create AS (
	category_id smallint,
	question_body utils.no_null_length_zero_text,
	level_id integer,
	variants utils.variant_create[]
);
 !   DROP TYPE utils.question_create;
       utils          postgres    false    7    1070    1042            1           1247    19244    question_create_dto    TYPE     O   CREATE TYPE utils.question_create_dto AS (
	variants utils.variant_create[]
);
 %   DROP TYPE utils.question_create_dto;
       utils          postgres    false    7    1070            @           1247    19319    question_update_dto    TYPE     j   CREATE TYPE utils.question_update_dto AS (
	question_body text,
	level_id integer,
	question_id bigint
);
 %   DROP TYPE utils.question_update_dto;
       utils          postgres    false    7            O           1247    19785    quiz_create_dto    TYPE     S   CREATE TYPE utils.quiz_create_dto AS (
	user_answers jsonb,
	question_id bigint
);
 !   DROP TYPE utils.quiz_create_dto;
       utils          postgres    false    7            ?           1247    28780    submit_answer    TYPE     `   CREATE TYPE utils.submit_answer AS (
	quizid integer,
	questionid integer,
	choices bigint[]
);
    DROP TYPE utils.submit_answer;
       utils          postgres    false    7            L           1247    19776    update_language_dto    TYPE     k   CREATE TYPE utils.update_language_dto AS (
	id bigint,
	name character varying,
	code character varying
);
 %   DROP TYPE utils.update_language_dto;
       utils          postgres    false    7                       1247    18929 	   user_role    TYPE     b   CREATE TYPE utils.user_role AS ENUM (
    'ADMIN',
    'USER',
    'SUPER_ADMIN',
    'MENTOR'
);
    DROP TYPE utils.user_role;
       utils          postgres    false    7            F           1247    19673    update_user_dto    TYPE     ?   CREATE TYPE utils.update_user_dto AS (
	id bigint,
	full_name character varying,
	username character varying,
	password character varying,
	email character varying,
	language_id smallint,
	role utils.user_role
);
 !   DROP TYPE utils.update_user_dto;
       utils          postgres    false    7    1046            C           1247    19576    variant_update_dto    TYPE     i   CREATE TYPE utils.variant_update_dto AS (
	variant_id bigint,
	variant_body text,
	is_correct boolean
);
 $   DROP TYPE utils.variant_update_dto;
       utils          postgres    false    7            A           1255    19277    categories_get()    FUNCTION     u  CREATE FUNCTION crud.categories_get() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    result     json;
    r_category record;
BEGIN


    raise warning '%',r_category;

    return (select json_agg(
                           crud.category_get(t.id)
                       )
            from (select * from public.category t where t.is_deleted = 0) as t);

end;
$$;
 %   DROP FUNCTION crud.categories_get();
       crud          postgres    false    9            g           1255    19257    category_create(text, bigint)    FUNCTION     ?  CREATE FUNCTION crud.category_create(dataparam text, i_user_id bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    dto    utils.category_create_dto;
    newInt bigint;
BEGIN

    call helper.check_dataparam(dataparam);
    call helper.is_active(i_user_id);

    dto = mapper.to_category_create_dto(dataparam);

    call helper.check_for_null_or_length_zero(
            dto.category_name::text, 'Category name is invalid');
    call helper.check_for_null_or_length_zero(
            dto.language_id::text, 'Language id is invalid ');

    if helper.hasanyrole('ADMIN#MENTOR', i_user_id) is false then
        raise exception 'Permission denied!';
    end if;
    
    if exists(select *
              from public.category c
              where c.category_name ilike dto.category_name) then
        raise exception 'Category with name ''%'' already exists ', dto.category_name
            using detail = 'Category name should be unique';
    end if;

    if not exists(select * from public.language l where l.is_deleted = 0 and l.id = dto.language_id) then
        raise exception 'Language id not found by ''%'' id', dto.language_id
            using hint = 'Please check language id ';
    end if;

    insert into public.category(category_name, language_id, created_by)
    VALUES (dto.category_name, dto.language_id, i_user_id)
    returning id into newInt;

    return newInt;

END
$$;
 F   DROP FUNCTION crud.category_create(dataparam text, i_user_id bigint);
       crud          postgres    false    9            ?           1255    19279 !   category_delete(smallint, bigint)    FUNCTION     ?  CREATE FUNCTION crud.category_delete(i_category_id smallint, session_user_id bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    r_category record;
BEGIN
    call helper.is_active(session_user_id);
    call helper.check_for_null_or_length_zero(i_category_id::text, 'Category id is invalid');

    if helper.hasanyrole('ADMIN#MENTOR', session_user_id) is false then
        raise exception 'Permission denied!';
    end if;

    select * into r_category from public.category c where c.is_deleted = 0 and c.id = i_category_id;
    if not FOUND then
        raise exception 'Category not found by ''%'' id ', i_category_id;
    end if;

    update public.category c set is_deleted = 1 where c.id = i_category_id;

    return r_category::text;

end;
$$;
 T   DROP FUNCTION crud.category_delete(i_category_id smallint, session_user_id bigint);
       crud          postgres    false    9            V           1255    19278    category_get(smallint)    FUNCTION     ?  CREATE FUNCTION crud.category_get(i_category_id smallint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
    r_category record;
BEGIN

    select * into r_category from public.category p where is_deleted = 0 and p.id = i_category_id;

    if not FOUND then
        return null;
    end if;

    return (select json_build_object(
                           'category_name', r_category.category_name,
                           'language_id', r_category.language_id, -- call get_language(language_id);
                           'created_at', r_category.created_at,
                           'created_by', r_category.created_by
                       ));


end;
$$;
 9   DROP FUNCTION crud.category_get(i_category_id smallint);
       crud          postgres    false    9            Z           1255    19274    category_update(text, bigint)    FUNCTION     %  CREATE FUNCTION crud.category_update(dataparam text, i_user_id bigint DEFAULT NULL::bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    r_category record;
    dto        utils.category_update_dto;

BEGIN
    call helper.check_dataparam(dataparam);
    call helper.is_active(i_user_id);

    dto = mapper.to_category_update_dto(dataparam, i_user_id);

    call helper.check_for_null_or_length_zero(dto.category_id::text, 'Category id is invalid');

    call helper.check_admin_or_mentor(i_user_id);

    if dto.category_name is null or length(trim(dto.category_name)) = 0 then
        return dataparam;
    end if;
    
    select * into r_category from public.category c where c.is_deleted = 0 and c.id = dto.category_id;

    if not FOUND then
        raise exception 'Category not found by this ''%'' id ', dto.category_id;
    end if;

    update public.category
    set category_name = dto.category_name,
        updated_by=i_user_id,
        updated_at=now()
    where public.category.id = r_category.id;

    return r_category::text;

END
$$;
 F   DROP FUNCTION crud.category_update(dataparam text, i_user_id bigint);
       crud          postgres    false    9            ?           1255    28777    iscorrect(bigint, bigint[])    FUNCTION       CREATE FUNCTION crud.iscorrect(questionid bigint, user_choices bigint[]) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare
    truevariants bigint[];
begin

    truevariants := array_agg(t.id)
                    from (select t.id from public.variant t where t.is_correct and t.question_id = questionid) t;


    if array_length(truevariants, 1) <> 0 then

        return array_length(truevariants, 1) = array_length(user_choices, 1) AND
               user_choices @> truevariants;

    end if;

    return false;


end
$$;
 H   DROP FUNCTION crud.iscorrect(questionid bigint, user_choices bigint[]);
       crud          postgres    false    9            ?           1255    19772    language_create(text, bigint)    FUNCTION     ~  CREATE FUNCTION crud.language_create(data_params text, created_by bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    json_data  json;
    new_id     bigint;
    c_dto      utils.create_language_dto;
    t_language record;
BEGIN
    if data_params is null or data_params = '{}'::text or trim(data_params) = '' then
        raise exception 'Parameters can not be null or empty' using message = 'Check parameters';
    end if;
    json_data := data_params::json;
    c_dto := mapper.json_to_create_language_dto(json_data);
    call helper.check_input_is_null(c_dto.name, 'Language name');
    call helper.check_input_is_null(c_dto.code, 'Language code');
    call helper.is_active(created_by);
    if helper.hasrole(created_by, 'user') then
        raise exception 'Permission denied';
    end if;
    select * into t_language from public.language lan where lan.code ilike c_dto.code;
    if FOUND then
        raise exception 'Language % already exist',t_language.code;
    end if;
    select * into t_language from public.language lan where lan.name ilike c_dto.name;
    if FOUND then
        raise exception 'Language with name % already exist',t_language.name;
    end if;
    insert into public.language(name, code, updated_by, updated_at)
    VALUES (c_dto.name,
            c_dto.code,
            created_by,
            now())
    returning id into new_id;
    return new_id;
END
$$;
 I   DROP FUNCTION crud.language_create(data_params text, created_by bigint);
       crud          postgres    false    9                       1255    19773    language_delete(bigint, bigint)    FUNCTION     ?  CREATE FUNCTION crud.language_delete(language_id bigint, session_user_id bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    t_user     record;
    t_language record;
BEGIN
    call helper.is_active(session_user_id);
    select * into t_user from public.users usr where session_user_id = usr.id;
    if (t_user.role = 'user') is false then
        raise exception 'Permission denied';
    end if;
    select * into t_language from public.language l where l.id = language_id;
    if FOUND then
        update public.language set is_deleted = 1 where id = language_id;
        update public.language set updated_by = session_user_id where id = language_id;
    end if;
    return true;
END
$$;
 P   DROP FUNCTION crud.language_delete(language_id bigint, session_user_id bigint);
       crud          postgres    false    9            }           1255    19779    language_get(bigint)    FUNCTION       CREATE FUNCTION crud.language_get(i_language_id bigint DEFAULT NULL::bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
begin
    return ((select (json_build_object(
            'id', t.id,
            'name', t.name,
            'code', t.code
        ))
            from public.language t
            where t.is_deleted = 0
              and t.id = i_language_id)::text);
end
$$;
 7   DROP FUNCTION crud.language_get(i_language_id bigint);
       crud          postgres    false    9            ?           1255    19781    language_update(text, bigint)    FUNCTION     q  CREATE FUNCTION crud.language_update(data_params text, session_user_id bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    json_data  json;
    t_language record;
    dto        utils.update_language_dto;
BEGIN
    call helper.is_active(session_user_id);
    call helper.check_dataparam(data_params);
    json_data := data_params::json;
    dto := mapper.json_to_update_language_dto(json_data);

    call helper.check_admin_or_mentor(session_user_id);

    select * into t_language from public.language t where t.is_deleted = 0 and t.id = dto.id;
    if not FOUND then
        raise exception 'Language not found by id ''%''',dto.id;
    end if;


    if dto.name is null then
        dto.name := t_language.name;
    elseif exists(select t.id from public.language t where t.name ilike dto.name) then
        raise exception 'Language with name % already exist',t_language.name;
    end if;

    if dto.code is null then
        dto.code := t_language.code;
    elseif exists(select t.id from public.language t where t.code ilike dto.code) then
        raise exception 'Code % already exists ',dto.code;
    end if;
   
    update public.language
    set name       = dto.name,
        code       = dto.code,
        updated_at = now(),
        updated_by = session_user_id
    where id = dto.id;
    return row_to_json(row(t_language.code,t_language.name,t_language.id));
END
$$;
 N   DROP FUNCTION crud.language_update(data_params text, session_user_id bigint);
       crud          postgres    false    9            ?           1255    19780    languages_get()    FUNCTION     :  CREATE FUNCTION crud.languages_get() RETURNS text
    LANGUAGE plpgsql
    AS $$
begin
    return ((select json_agg(json_build_object(
            'id', t.id,
            'name', t.name,
            'code', t.code
        ))
             from public.language t
             where t.is_deleted = 0)::text);
end
$$;
 $   DROP FUNCTION crud.languages_get();
       crud          postgres    false    9            i           1255    19285    level_create(text, bigint)    FUNCTION       CREATE FUNCTION crud.level_create(dataparam text DEFAULT NULL::text, i_user_id bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    datajson     json;
    dto          utils.level_create_dto;
    power_number int;
    level_id     int default -1;

begin


    call helper.check_dataparam(dataparam);
    call helper.is_active(i_user_id);

    datajson := dataparam::json;
    dto := mapper.level_to_create_dto(dataparam);


    call helper.check_for_null_or_length_zero(dto.level_name::text, 'Please check level name');
    call helper.check_for_null_or_length_zero(dto.category_id::text, 'Category id is invalid ');
    call helper.check_admin_or_mentor(i_user_id);

    if not exists(select t.id from public.category t where is_deleted = 0 and t.id = dto.category_id) then
        raise exception 'Category not found with this % id',dto.category_id; -- is it better to call get_category(id)?
    end if;


    if exists(select id
              from public.level t
              where t.level_name ILIKE dto.level_name
                and t.category_id = dto.category_id) then
        raise exception '''%'' level name already exists', dto.level_name;
    end if;


    insert into public.level(level_name, category_id, created_by)
    values (dto.level_name, dto.category_id, i_user_id)
    returning id into level_id;


    select count(*) into power_number from public.level where category_id = dto.category_id;
    
    update public.level set power = power_number where id = level_id;


    return level_id;

end;
$$;
 C   DROP FUNCTION crud.level_create(dataparam text, i_user_id bigint);
       crud          postgres    false    9            e           1255    19300    level_delete(smallint, bigint)    FUNCTION     t  CREATE FUNCTION crud.level_delete(i_level_id smallint, session_user_id bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    levelJsonb jsonb;
BEGIN

    call helper.is_active(session_user_id);
    call helper.check_admin_or_mentor(session_user_id);
    call helper.check_for_null_or_length_zero(i_level_id::text, 'Level id is invalid');

    levelJsonb := crud.level_get(i_level_id);

    if levelJsonb ->> 'level_name' is null then
        raise exception 'Level not found by ''%'' id ', i_level_id;
    end if;

    update public.level l set is_deleted = 1 where l.id = i_level_id;

    return levelJsonb;
end;
$$;
 N   DROP FUNCTION crud.level_delete(i_level_id smallint, session_user_id bigint);
       crud          postgres    false    9            W           1255    19298    level_get(integer)    FUNCTION     ?  CREATE FUNCTION crud.level_get(i_level_id integer) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
    r_level record;
BEGIN

    select * into r_level from public.level l where l.is_deleted = 0 and l.id = i_level_id;
    if not FOUND then
        return null;
    end if;


    return (select json_build_object(
                           'level_name', r_level.level_name,
                           'category_id', r_level.category_id,
                           'order', r_level.power,
                           'created_at', r_level.created_at,
                           'created_by', r_level.created_by
                       ));

end;
$$;
 2   DROP FUNCTION crud.level_get(i_level_id integer);
       crud          postgres    false    9            ?           1255    19290    level_update(text, bigint)    FUNCTION     ?  CREATE FUNCTION crud.level_update(dataparam text, i_user_id bigint DEFAULT NULL::bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    levelJsonb jsonb;
    dto        utils.level_update_dto;

BEGIN
    call helper.check_dataparam(dataparam);
    call helper.is_active(i_user_id);

    dto := mapper.level_to_update_dto(dataparam);

    call helper.check_for_null_or_length_zero(dto.level_id::text, 'Please check level id');
    call helper.check_admin_or_mentor(i_user_id);

    levelJsonb := crud.level_get(dto.level_id);

    if not levelJsonb ->> 'label_name' is null then
        raise exception 'Level not found by ''%''' , dto.level_id
            using hint = 'Please check level id';
    end if;


    if dto.power is not null and not crud.set_level_order(dto.level_id, dto.power) then
        raise exception 'order went wrong!';
    end if;
    

    if dto.level_name is null then
        dto.level_name = levelJsonb ->> 'level_name';
    end if;

    levelJsonb := crud.level_get(dto.level_id);


    update public.level
    set level_name = dto.level_name,
        updated_by = i_user_id,
        updated_at = now()
    where public.level.id = dto.level_id;


    return levelJsonb::text;

END
$$;
 C   DROP FUNCTION crud.level_update(dataparam text, i_user_id bigint);
       crud          postgres    false    9            X           1255    19299    levels_get()    FUNCTION     ?   CREATE FUNCTION crud.levels_get() RETURNS text
    LANGUAGE plpgsql
    AS $$
Declare
begin

    return (select json_agg(crud.level_get(l.id))
            from (select * from public.level l where is_deleted = 0) as l);

end;
$$;
 !   DROP FUNCTION crud.levels_get();
       crud          postgres    false    9            ?           1255    19253    question_create(text, bigint)    FUNCTION     C  CREATE FUNCTION crud.question_create(dataparam text, i_user_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$

declare
    dto_array    jsonb;
    question_dto jsonb;
    variant      jsonb;
    variantId    bigint;
    variants     jsonb;
    questionId   bigint;
    categoryId   int;
    levelId      int;
    questionBody text;
    question_ids bigint[];
begin

    call helper.check_dataparam(dataparam);
    call helper.is_active(i_user_id);

    dto_array := dataparam::jsonb;


    for question_dto in select jsonb_array_elements(dto_array)
        loop

            categoryId = question_dto ->> 'category_id';
            levelId = question_dto ->> 'level_id';
            questionBody = question_dto ->> 'question_body';
            variants = question_dto -> 'variants';


            raise info 'variants=%',variants;
            raise info 'type of=%',pg_typeof(variants);


            if exists(select t.id
                      from public.level t
                      where t.category_id = categoryId
                        and t.id = levelId)
            then
                insert into public.question(question_body, category_id, level_id, created_by)
                values (questionBody, categoryId, levelId, i_user_id)
                returning id into questionId;

                for variant in select jsonb_array_elements(variants::jsonb)
                    loop
                    
                    raise info 'variant=%, question_id=%, variant_body=%',variant,questionId,variant->>'variant_body';

                        insert into public.variant (question_id, body, is_correct, created_by)
                        values (questionId, (variant ->> 'variant_body'),
                                (variant -> 'is_correct')::bool, i_user_id)
                        returning id into variantId;
                        raise info 'variant_id= %',variantId;

                    end loop;

                question_ids := array_append(question_ids, questionId);

            end if;
        end loop;


    return coalesce(question_ids, array []::bigint[]);

end ;

$$;
 F   DROP FUNCTION crud.question_create(dataparam text, i_user_id bigint);
       crud          postgres    false    9            s           1255    19581    question_delete(bigint, bigint)    FUNCTION     U  CREATE FUNCTION crud.question_delete(i_question_id bigint, i_user_id bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$

declare
    questionJsonb jsonb;
begin

    call helper.is_active(i_user_id);
    call helper.check_admin_or_mentor(i_user_id);


    questionJsonb := crud.question_get(i_question_id);

    if questionJsonb ->> 'question_body' is null then
        raise exception 'Question not found with this % id ',i_question_id;
    end if;

    update public.question set is_deleted=1, updated_by=i_user_id, updated_at=now() where id = i_question_id;

    return questionJsonb;

end
$$;
 L   DROP FUNCTION crud.question_delete(i_question_id bigint, i_user_id bigint);
       crud          postgres    false    9            v           1255    19573    question_get(bigint)    FUNCTION     ?  CREATE FUNCTION crud.question_get(i_question_id bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
declare
    r_question record;
BEGIN

    if i_question_id is null then
        return null;
    end if;

    select * into r_question from public.question q where q.id = i_question_id and is_deleted = 0;

    return jsonb_build_object(
            'question_id', r_question.id,
            'question_body', r_question.question_body,
            'question_category', crud.category_get(r_question.category_id::smallint),
            'question_level', crud.level_get(r_question.level_id),
            'variants', crud.variants_get(r_question.id)
        );

END;
$$;
 7   DROP FUNCTION crud.question_get(i_question_id bigint);
       crud          postgres    false    9            r           1255    19321    question_update(text, bigint)    FUNCTION     >  CREATE FUNCTION crud.question_update(dataparam text, i_user_id bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
declare
    dto        utils.question_update_dto;
    r_question record;
begin


    call helper.is_active(i_user_id);
    call helper.check_dataparam(dataparam);
    call helper.check_admin_or_mentor(i_user_id);

    dto := mapper.to_question_update_dto(dataparam::jsonb);

    select * into r_question from public.question t where t.id = dto.question_id;

    if not FOUND then
        raise exception 'Cannot find question with this % id',dto.question_id;
    end if;

    if dto.question_body is null then
        dto.question_body := r_question.question_body::text;
    end if;


    if dto.level_id is null then
        dto.level_id := r_question.level_id;
    else
        if not exists(select t.id
                      from public.level t
                      where t.id = dto.level_id
                        and t.category_id = r_question.category_id) then
            raise exception 'This level does not belong to this % category',r_question.category_id;
        end if;
    end if;

    update public.question
    set question_body=dto.question_body,
        level_id=dto.level_id,
        updated_at=now(),
        updated_by=i_user_id
    where id = dto.question_id;

    return to_jsonb(r_question);

end
$$;
 F   DROP FUNCTION crud.question_update(dataparam text, i_user_id bigint);
       crud          postgres    false    9            k           1255    19572    questions_get(smallint)    FUNCTION       CREATE FUNCTION crud.questions_get(i_category_id smallint) RETURNS text
    LANGUAGE plpgsql
    AS $$
declare
BEGIN
    
    return coalesce(
            (select json_agg(crud.question_get(t.id)) from public.question t where t.category_id = i_category_id),
            '[]');

END;
$$;
 :   DROP FUNCTION crud.questions_get(i_category_id smallint);
       crud          postgres    false    9            ?           1255    28774    quiz_finish(integer, integer)    FUNCTION       CREATE FUNCTION crud.quiz_finish(quiz_id integer, user_id integer) RETURNS text
    LANGUAGE plpgsql
    AS $$

declare
    r_quiz record;
begin


    select * into r_quiz from public.quiz_history q where q.id = quiz_id and q.finished_at is null;

    if not found then
        raise exception 'quiz is not found or expired';
    end if;

    if r_quiz.user_id <> user_id and helper.hasanyrole('ADMIN#MENTOR#SUPERADMIN', user_id) is false then
        raise exception 'Permission denied!';
    end if;

    select count(*) into r_quiz.correct_answers from public.quiz_question qq where qq.correct;

    update public.quiz_history qh
    set correct_answers=r_quiz.correct_answers,
        finished_at=now()
    where qh.id = quiz_id
    returning * into r_quiz;


    return r_quiz::text;

end
$$;
 B   DROP FUNCTION crud.quiz_finish(quiz_id integer, user_id integer);
       crud          postgres    false    9            ?           1255    28756    quiz_generate(text, bigint)    FUNCTION     7  CREATE FUNCTION crud.quiz_generate(dataparam text, i_user_id bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
declare
    dto          utils.get_test;
    question_ids bigint[];
    quizid       bigint;
    questionid   bigint;
begin


    call helper.check_dataparam(dataparam);
    call helper.is_active(i_user_id);

    dto := mapper.json_to_get_test(dataparam);

    question_ids := array_agg(t.id)
                    from (select q.id
                          from public.question q
                          where q.category_id = dto.category_id
                            and q.level_id = dto.level_id
                            and q.is_deleted = 0
                            and jsonb_array_length(crud.variants_get(q.id)) > 0
                          order by random()) t;


    if array_length(question_ids, 1) < dto.number_of_questions or dto.number_of_questions < 1 then
        raise exception 'There is no such questions %',dto.number_of_questions;
    end if;

    insert into public.quiz_history(user_id, question_count)
    values (i_user_id, array_length(question_ids, 1))
    returning id into quizid;

    foreach questionid in array question_ids
        loop
            insert into public.quiz_question(quiz_id, question_id) values (quizid, questionid);
        end loop;


    return quizid;
end
$$;
 D   DROP FUNCTION crud.quiz_generate(dataparam text, i_user_id bigint);
       crud          postgres    false    9            z           1255    19795    quiz_histories_get()    FUNCTION       CREATE FUNCTION crud.quiz_histories_get() RETURNS text
    LANGUAGE plpgsql
    AS $$
begin
    return (select json_agg(json_build_object(
            'Id', q.id,
            'userId', q.user_id,
            'userAnswers', q.user_answers,
            'max_questions', q.question_count,
            'correctAnswers', q.correct_answers))
                     from public.quiz_history q
                    where q.is_deleted = 0
                    group by q.created_at
                     order by q.created_at)::text;


end
$$;
 )   DROP FUNCTION crud.quiz_histories_get();
       crud          postgres    false    9            ?           1255    19982 !   quiz_history_create(text, bigint)    FUNCTION     ?  CREATE FUNCTION crud.quiz_history_create(dataparam text DEFAULT NULL::text, i_user_id bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
declare
    newId                    bigint;
    dto_array                jsonb;
    dto                      jsonb;
    ids                      bigint[];
    number_of_questions      smallint default 0;
    number_of_correct_answer smallint default 0;

begin
    call helper.check_dataparam(dataparam);
    call helper.is_active(i_user_id);

--     dto_array = mapper.to_quiz_history_create_dto(dataparam::jsonb);
--

    dto_array:=dataparam::jsonb;
    raise info '% array',dto_array;

    for dto in select jsonb_array_elements(dto_array)
        loop

            if helper.check_user_answer(dto) then
                number_of_correct_answer := number_of_correct_answer + 1;
            end if;

        end loop;

    raise info 'jsonlength=%',jsonb_array_length(dto_array);
    insert into public.quiz_history(user_id, user_answers, correct_answers, question_count)
    values (i_user_id, dto_array, number_of_correct_answer, jsonb_array_length(dto_array))
    returning id into newId;


    return newId;
end
$$;
 J   DROP FUNCTION crud.quiz_history_create(dataparam text, i_user_id bigint);
       crud          postgres    false    9            ?           1255    19980 #   quiz_history_delete(bigint, bigint)    FUNCTION     ?  CREATE FUNCTION crud.quiz_history_delete(i_quiz_history_id bigint DEFAULT NULL::bigint, session_user_id bigint DEFAULT NULL::bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN

    call helper.check_for_null_or_length_zero(i_quiz_history_id::text, 'Quiz history id is invalid');
    call helper.check_for_null_or_length_zero(session_user_id::text, 'User id is invalid');
    call helper.is_active(session_user_id);
    call helper.check_admin_or_mentor(session_user_id);

    if not exists(select * from public.quiz_history q where q.is_deleted = 0 and q.id = i_quiz_history_id) then
        raise exception 'Quiz history is not found with id "%"',i_quiz_history_id;
        end if;

    update public.quiz_history q set is_deleted = 1 where q.id = i_quiz_history_id;

    return (select json_agg(json_build_object(
            'user_id', q.user_id,
            'user_answers', q.user_answers,
            'correct_answers', q.correct_answers,
            'max_questions', q.question_count,
            'is_deleted', q.is_deleted))
                     from public.quiz_history q
                     where q.id = i_quiz_history_id)::text;

end
$$;
 Z   DROP FUNCTION crud.quiz_history_delete(i_quiz_history_id bigint, session_user_id bigint);
       crud          postgres    false    9            {           1255    19793    quiz_history_get(bigint)    FUNCTION       CREATE FUNCTION crud.quiz_history_get(i_quiz_history_id bigint DEFAULT NULL::bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
begin
    call helper.check_for_null_or_length_zero(i_quiz_history_id::text, 'Quiz history id is invalid');

    if not exists(select * from public.quiz_history q where q.is_deleted = 0 and q.id = i_quiz_history_id) then
        raise exception 'Quiz history is not found with id "%"',i_quiz_history_id;
    end if;

    return (select json_agg(json_build_object(
            'userId', q.user_id,
            'userAnswers', q.user_answers,
            'max_questions', q.question_count,
            'correctAnswers', q.correct_answers))
                     from public.quiz_history q
                     where q.id = i_quiz_history_id)::text;

end
$$;
 ?   DROP FUNCTION crud.quiz_history_get(i_quiz_history_id bigint);
       crud          postgres    false    9            y           1255    19794    quiz_history_user_get(bigint)    FUNCTION       CREATE FUNCTION crud.quiz_history_user_get(userid bigint DEFAULT NULL::bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
begin
    call helper.is_active(userid);

    return (select json_agg(json_build_object(
            'userId', q.user_id,
            'userAnswers', q.user_answers,
            'maxQuestions', q.question_count,
            'correctAnswers', q.correct_answers,
            'created_at', q.created_at))
                     from public.quiz_history q
                     where  q.is_deleted=0 and q.user_id = userid
                    group by q.created_at
                    order by q.created_at)::text;
end;
$$;
 9   DROP FUNCTION crud.quiz_history_user_get(userid bigint);
       crud          postgres    false    9            ?           1255    28773 #   quiz_question_submit(text, integer)    FUNCTION       CREATE FUNCTION crud.quiz_question_submit(dataparam text, user_id integer) RETURNS text
    LANGUAGE plpgsql
    AS $$
declare
    dataJson jsonb;
    dto      utils.submit_answer;

begin

    call helper.is_active(user_id);
    call helper.check_dataparam(dataparam);
    dataJson := dataparam::json;

    dto.quizid := dataJson ->> 'quizid';
    dto.questionid := dataJson ->> 'questionid';
    dto.choices := array_agg(t::bigint) from jsonb_array_elements(dataJson -> 'choices') t;


    call helper.check_for_null_or_length_zero(dto.quizid::text);
    call helper.check_for_null_or_length_zero(dto.questionid::text);
    call helper.check_for_null_or_length_zero(dto.choices::text);

    if array_length(dto.choices, 1) <> 0 then

        update public.quiz_question qq
        set correct=crud.iscorrect(dto.questionid, dto.choices),
            user_choices=dto.choices
        where qq.quiz_id = dto.quizid
          and qq.question_id = dto.questionid;

    end if;

    return
        crud.question_get((select qq.question_id
                           from public.quiz_question qq
                           where qq.quiz_id = dto.quizid
                             and correct is null
                             and qq.question_id <> dto.questionid
                           limit 1));


end
$$;
 J   DROP FUNCTION crud.quiz_question_submit(dataparam text, user_id integer);
       crud          postgres    false    9            ?           1255    28759    quiz_start(bigint, bigint)    FUNCTION     ?  CREATE FUNCTION crud.quiz_start(i_quiz_id bigint, i_user_id bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
begin

    call helper.is_active(i_user_id);
    if not exists(select q.id
                  from public.quiz_history q
                  where q.user_id = i_user_id
                    and q.started_at is null
                    and q.id = i_quiz_id) then
        raise exception 'Quiz not found!';
    end if;

    update public.quiz_history qh set started_at=current_timestamp where qh.id = i_quiz_id;

    return crud.question_get((select qq.question_id from public.quiz_question qq where qq.quiz_id = i_quiz_id limit 1));


end;
$$;
 C   DROP FUNCTION crud.quiz_start(i_quiz_id bigint, i_user_id bigint);
       crud          postgres    false    9            h           1255    19305 !   set_level_order(integer, integer)    FUNCTION     ?  CREATE FUNCTION crud.set_level_order(level_id integer, i_order integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$

declare
    oldOrder            int;
    ownerOrder          int;
    counterpartId       int;
    number_of_questions int;

begin


    ownerOrder := (select t.power from public.level t where t.id = level_id);
    counterpartId := (select t.id from public.level t order by power limit 1 offset i_order - 1);
    oldOrder := (select t.power from public.level t where t.id = counterpartId);

    number_of_questions :=
            (select count(*) over (partition by category_id) from public.level t where t.category_id = 9 limit 1);

    raise warning 'number of question % ',number_of_questions;
    raise warning 'order % ',i_order;

    if i_order > number_of_questions or i_order < 1 then
        return false;
    end if;


    update public.level set power=oldOrder where id = level_id;
    update public.level set power=ownerOrder where id = counterpartId;

    return true;


end;
$$;
 G   DROP FUNCTION crud.set_level_order(level_id integer, i_order integer);
       crud          postgres    false    9            a           1255    19670    user_delete(bigint, bigint)    FUNCTION     ?  CREATE FUNCTION crud.user_delete(user_id bigint, session_user_id bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    t_user record;
BEGIN
    call helper.is_active(user_id);
    call helper.is_active(session_user_id);

    select * into t_user from public.users usr where session_user_id = usr.id;

    if (helper.hasanyrole('ADMIN#SUPERADMIN', session_user_id) is false
        and t_user.id = user_id) is false then
        raise exception 'Permission denied' using hint = 'Only site administration or user can delete';
    end if;
    
    update public.users set is_deleted = 1 where id = user_id;
    return true;
END
$$;
 H   DROP FUNCTION crud.user_delete(user_id bigint, session_user_id bigint);
       crud          postgres    false    9            f           1255    19679    user_get(bigint)    FUNCTION       CREATE FUNCTION crud.user_get(i_user_id bigint DEFAULT NULL::bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
begin
    return ((select (json_build_object(
            'id', t.id,
            'fullname', t.fullname,
            'username', t.username,
            'email', t.email,
            'role', t.role,
            'created_at', t.created_at,
            'language_id', t."language_id"
        ))
             from public.users t
             where t.is_deleted = 0
               and t.id = i_user_id)::text);
end
$$;
 /   DROP FUNCTION crud.user_get(i_user_id bigint);
       crud          postgres    false    9            ?           1255    29090 0   user_login(character varying, character varying)    FUNCTION     I  CREATE FUNCTION crud.user_login(uname character varying DEFAULT NULL::character varying, pswd character varying DEFAULT NULL::character varying) RETURNS text
    LANGUAGE plpgsql
    AS $$
declare
    t_user record;
begin

    select * into t_user from public.users t where t.username = lower(uname);

    if not FOUND then
        raise exception using message = 'Bad credentials password or username is invalid!';
    end if;

    if helper.match_password(pswd, t_user.password) is false then
        raise exception 'Bad credentials password or username is invalid!';
    end if;

    return json_build_object('id', t_user.id,
                             'username', t_user.username,
                             'language', crud.language_get(t_user.language_id)::jsonb,
                             'role', t_user.role)::text;

end
$$;
 P   DROP FUNCTION crud.user_login(uname character varying, pswd character varying);
       crud          postgres    false    9            ?           1255    29089    user_register(text)    FUNCTION     "  CREATE FUNCTION crud.user_register(dataparam text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
    newId  int4;
    t_user record;
    dto    utils.create_user_dto;
begin

    call helper.check_dataparam(dataparam);

    dto := mapper.json_to_create_user_dto(dataparam::json);


    call helper.check_for_null_or_length_zero(dto.email, 'Email is invalid');
    call helper.check_for_null_or_length_zero(dto.password, 'Password is invalid');
    call helper.check_for_null_or_length_zero(dto.username, 'Username is invalid');
    call helper.check_for_null_or_length_zero(dto.full_name, 'Full name is invalid');
    call helper.check_for_null_or_length_zero(dto.language_id::text, 'Language is invalid');

    select *
    into t_user
    from public.users t
    where t.username = lower(dto.username);

    if FOUND then
        raise using message = 'User already exists';
    end if;


    if not exists(select * from public.language l where l.id = dto.language_id) then
        dto.language_id := 1;
    end if;

    if exists(select t.id from public.users t where t.email ilike dto.email) then
        raise exception 'User with this email % already registered!',dto.email;
    end if;

    dto.role := 'USER';

    insert into public.users (username, email, password, fullname, role, language_id)
    values (lower(dto.username),
            dto.email,
            helper.encode_password(dto.password),
            dto.full_name,
            dto.role::utils.user_role,
            dto.language_id)
    returning id into newId;

    return newId;
end
$$;
 2   DROP FUNCTION crud.user_register(dataparam text);
       crud          postgres    false    9            ?           1255    19675    user_update(text, bigint)    FUNCTION     1  CREATE FUNCTION crud.user_update(data_params text, session_user_id bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    t_user record;
    dto    utils.update_user_dto;
BEGIN

    call helper.is_active(session_user_id);
    call helper.check_dataparam(data_params);

    dto := mapper.json_to_update_user_dto(data_params::json);

    if dto.id = session_user_id is false and
       helper.hasanyrole('SUPER_ADMIN#ADMIN', session_user_id) is false then
        raise exception 'Permission denied' using hint = 'Only user or Site administration can edit';
    end if;

    select * into t_user from public.users t where t.is_deleted = 0 and t.id = dto.id;
    if not FOUND then
        raise exception 'User not found by id ''%''',dto.id;
    end if;

    if dto.username is null then
        dto.username := t_user.username;
    else
        if exists(select * from public.users usr where usr.username ilike dto.username) then
            raise exception 'User with username % already exist',t_user.username;
        end if;
    end if;

    if dto.full_name is null or length(trim(dto.full_name)) = 0 then
        dto.full_name := t_user.fullname;
    end if;

    if dto.password is null then
        dto.password := t_user.password;
    else
        dto.password = helper.crypt_password(dto.password);
    end if;

    if dto.email is null then
        dto.email := t_user.email; -- changing email must be another complete method
    else
        if helper.check_email(dto.email) is false then
            raise exception 'Wrong email format % ',dto.email using detail = 'Email will be as: example@gmail.com';
        end if;

        if exists(select * from public.users usr where usr.email ilike dto.email) then
            raise exception 'User with email % already exist',t_user.email;
        end if;
    end if;


    if dto.language_id is null then
        dto.language_id := t_user.language_id;
    else
        if not exists(select tl.id from public.language tl where tl.id = dto.language_id) then
            raise exception 'Wrong language id' using detail = 'User update language error';
        end if;
    end if;

    if dto.role is null then
        dto.role = t_user.role;
    else
        if  exists(select * from pg_enum where enumlabel = upper(dto.role::varchar)) is false or
           helper.hasanyrole('SUPER_ADMIN', session_user_id) is false then
            raise exception 'Malformed activity found in user %',dto.email;
        end if;
    end if;


    update public.users
    set fullname    = dto.full_name,
        username    = dto.username,
        password    = dto.password,
        email       = dto.email,
        language_id = dto.language_id,
        role        = cast(dto.role as utils.user_role),
        updated_at=now(),
        updated_by=session_user_id
    where id = dto.id;

    return true;
END
$$;
 J   DROP FUNCTION crud.user_update(data_params text, session_user_id bigint);
       crud          postgres    false    9            p           1255    19677    users_get()    FUNCTION     ?   CREATE FUNCTION crud.users_get() RETURNS text
    LANGUAGE plpgsql
    AS $$
begin
    return coalesce((select json_agg(crud.user_get(t.id)::jsonb)
             from public.users t
             where t.is_deleted = 0)::text,'[]');
end
$$;
     DROP FUNCTION crud.users_get();
       crud          postgres    false    9            P           1255    19312    variant_create(text, bigint)    FUNCTION     R  CREATE FUNCTION crud.variant_create(dataparam text, i_user_id bigint) RETURNS bigint[]
    LANGUAGE plpgsql
    AS $$
declare
    dto_arr    utils.variant_create[];
    dto        utils.variant_create;
    variantId  bigint;
    variantIds bigint[];
begin

    call helper.check_dataparam(dataparam);
    dto_arr := mapper.to_variants(dataparam::jsonb);

    if dto_arr is null then
        return array []::bigint[];
    end if;

    call helper.check_admin_or_mentor(i_user_id);

    foreach dto in array dto_arr
        loop

            insert into public.variant(question_id, body, is_correct, created_by)
            values (dto.question_id, dto.variant_body, dto.is_correct, i_user_id)
            returning id into variantId;
            variantIds = array_append(variantIds, variantId);

        end loop;

    return variantIds;


end;
$$;
 E   DROP FUNCTION crud.variant_create(dataparam text, i_user_id bigint);
       crud          postgres    false    9            u           1255    19582    variant_delete(bigint, bigint)    FUNCTION     @  CREATE FUNCTION crud.variant_delete(i_variant_id bigint, i_user_id bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$

declare
    variantJsonb jsonb;
begin

    call helper.is_active(i_user_id);
    call helper.check_admin_or_mentor(i_user_id);


    variantJsonb := crud.variant_get(i_variant_id);

    if variantJsonb ->> 'body' is null then
        raise exception 'Variant not found with this % id ',i_variant_id;
    end if;

    update public.variant set is_deleted=1, updated_by=i_user_id, updated_at=now() where id = i_variant_id;

    return variantJsonb;

end
$$;
 J   DROP FUNCTION crud.variant_delete(i_variant_id bigint, i_user_id bigint);
       crud          postgres    false    9            n           1255    19568    variant_get(bigint)    FUNCTION     ?  CREATE FUNCTION crud.variant_get(i_variant_id bigint DEFAULT NULL::bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
begin
    return ((select (json_build_object(
            'id', t.id,
            'body', t.body,
            'is_correct', t.is_correct
        ))
             from public.variant t
             where t.is_deleted = 0
               and t.id = i_variant_id));
end
$$;
 5   DROP FUNCTION crud.variant_get(i_variant_id bigint);
       crud          postgres    false    9            q           1255    19579    variant_update(text, bigint)    FUNCTION     ?  CREATE FUNCTION crud.variant_update(dataparam text, i_user_id bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
declare
    dto          utils.variant_update_dto;
    variantJsonb jsonb;
begin


    call helper.check_dataparam(dataparam);
    call helper.is_active(i_user_id);
    call helper.check_admin_or_mentor(i_user_id);

    dto := mapper.to_variant_update_dto(dataparam::jsonb);

    if dto.variant_id is null then
        return dataparam;
    end if;

    variantJsonb := crud.variant_get(dto.variant_id);

    if dto.variant_body is null then
        dto.variant_body := variantJsonb ->> 'body';
    end if;

    if dto.is_correct is null then
        dto.is_correct := variantJsonb ->> 'is_correct';
    end if;


    update public.variant
    set body=dto.variant_body,
        is_correct=dto.is_correct,
        updated_by=i_user_id,
        updated_at=now()
    where id = dto.variant_id;

    return variantJsonb;

end;
$$;
 E   DROP FUNCTION crud.variant_update(dataparam text, i_user_id bigint);
       crud          postgres    false    9            t           1255    19571    variants_get(bigint)    FUNCTION     H  CREATE FUNCTION crud.variants_get(i_question_id bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
begin
    return coalesce((select json_agg(crud.variant_get(t.id))
             from public.variant t
             where t.is_deleted = 0
               and t.question_id = i_question_id order by random())::text,'[]');
end
$$;
 7   DROP FUNCTION crud.variants_get(i_question_id bigint);
       crud          postgres    false    9                       1255    19261    check_admin_or_mentor(bigint) 	   PROCEDURE     r  CREATE PROCEDURE helper.check_admin_or_mentor(IN user_id bigint DEFAULT NULL::bigint)
    LANGUAGE plpgsql
    AS $$
    Begin
    if helper.hasrole(user_id, 'ADMIN') is false
        and helper.hasrole(user_id, 'MENTOR') is false then
        raise exception 'Permission denied'
            using hint = 'Only ADMIN or MENTOR can delete category';
    end if;
end;
$$;
 @   DROP PROCEDURE helper.check_admin_or_mentor(IN user_id bigint);
       helper          postgres    false    10                        1255    19218    check_dataparam(text) 	   PROCEDURE     ?   CREATE PROCEDURE helper.check_dataparam(IN dataparam text)
    LANGUAGE plpgsql
    AS $$
begin
    if dataparam is null or dataparam = '{}'::text then
        raise exception 'Data param is invalid!';
    end if;
end;
$$;
 :   DROP PROCEDURE helper.check_dataparam(IN dataparam text);
       helper          postgres    false    10            ]           1255    19663    check_email(character varying)    FUNCTION     ?  CREATE FUNCTION helper.check_email(u_email character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
DECLARE
    em      varchar;
    pattern varchar := '^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+)(\.[a-zA-Z]{2,5}){1,2}$';
BEGIN
    if u_email is null or trim(u_email) ilike '' then
        raise exception 'Email can not be null or empty' using hint = 'Check email';
    end if;
    return u_email ~* pattern;
END
$_$;
 =   DROP FUNCTION helper.check_email(u_email character varying);
       helper          postgres    false    10            ?           1255    19222 6   check_for_null_or_length_zero(text, character varying) 	   PROCEDURE     /  CREATE PROCEDURE helper.check_for_null_or_length_zero(IN content text, IN message character varying DEFAULT 'Invalid data'::character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN

    if content is null or
       length(trim(content)) = 0 then
        raise exception '%',message;
    end if;
END;
$$;
 d   DROP PROCEDURE helper.check_for_null_or_length_zero(IN content text, IN message character varying);
       helper          postgres    false    10            c           1255    19767 9   check_input_is_null(character varying, character varying) 	   PROCEDURE       CREATE PROCEDURE helper.check_input_is_null(IN i_input character varying, IN column_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    if i_input is null or trim(i_input) ilike '' then
        raise exception '% can not be null' , column_name;
    end if;
END
$$;
 k   DROP PROCEDURE helper.check_input_is_null(IN i_input character varying, IN column_name character varying);
       helper          postgres    false    10            ?           1255    19983    check_user_answer(jsonb)    FUNCTION     `  CREATE FUNCTION helper.check_user_answer(dto jsonb) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare
    question                 jsonb;
    user_answers             jsonb;
    question_correct_answers jsonb;
begin

    question_correct_answers := json_agg(id)
                                from public.variant t
                                where t.question_id = (dto ->> 'question_id')::bigint
                                  and t.is_correct;

    raise info '%m_array',question_correct_answers;

    raise info 'user answers: %',dto;

    user_answers = array_agg(t::bigint)
                   from jsonb_array_elements(dto -> 'user_answers') as t;


    raise info 'm_array=%, user_ans=%',m_array,user_answers;

--     select array_agg(t) from (select jsonb_array_elements(dto.user_answers)) as t;

    return (m_array && user_answers);
end;
$$;
 3   DROP FUNCTION helper.check_user_answer(dto jsonb);
       helper          postgres    false    10            ^           1255    19664 !   check_username(character varying)    FUNCTION     ?   CREATE FUNCTION helper.check_username(i_username character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    if i_username is null then
        raise exception 'Username can not be null';
    end if;
    return true;
END
$$;
 C   DROP FUNCTION helper.check_username(i_username character varying);
       helper          postgres    false    10            [           1255    19661 !   crypt_password(character varying)    FUNCTION     b  CREATE FUNCTION helper.crypt_password(password character varying DEFAULT NULL::character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
    if password is null then
        raise exception 'Password can not be null' using hint = 'User registration';
    end if;
    return utils.crypt(password, utils.gen_salt('bf', 4));
END
$$;
 A   DROP FUNCTION helper.crypt_password(password character varying);
       helper          postgres    false    10            ?           1255    29088 "   encode_password(character varying)    FUNCTION     (  CREATE FUNCTION helper.encode_password(rawpassword character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
begin
    if rawPassword is null then
        raise exception 'Invalid Password null';
    end if;
    return utils.crypt(rawPassword, utils.gen_salt('bf', 4));
end
$$;
 E   DROP FUNCTION helper.encode_password(rawpassword character varying);
       helper          postgres    false    10            w           1255    19796    get_user(bigint)    FUNCTION     "  CREATE FUNCTION helper.get_user(i_user_id bigint DEFAULT NULL::bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
begin
    return coalesce(((select (json_build_object(
            'id', t.id,
            'fullname', t.fullname,
            'username', t.username,
            'email', t.email,
            'role', t.role,
            'created_at', t.created_at,
            'language_id', t."language_id"
        ))
             from public.users t
             where t.is_deleted = 0
               and t.id = i_user_id)::text),'[]');
end
$$;
 1   DROP FUNCTION helper.get_user(i_user_id bigint);
       helper          postgres    false    10            x           1255    19797    get_users()    FUNCTION     ?  CREATE FUNCTION helper.get_users() RETURNS text
    LANGUAGE plpgsql
    AS $$
begin
    return coalesce(((select json_agg(json_build_object(
            'id', t.id,
            'fullname', t.fullname,
            'username', t.username,
            'email', t.email,
            'role', t.role,
            'created_at', t.created_at,
            'language_id', t."language_id"
        ))
                      from public.users t
                      where t.is_deleted = 0)::text), '[]');
end
$$;
 "   DROP FUNCTION helper.get_users();
       helper          postgres    false    10            ?           1255    28742 8   hasanyrole(character varying, bigint, character varying)    FUNCTION     ?  CREATE FUNCTION helper.hasanyrole(roles character varying, user_id bigint, dilim character varying DEFAULT '#'::character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare
    userrole varchar;
begin

    select u.role into userrole from public.users u where u.id = user_id;

    return array_position(regexp_split_to_array(roles, dilim), userrole) is not null;


end;
$$;
 c   DROP FUNCTION helper.hasanyrole(roles character varying, user_id bigint, dilim character varying);
       helper          postgres    false    10            >           1255    19260 "   hasrole(bigint, character varying)    FUNCTION     ?  CREATE FUNCTION helper.hasrole(userid bigint DEFAULT NULL::bigint, role character varying DEFAULT NULL::character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare
    t_user record;
BEGIN
    if userid is null or role is null then
        return false;
    end if;
    select * into t_user from public.users t where t.is_deleted = 0 and t.id = userid;
    return FOUND and t_user.role::text ilike role;
END
$$;
 E   DROP FUNCTION helper.hasrole(userid bigint, role character varying);
       helper          postgres    false    10            b           1255    19215    is_active(bigint) 	   PROCEDURE     ?  CREATE PROCEDURE helper.is_active(IN i_user_id bigint DEFAULT NULL::bigint)
    LANGUAGE plpgsql
    AS $$
begin

    if i_user_id is null then
        raise exception 'User not found with this % id',i_user_id;
    end if;


    if not exists(select * from public.users u where u.id = i_user_id and is_deleted = 0) then
        raise exception 'User not found with % this id',i_user_id;
    end if;

    if not found then

    end if;



end;
$$;
 6   DROP PROCEDURE helper.is_active(IN i_user_id bigint);
       helper          postgres    false    10            \           1255    19662 4   match_password(character varying, character varying)    FUNCTION       CREATE FUNCTION helper.match_password(password character varying, coded_password character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    if password is null then
        raise exception 'Password can not be null' using hint = 'User registration';
    end if;
    if coded_password is null then
        raise exception 'Coded password can not be null' using hint = 'User registration',
            detail = 'match_password function';
    end if;
    return coded_password = utils.crypt(password, coded_password);
END
$$;
 c   DROP FUNCTION helper.match_password(password character varying, coded_password character varying);
       helper          postgres    false    10                       1255    19190 '   set_correct_answers_on_question(bigint) 	   PROCEDURE     /  CREATE PROCEDURE helper.set_correct_answers_on_question(IN i_question_id bigint)
    LANGUAGE plpgsql
    AS $$
begin

    update public.question
    set correct_answers=((select count(*) from public.variant v where v.question_id = i_question_id and is_correct))
    where id = i_question_id;

end;
$$;
 P   DROP PROCEDURE helper.set_correct_answers_on_question(IN i_question_id bigint);
       helper          postgres    false    10            ?           1255    19912    log_category_changes()    FUNCTION     {  CREATE FUNCTION logs.log_category_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    if tg_op::varchar = 'INSERT' THEN
        INSERT INTO logs.category_audits_table(category_id, dml_type, dml_time_stamp)
        VALUES (NEW.id, tg_op::varchar, now());
        RETURN NEW;
    end if;
    if tg_op::varchar = 'DELETE' THEN
        INSERT INTO logs.category_audits_table(category_id, dml_type, dml_time_stamp)
        VALUES (old.id, tg_op::varchar, now());
        RETURN old;
    end if;
    IF NEW.category_name <> OLD.category_name THEN
        INSERT INTO logs.category_audits_table(CATEGORY_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                               dml_created_by, row_name)
        VALUES (old.id,row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'CATEGORY_NAME');
    END IF;
    IF NEW.is_deleted <> OLD.is_deleted THEN
        INSERT INTO logs.category_audits_table(CATEGORY_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                               dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'IS_DELETED');
    END IF;
    IF NEW.language_id <> OLD.language_id THEN
        INSERT INTO logs.category_audits_table(CATEGORY_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                               dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'LANGUAGE_ID');
    END IF;
    RETURN NEW;
ENd
$$;
 +   DROP FUNCTION logs.log_category_changes();
       logs          postgres    false    11            ?           1255    19936    log_language_changes()    FUNCTION     L  CREATE FUNCTION logs.log_language_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    if tg_op::varchar = 'INSERT' THEN
        INSERT INTO logs.language_audits_table(language_id, dml_type, dml_time_stamp)
        VALUES (NEW.id, tg_op::varchar, now());
        RETURN NEW;
    end if;
    if tg_op::varchar = 'DELETE' THEN
        INSERT INTO logs.language_audits_table(language_id, dml_type, dml_time_stamp)
        VALUES (old.id, tg_op::varchar, now());
        RETURN old;
    end if;
    IF NEW.name <> OLD.name THEN
        INSERT INTO logs.language_audits_table(language_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                               dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'name');
    END IF;
    IF NEW.code <> OLD.code THEN
        INSERT INTO logs.language_audits_table(language_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                               dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'code');
    END IF;
    IF NEW.is_deleted <> OLD.is_deleted THEN
        INSERT INTO logs.language_audits_table(language_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                               dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'is_deleted');
    END IF;
    RETURN NEW;
ENd
$$;
 +   DROP FUNCTION logs.log_language_changes();
       logs          postgres    false    11            ?           1255    19924    log_level_changes()    FUNCTION     I  CREATE FUNCTION logs.log_level_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    if tg_op::varchar = 'INSERT' THEN
        INSERT INTO logs.level_audits_table(level_id, dml_type, dml_time_stamp)
        VALUES (NEW.id, tg_op::varchar, now());
        RETURN NEW;
    end if;
    if tg_op::varchar = 'DELETE' THEN
        INSERT INTO logs.level_audits_table(level_id, dml_type, dml_time_stamp)
        VALUES (old.id, tg_op::varchar, now());
        RETURN old;
    end if;
    IF NEW.level_name <> OLD.level_name THEN
        INSERT INTO logs.level_audits_table(level_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                            dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'level_name');
    END IF;
    IF NEW.power <> OLD.power THEN
        INSERT INTO logs.level_audits_table(level_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                            dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new),
                tg_op::varchar, now(),
                old.updated_by, 'power');
    END IF;
    IF NEW.category_id <> OLD.category_id THEN
        INSERT INTO logs.level_audits_table(level_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                            dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'level_name');
    END IF;
    RETURN NEW;
ENd
$$;
 (   DROP FUNCTION logs.log_level_changes();
       logs          postgres    false    11            ?           1255    19948    log_question_changes()    FUNCTION     ?	  CREATE FUNCTION logs.log_question_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    if tg_op::varchar = 'INSERT' THEN
        INSERT INTO logs.question_audits_table(question_id, dml_type, dml_time_stamp)
        VALUES (NEW.id, tg_op::varchar, now());
        call helper.set_correct_answers_on_question(new.id);
        RETURN NEW;
    end if;
    if tg_op::varchar = 'DELETE' THEN
        INSERT INTO logs.question_audits_table(question_id, dml_type, dml_time_stamp)
        VALUES (old.id, tg_op::varchar, now());
        RETURN old;
    end if;
    IF NEW.question_body <> OLD.question_body THEN
        INSERT INTO logs.question_audits_table(question_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                               dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'question_body');
    END IF;
    IF NEW.level_id <> OLD.level_id THEN
        INSERT INTO logs.question_audits_table(question_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                               dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new),
                tg_op::varchar, now(),
                old.updated_by, 'level_id');
    END IF;
    IF NEW.is_deleted <> OLD.is_deleted THEN
        INSERT INTO logs.question_audits_table(question_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                               dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new),
                tg_op::varchar, now(),
                old.updated_by, 'is_deleted');
    END IF;
    IF NEW.category_id <> OLD.category_id THEN
        INSERT INTO logs.question_audits_table(question_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                               dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'category_id');
    END IF;
    IF NEW.correct_answers <> OLD.correct_answers THEN
        INSERT INTO logs.question_audits_table(question_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                               dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'correct_answers');
    END IF;

    RETURN NEW;
ENd
$$;
 +   DROP FUNCTION logs.log_question_changes();
       logs          postgres    false    11            ?           1255    19972    log_quiz_history_changes()    FUNCTION     g  CREATE FUNCTION logs.log_quiz_history_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    if tg_op::varchar = 'INSERT' THEN
        INSERT INTO logs.quiz_history_audits_table(quiz_history_id, dml_type, dml_time_stamp)
        VALUES (NEW.id, tg_op::varchar, now());
        RETURN NEW;
    end if;
    if tg_op::varchar = 'DELETE' THEN
        INSERT INTO logs.quiz_history_audits_table(quiz_history_id, dml_type, dml_time_stamp)
        VALUES (old.id, tg_op::varchar, now());
        RETURN old;
    end if;
    IF NEW.user_answers <> OLD.user_answers THEN
        INSERT INTO logs.quiz_history_audits_table(quiz_history_id, old_row_data, new_row_data, dml_type,
                                                   dml_time_stamp,
                                                   dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'user_answers');
    END IF;
    IF NEW.correct_answers <> OLD.correct_answers THEN
        INSERT INTO logs.quiz_history_audits_table(quiz_history_id, old_row_data, new_row_data, dml_type,
                                                   dml_time_stamp,
                                                   dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'correct_answers');
    END IF;
    IF NEW.is_deleted <> OLD.is_deleted THEN
        INSERT INTO logs.quiz_history_audits_table(quiz_history_id, old_row_data, new_row_data, dml_type,
                                                   dml_time_stamp,
                                                   dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new),
                tg_op::varchar, now(),
                old.updated_by, 'is_deleted');
    END IF;

    RETURN NEW;
ENd
$$;
 /   DROP FUNCTION logs.log_quiz_history_changes();
       logs          postgres    false    11            `           1255    19900    log_user_changes()    FUNCTION       CREATE FUNCTION logs.log_user_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    if tg_op::varchar = 'INSERT' THEN
        INSERT INTO logs.users_audits_table(user_id, dml_type, dml_time_stamp)
        VALUES (NEW.id, tg_op::varchar, now());
        RETURN NEW;
    end if;
    if tg_op::varchar = 'DELETE' THEN
        INSERT INTO logs.users_audits_table(user_id, dml_type, dml_time_stamp)
        VALUES (old.id, tg_op::varchar, now());
        RETURN old;
    end if;
    IF NEW.username <> OLD.username THEN
        INSERT INTO logs.users_audits_table(user_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                            dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'USERNAME');
    END IF;
    --todo password should encoded with Elshod's method
    IF NEW.password <> OLD.password THEN
        INSERT INTO logs.users_audits_table(user_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                            dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'password');
    END IF;
    IF NEW.fullname <> OLD.fullname THEN
        INSERT INTO logs.users_audits_table(user_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                            dml_created_by, row_name)
        VALUES (old.id,row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'fullName');
    END IF;
    IF NEW.email <> OLD.email THEN
        INSERT INTO logs.users_audits_table(user_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                            dml_created_by, row_name)
        VALUES (old.id,row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'email');
    END IF;
    IF NEW.role <> OLD.role THEN
        INSERT INTO logs.users_audits_table(user_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                            dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar,
                now(), old.updated_by,
                'role');
    END IF;
    IF NEW.is_deleted <> OLD.is_deleted THEN
        INSERT INTO logs.users_audits_table(user_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                            dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'isdeleted');
    END IF;
    IF NEW.language_id <> OLD.language_id THEN
        INSERT INTO logs.users_audits_table(user_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                            dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'language_id');
    END IF;

    RETURN NEW;
ENd
$$;
 '   DROP FUNCTION logs.log_user_changes();
       logs          postgres    false    11            ?           1255    19960    log_variant_changes()    FUNCTION     q  CREATE FUNCTION logs.log_variant_changes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    if tg_op::varchar = 'INSERT' THEN
        INSERT INTO logs.variant_audits_table(variant_id, dml_type, dml_time_stamp)
        VALUES (NEW.id, tg_op::varchar, now());
        RETURN NEW;
    end if;
    if tg_op::varchar = 'DELETE' THEN
        INSERT INTO logs.variant_audits_table(variant_id, dml_type, dml_time_stamp)
        VALUES (old.id, tg_op::varchar, now());
        RETURN old;
    end if;
    IF NEW.body <> OLD.body THEN
        INSERT INTO logs.variant_audits_table(variant_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                              dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new), tg_op::varchar, now(),
                old.updated_by, 'body');
    END IF;
    IF NEW.is_correct <> OLD.is_correct THEN
        INSERT INTO logs.variant_audits_table(variant_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                              dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new),
                tg_op::varchar, now(),
                old.updated_by, 'is_correct');
    END IF;
    IF NEW.is_deleted <> OLD.is_deleted THEN
        INSERT INTO logs.variant_audits_table(variant_id, old_row_data, new_row_data, dml_type, dml_time_stamp,
                                              dml_created_by, row_name)
        VALUES (old.id, row_to_json(old),row_to_json(new),
                tg_op::varchar, now(),
                old.updated_by, 'is_deleted');
    END IF;

    RETURN NEW;
ENd
$$;
 *   DROP FUNCTION logs.log_variant_changes();
       logs          postgres    false    11            d           1255    19771 !   json_to_create_language_dto(json)    FUNCTION       CREATE FUNCTION mapper.json_to_create_language_dto(json_data json) RETURNS utils.create_language_dto
    LANGUAGE plpgsql
    AS $$
DECLARE
    data utils.create_language_dto;
BEGIN
    data.code := json_data ->> 'code';
    data.name := json_data ->> 'name';
    return data;
END
$$;
 B   DROP FUNCTION mapper.json_to_create_language_dto(json_data json);
       mapper          postgres    false    1097    8            ?           1255    29087    json_to_create_user_dto(json)    FUNCTION     ?  CREATE FUNCTION mapper.json_to_create_user_dto(json_data json) RETURNS utils.create_user_dto
    LANGUAGE plpgsql
    AS $$
DECLARE
    data utils.create_user_dto;
BEGIN
    data.full_name := json_data ->> 'full_name';
    data.username := json_data ->> 'username';
    data.email := json_data ->> 'email';
    data.password := json_data ->> 'password';
    data.language_id := json_data ->> 'language_id';
    data.role := json_data ->> 'role';
    return data;
END
$$;
 >   DROP FUNCTION mapper.json_to_create_user_dto(json_data json);
       mapper          postgres    false    8    1187            ?           1255    19979    json_to_get_test(text)    FUNCTION     ?  CREATE FUNCTION mapper.json_to_get_test(dataparam text) RETURNS utils.get_test
    LANGUAGE plpgsql
    AS $$
DECLARE
    dataJson json;
    dto      utils.get_test;
BEGIN
    dataJson := dataparam::json;
    dto.category_id := dataJson ->> 'category_id';
    dto.level_id := dataJson ->> 'level_id';
    dto.number_of_questions := dataJson ->> 'number_of_questions';

    return dto;
end;
$$;
 7   DROP FUNCTION mapper.json_to_get_test(dataparam text);
       mapper          postgres    false    1130    8            |           1255    19777 !   json_to_update_language_dto(json)    FUNCTION     @  CREATE FUNCTION mapper.json_to_update_language_dto(json_data json) RETURNS utils.update_language_dto
    LANGUAGE plpgsql
    AS $$
DECLARE
    data utils.update_language_dto;
BEGIN
    data.id := json_data ->> 'id';
    data.name := json_data ->> 'name';
    data.code := json_data ->> 'code';
    return data;
END
$$;
 B   DROP FUNCTION mapper.json_to_update_language_dto(json_data json);
       mapper          postgres    false    1100    8            _           1255    19674    json_to_update_user_dto(json)    FUNCTION     ?  CREATE FUNCTION mapper.json_to_update_user_dto(json_data json) RETURNS utils.update_user_dto
    LANGUAGE plpgsql
    AS $$
DECLARE
    data utils.update_user_dto;
BEGIN
    data.id := json_data ->> 'id';
    data.full_name := json_data ->> 'full_name';
    data.username := json_data ->> 'username';
    data.email := json_data ->> 'email';
    data.password := json_data ->> 'password';
    data.language_id := json_data ->> 'language_id';
    data.role := json_data ->> 'role';
    return data;
END
$$;
 >   DROP FUNCTION mapper.json_to_update_user_dto(json_data json);
       mapper          postgres    false    8    1094            O           1255    19283    level_to_create_dto(text)    FUNCTION     s  CREATE FUNCTION mapper.level_to_create_dto(dataparam text DEFAULT NULL::text) RETURNS utils.level_create_dto
    LANGUAGE plpgsql
    AS $$
DECLARE
    dataJson json;
    dto      utils.level_create_dto;
BEGIN


    dataJson := dataparam::json;
    dto.level_name := dataJson ->> 'level_name';
    dto.category_id := dataJson ->> 'category_id';

    return dto;
end;
$$;
 :   DROP FUNCTION mapper.level_to_create_dto(dataparam text);
       mapper          postgres    false    1082    8            j           1255    19310    level_to_update_dto(text)    FUNCTION     ?  CREATE FUNCTION mapper.level_to_update_dto(dataparam text DEFAULT NULL::text) RETURNS utils.level_update_dto
    LANGUAGE plpgsql
    AS $$
DECLARE
    dataJson json;
    dto      utils.level_update_dto;
BEGIN


    dataJson := dataparam::json;
    dto.level_name := dataJson ->> 'level_name';
    dto.level_id := dataJson ->> 'level_id';
    dto.power := dataJson ->> 'order';

    return dto;
end;
$$;
 :   DROP FUNCTION mapper.level_to_update_dto(dataparam text);
       mapper          postgres    false    1085    8            3           1255    19263    to_category_create_dto(text)    FUNCTION     ?  CREATE FUNCTION mapper.to_category_create_dto(dataparam text DEFAULT NULL::text) RETURNS utils.category_create_dto
    LANGUAGE plpgsql
    AS $$
DECLARE
    dataJson json;
    dto      utils.category_create_dto;
BEGIN
    dataJson := dataparam::json;
    dto.category_name := dataJson ->> 'category_name';
    dto.language_id := dataJson ->> 'language_id';

    return dto;
end;
$$;
 =   DROP FUNCTION mapper.to_category_create_dto(dataparam text);
       mapper          postgres    false    8    1076            Y           1255    19273 $   to_category_update_dto(text, bigint)    FUNCTION     ?  CREATE FUNCTION mapper.to_category_update_dto(dataparam text, i_user_id bigint DEFAULT NULL::bigint) RETURNS utils.category_update_dto
    LANGUAGE plpgsql
    AS $$
DECLARE
    dataJson json;
    dto      utils.category_update_dto;
BEGIN
    dataJson := dataparam::json;
    dto.category_name := dataJson->>'category_name';
    dto.category_id := dataJson->>'category_id';

    return dto;
end;
$$;
 O   DROP FUNCTION mapper.to_category_update_dto(dataparam text, i_user_id bigint);
       mapper          postgres    false    1079    8            m           1255    19250    to_question_create_dto(jsonb)    FUNCTION     ?  CREATE FUNCTION mapper.to_question_create_dto(dataparam jsonb) RETURNS utils.question_create_dto
    LANGUAGE plpgsql
    AS $$
declare
    dto           utils.question_create_dto;
    questionJsonb jsonb;
    variantJsonb  jsonb;
    questions     jsonb ;
    variants      jsonb;


begin

    questions := dataparam -> 'questions';
    variants := dataparam -> 'variants';


    for questionJsonb in select jsonb_array_elements(questions)
        loop
            dto.questions := array_append(dto.questions, mapper.to_question_create(questionJsonb));
        end loop;

    for variantJsonb in select jsonb_array_elements(variants)
        loop
            dto.variants := array_append(dto.variants, mapper.to_variant_create(variantJsonb));
        end loop;


    dto.questions := array_remove(dto.questions, null);
    dto.variants := array_remove(dto.variants, null);


    if array_length(dto.questions, 1) = 0 then
        return null;
    end if;

    if array_length(dto.variants, 1) = 0 then
        dto.variants = null;
    end if;

    raise info '%',dto.questions;
    return dto;

exception
    when others
        then
            return dto;


end
$$;
 >   DROP FUNCTION mapper.to_question_create_dto(dataparam jsonb);
       mapper          postgres    false    1073    8            o           1255    19322    to_question_update_dto(jsonb)    FUNCTION     i  CREATE FUNCTION mapper.to_question_update_dto(dataparam jsonb) RETURNS utils.question_update_dto
    LANGUAGE plpgsql
    AS $$
declare
    dto utils.question_update_dto;
begin

    dto.level_id := dataparam ->> 'level_id';
    dto.question_body := dataparam ->> 'question_body';
    dto.question_id := dataparam ->> 'question_id';

    return dto;


end


$$;
 >   DROP FUNCTION mapper.to_question_update_dto(dataparam jsonb);
       mapper          postgres    false    1088    8            ~           1255    19788 !   to_quiz_history_create_dto(jsonb)    FUNCTION     ?  CREATE FUNCTION mapper.to_quiz_history_create_dto(dataparam jsonb DEFAULT NULL::jsonb) RETURNS utils.quiz_create_dto[]
    LANGUAGE plpgsql
    AS $$
DECLARE
    dataJson  json;
    dto_array utils.quiz_create_dto[];
    dto       utils.quiz_create_dto;
    quizJsonb jsonb;
    quizzes   jsonb;
BEGIN


    --     quizzes := dataparam;

    raise warning '%',quizzes;


    for quizJsonb in select jsonb_array_elements(dataparam)
        loop
        
            raise warning '%',quizJsonb;
            dto_array = array_append(dto_array, mapper.to_quiz_history_dto(quizJsonb));
        end loop;


    raise info '%m dto array',dto_array;

    return dto_array;

end;
$$;
 B   DROP FUNCTION mapper.to_quiz_history_create_dto(dataparam jsonb);
       mapper          postgres    false    8    1103            ?           1255    19787    to_quiz_history_dto(jsonb)    FUNCTION     <  CREATE FUNCTION mapper.to_quiz_history_dto(dataparam jsonb DEFAULT NULL::jsonb) RETURNS utils.quiz_create_dto
    LANGUAGE plpgsql
    AS $$
DECLARE
    dto utils.quiz_create_dto;

BEGIN
    dto.question_id := dataparam ->> 'question_id';
    dto.user_answers:=dataparam->>'user_answers';


    return dto;
end;
$$;
 ;   DROP FUNCTION mapper.to_quiz_history_dto(dataparam jsonb);
       mapper          postgres    false    1103    8            ?           1255    19241    to_variant_create(jsonb)    FUNCTION     ?  CREATE FUNCTION mapper.to_variant_create(dataparam jsonb) RETURNS utils.variant_create
    LANGUAGE plpgsql
    AS $$
declare
    dto utils.variant_create;
begin


    dto.question_id := dataparam ->> 'question_id';
    dto.variant_body := dataparam ->> 'variant_body';
    dto.is_correct := dataparam ->> 'is_correct';
    dto.created_by := dataparam ->> 'created_by';

    if dto.question_id is null then
        return null;
    end if;

    return dto;


end;
$$;
 9   DROP FUNCTION mapper.to_variant_create(dataparam jsonb);
       mapper          postgres    false    1070    8            l           1255    19578    to_variant_update_dto(jsonb)    FUNCTION     d  CREATE FUNCTION mapper.to_variant_update_dto(dataparam jsonb) RETURNS utils.variant_update_dto
    LANGUAGE plpgsql
    AS $$
declare
    dto utils.variant_update_dto;
begin

    dto.is_correct := dataparam ->> 'is_correct';
    dto.variant_body := dataparam ->> 'variant_body';
    dto.variant_id := dataparam ->> 'variant_id';

    return dto;


end
$$;
 =   DROP FUNCTION mapper.to_variant_update_dto(dataparam jsonb);
       mapper          postgres    false    8    1091            N           1255    19311    to_variants(jsonb)    FUNCTION     q  CREATE FUNCTION mapper.to_variants(dataparam jsonb) RETURNS utils.variant_create[]
    LANGUAGE plpgsql
    AS $$
declare
    dto_arr      utils.variant_create[];
    variantJsonb jsonb;
    variants     jsonb;

begin

    call helper.check_dataparam(dataparam::text);
    variants := dataparam;

    for variantJsonb in select jsonb_array_elements(variants)
        loop
            dto_arr := array_append(dto_arr, mapper.to_variant_create(variantJsonb));
        end loop;

    dto_arr := array_remove(dto_arr, null);

    if array_length(dto_arr, 1) = 0 then
        return null;
    end if;

    return dto_arr;
end
$$;
 3   DROP FUNCTION mapper.to_variants(dataparam jsonb);
       mapper          postgres    false    1070    8            ?           1255    20541 0   auth_login(character varying, character varying)    FUNCTION     9  CREATE FUNCTION quizapp.auth_login(uname character varying DEFAULT NULL::character varying, pswd character varying DEFAULT NULL::character varying) RETURNS text
    LANGUAGE plpgsql
    AS $$
declare
    t_user record;
begin

    select * into t_user from quizapp.auth_user t where t.username = lower(uname);

    if not FOUND then
        raise exception using message = 'Bad credentials',
            detail = concat_ws(' ', 'Username', uname, 'already taken');
    end if;

    if utils.match_password(pswd, t_user.password) is false then
        raise exception 'Bad credentials';
    end if;
    return json_build_object('id', t_user.id,
                             'username', t_user.username,
                             'language', t_user.language,
                             'role', t_user.role)::text;

end
$$;
 S   DROP FUNCTION quizapp.auth_login(uname character varying, pswd character varying);
       quizapp          postgres    false    12            ?           1255    20542    auth_register(text)    FUNCTION     6  CREATE FUNCTION quizapp.auth_register(dataparam text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
    newId    int4;
    dataJson json;
    t_user   record;
    dto      quizapp.user_register_dto;
begin
    if dataparam isnull or dataparam = '{}'::text then
        raise exception 'Data param can not be null';
    end if;

    dataJson := dataparam::json;
    dto.username := dataJson ->> 'username';
    dto.password := dataJson ->> 'password';
    dto.language := upper(dataJson ->> 'language');

    if dto.username is null or trim(dto.username) = '' then
        raise exception 'Username is invalid';
    end if;

    select *
    into t_user
    from quizapp.auth_user t
    where t.username = lower(dto.username);

    if FOUND then
        raise using message = 'User already exists';
    end if;

    if dto.password is null or trim(dto.password) = '' then
        raise exception 'Password is invalid';
    end if;

    if not exists(select * from quizapp.language l where l.code = dto.language) then
        dto.language := 'UZ';
    end if;

    dto.role := 'USER';

    insert into auth_user (username, password, role, language)
    values (dto.username,
            utils.encode_password(dto.password),
            dto.role,
            dto.language)
    returning id into newId;

    return newId;
end
$$;
 5   DROP FUNCTION quizapp.auth_register(dataparam text);
       quizapp          postgres    false    12            ?           1255    20543 #   get_quiz_question(integer, integer)    FUNCTION     ?  CREATE FUNCTION quizapp.get_quiz_question(quizid integer, userid integer) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
declare
    questionJson jsonb;
begin
    questionJson := jsonb_agg(jsonb_build_object(
                            'questionInfo', quizapp.questionInfo(qq.question_id)
                        ))
                    from quizapp.quiz_question qq
                             inner join quizapp.quiz q on q.id = qq.quiz_id
                    where qq.quiz_id = quizid
                      and q.user_id = userid
                      and qq.correct is null
                    order by random()
                    limit 1;
    return questionJson;
end
$$;
 I   DROP FUNCTION quizapp.get_quiz_question(quizid integer, userid integer);
       quizapp          postgres    false    12            ?           1255    20544 &   hasanyrole(character varying, integer)    FUNCTION     @  CREATE FUNCTION quizapp.hasanyrole(roles character varying, userid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
begin
    return exists(select *
                  from quizapp.auth_user u
                  where u.id = userid
                    and u.role = any (regexp_split_to_array(roles, '#')));
end
$$;
 K   DROP FUNCTION quizapp.hasanyrole(roles character varying, userid integer);
       quizapp          postgres    false    12            ?           1255    20545 #   hasrole(character varying, integer)    FUNCTION       CREATE FUNCTION quizapp.hasrole(role character varying, userid integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare
    r_user record;
begin
    select * into r_user from quizapp.auth_user u where u.id = userid;
    return FOUND and r_user.role = role;
end
$$;
 G   DROP FUNCTION quizapp.hasrole(role character varying, userid integer);
       quizapp          postgres    false    12            ?           1255    20546    isactive(integer) 	   PROCEDURE     $  CREATE PROCEDURE quizapp.isactive(IN userid integer)
    LANGUAGE plpgsql
    AS $$
declare
    t_user record;
BEGIN

    select * into t_user from quizapp.auth_user t where t.id = userid;
    if not FOUND then
        raise exception 'User not found by id : "%"',userid;
    end if;
END
$$;
 4   DROP PROCEDURE quizapp.isactive(IN userid integer);
       quizapp          postgres    false    12            ?           1255    20547 -   isblank(character varying, character varying) 	   PROCEDURE     ;  CREATE PROCEDURE quizapp.isblank(IN param character varying, IN message character varying DEFAULT NULL::character varying)
    LANGUAGE plpgsql
    AS $$
declare
begin

    if param is null or trim(param::varchar) = '' then
        raise '%', coalesce(message, concat('Invalid input ', param));
    end if;
end
$$;
 Z   DROP PROCEDURE quizapp.isblank(IN param character varying, IN message character varying);
       quizapp          postgres    false    12            ?           1255    20548    level_create(text, integer)    FUNCTION     `  CREATE FUNCTION quizapp.level_create(dataparam text, userid integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
declare
    dataJson json;
    dto      quizapp.level_create_dto;
begin

    call quizapp.isactive(userid);
    call quizapp.isBlank(dataparam);
        
    if not quizapp.hasAnyRole('ADMIN#TEACHER', userid) then
        raise 'Permission denied';
    end if;

    dataJson := dataparam::json;
    dto.code = dataJson ->> 'code';
    dto.subject = dataJson ->> 'subject';
    dto.translations = dataJson ->> 'translations';

    call quizapp.isBlank(dto.code);
    call quizapp.isBlank(dto.subject);
    call quizapp.isBlank(dto.translations::text);

    insert into quizapp.level values (dto.code,
                                      dto.subject,
                                      dto.translations);
    return dto.code;
end;
$$;
 D   DROP FUNCTION quizapp.level_create(dataparam text, userid integer);
       quizapp          postgres    false    12            ?           1255    20549 +   question_create(character varying, integer)    FUNCTION       CREATE FUNCTION quizapp.question_create(dataparam character varying, userid integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
    dataJson  json;
    dto       quizapp.question_create_dto;
    r_subject record;
    newID     int;
begin
    call quizapp.isblank(dataparam,'Data param can not be null');
    call quizapp.isactive(userid);

    if not quizapp.hasanyrole('ADMIN#TEACHER', userid) then
        raise 'Permission denied';
    end if;

    dataJson := dataparam::json;
    dto.title := dataJson ->> 'title';
    dto.subject := upper(dataJson ->> 'subject');
    dto.translations := upper(dataJson ->> 'translations');
    dto.choices := dataJson ->> 'choices';
    ------------- check --------------
    select * into r_subject from quizapp.subject s where s.code = dto.subject;

    if not FOUND then
        raise 'Subject not found by code "%"',dto.subject;
    end if;

    call quizapp.isblank(dto.title);
    call quizapp.isblank(dto.subject);
    call quizapp.isblank(dto.choices::text);


    insert into quizapp.question (subject, title, level, translations)
    values (dto.subject, dto.title, dto.level, dto.translations)
    returning id into newID;


    insert into quizapp.answer (question_id, choices)
    values (newID, dto.choices);

    return newID;
end;
$$;
 T   DROP FUNCTION quizapp.question_create(dataparam character varying, userid integer);
       quizapp          postgres    false    12            ?           1255    20550    questioninfo(integer)    FUNCTION     
  CREATE FUNCTION quizapp.questioninfo(questionid integer) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
declare
    r_question record;
begin
    select q.title, a.choices
    into r_question
    from quizapp.question q
             inner join quizapp.answer a on q.id = a.question_id
    where q.id = questionid
      and a.question_id = questionid;
    if FOUND then
        return row_to_json(X)::jsonb
            FROM (SELECT r_question.title, r_question.choices) AS X;
    else
        return null;
    end if;
end
$$;
 8   DROP FUNCTION quizapp.questioninfo(questionid integer);
       quizapp          postgres    false    12            ?           1255    20551    quiz_generate(text, integer)    FUNCTION       CREATE FUNCTION quizapp.quiz_generate(dataparam text DEFAULT NULL::text, userid integer DEFAULT NULL::integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
    dataJson   json;
    dto        quizapp.quiz_generate_dto;
    quizid     integer;
    questionid integer;
BEGIN
    call quizapp.isactive(userid);
    call quizapp.isblank(dataparam);
    dataJson := dataparam::json;

    dto.language := dataJson ->> 'language';
    dto.subject := dataJson ->> 'subject';
    dto.level := dataJson ->> 'level';
    dto.questioncount := dataJson ->> 'questioncount';

    call quizapp.isblank(dto.language);
    call quizapp.isblank(dto.subject);
    call quizapp.isblank(dto.level);
    call quizapp.isblank(dto.questioncount::varchar);

    if (select count(*) from quizapp.question where subject = dto.subject and level = dto.level) <
       dto.questioncount then
        raise 'number of questions is not enough';
    end if;

    insert into quizapp.quiz(user_id, subject, level, language, total_question_count)
    values (userid, dto.subject, dto.level, dto.language, dto.questioncount)
    returning id into quizid;

    for questionid in (select id
                       from quizapp.question
                       where subject = dto.subject
                         and level = dto.level
                       order by random()
                       limit dto.questioncount)
        loop
            insert into quizapp.quiz_question(quiz_id, question_id)
            values (quizid, questionid);
        end loop;

    return quizid;
END
$$;
 E   DROP FUNCTION quizapp.quiz_generate(dataparam text, userid integer);
       quizapp          postgres    false    12            ?           1255    20552    subject_create(text, integer)    FUNCTION     e  CREATE FUNCTION quizapp.subject_create(dataparam text, userid integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
declare
    dataJson json;
    dto      quizapp.subject_create_dto;
begin

    call quizapp.isblank(dataparam, 'Dataparam can not ber empty or null');
    call quizapp.isactive(userid);

    if not quizapp.hasAnyRole('ADMIN#TEACHER', userid) then
        raise 'Permission denied';
    end if;


    dataJson := dataparam::json;
    dto.code := upper(dataJson ->> 'code');
    dto.name := dataJson ->> 'name';
    dto.translations := dataJson ->> 'translations';

    call quizapp.isblank(dto.code);
    call quizapp.isblank(dto.name);
    call quizapp.isblank(dto.translations::text);


    if dto.translations = '{}'::jsonb then
        raise 'Subject must have at least one translation';
    end if;


    if exists(select * from quizapp.subject s where s.code = dto.code) then
        raise 'Subject with code "%" already created',dto.code;
    end if;

    insert into quizapp.subject (code, name, translations)
    values (dto.code, dto.name, dto.translations);
    return dto.code;
end
$$;
 F   DROP FUNCTION quizapp.subject_create(dataparam text, userid integer);
       quizapp          postgres    false    12            ?           1255    20553    teacher_create(text, integer)    FUNCTION     ?  CREATE FUNCTION quizapp.teacher_create(dataparam text, userid integer) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
declare
    dataJson json;
    dto      quizapp.user_register_dto;
    r_user   record;
    newId    int4;
begin

    call quizapp.isactive(userid);
    
    if dataparam isnull or dataparam = '{}'::text then
        raise exception 'Data param can not be null';
    end if;

    if not hasRole('ADMIN', userid) then
        raise 'Permission denied';
    end if;

    dataJson := dataparam::json;
    dto.username := dataJson ->> 'username';
    dto.password := dataJson ->> 'password';
    dto.language := upper(dataJson ->> 'language');
    dto.role := 'TEACHER';

    if dto.username is null or trim(dto.username) = '' then
        raise exception 'Username is invalid';
    end if;

    select *
    into r_user
    from quizapp.auth_user t
    where t.username = lower(dto.username);

    if FOUND then
        raise 'User already exists with username "%"',dto.username;
    end if;

    if dto.password is null or trim(dto.password) = '' then
        raise exception 'Password is invalid';
    end if;

    if not exists(select * from quizapp.language l where l.code = dto.language) then
        dto.language := 'UZ';
    end if;

    insert into auth_user (username, password, role, language)
    values (dto.username,
            utils.encode_password(dto.password),
            dto.role,
            dto.language)
    returning id into newId;

    return newId;


end
$$;
 F   DROP FUNCTION quizapp.teacher_create(dataparam text, userid integer);
       quizapp          postgres    false    12            ?            1259    19903    category_audits_table    TABLE     ?  CREATE TABLE logs.category_audits_table (
    id bigint NOT NULL,
    category_id smallint NOT NULL,
    old_row_data text,
    new_row_data text,
    dml_type character varying(10) NOT NULL,
    dml_time_stamp timestamp without time zone NOT NULL,
    dml_created_by bigint,
    row_name character varying,
    CONSTRAINT category_audits_table_dml_type_check CHECK (((dml_type)::text = ANY ((ARRAY['INSERT'::character varying, 'DELETE'::character varying, 'UPDATE'::character varying])::text[])))
);
 '   DROP TABLE logs.category_audits_table;
       logs         heap    postgres    false    11            ?            1259    19902    category_audits_table_id_seq    SEQUENCE     ?   CREATE SEQUENCE logs.category_audits_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE logs.category_audits_table_id_seq;
       logs          postgres    false    250    11            ?           0    0    category_audits_table_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE logs.category_audits_table_id_seq OWNED BY logs.category_audits_table.id;
          logs          postgres    false    249            ?            1259    19927    language_audits_table    TABLE     ?  CREATE TABLE logs.language_audits_table (
    id bigint NOT NULL,
    language_id smallint NOT NULL,
    old_row_data text,
    new_row_data text,
    dml_type character varying(10) NOT NULL,
    dml_time_stamp timestamp without time zone NOT NULL,
    dml_created_by bigint,
    row_name character varying,
    CONSTRAINT language_audits_table_dml_type_check CHECK (((dml_type)::text = ANY ((ARRAY['INSERT'::character varying, 'DELETE'::character varying, 'UPDATE'::character varying])::text[])))
);
 '   DROP TABLE logs.language_audits_table;
       logs         heap    postgres    false    11            ?            1259    19926    language_audits_table_id_seq    SEQUENCE     ?   CREATE SEQUENCE logs.language_audits_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE logs.language_audits_table_id_seq;
       logs          postgres    false    254    11            @           0    0    language_audits_table_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE logs.language_audits_table_id_seq OWNED BY logs.language_audits_table.id;
          logs          postgres    false    253            ?            1259    19915    level_audits_table    TABLE     ?  CREATE TABLE logs.level_audits_table (
    id bigint NOT NULL,
    level_id integer NOT NULL,
    old_row_data text,
    new_row_data text,
    dml_type character varying(10) NOT NULL,
    dml_time_stamp timestamp without time zone NOT NULL,
    dml_created_by bigint,
    row_name character varying,
    CONSTRAINT level_audits_table_dml_type_check CHECK (((dml_type)::text = ANY ((ARRAY['INSERT'::character varying, 'DELETE'::character varying, 'UPDATE'::character varying])::text[])))
);
 $   DROP TABLE logs.level_audits_table;
       logs         heap    postgres    false    11            ?            1259    19914    level_audits_table_id_seq    SEQUENCE     ?   CREATE SEQUENCE logs.level_audits_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE logs.level_audits_table_id_seq;
       logs          postgres    false    11    252            A           0    0    level_audits_table_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE logs.level_audits_table_id_seq OWNED BY logs.level_audits_table.id;
          logs          postgres    false    251                        1259    19939    question_audits_table    TABLE     ?  CREATE TABLE logs.question_audits_table (
    id bigint NOT NULL,
    question_id bigint NOT NULL,
    old_row_data text,
    new_row_data text,
    dml_type character varying(10) NOT NULL,
    dml_time_stamp timestamp without time zone NOT NULL,
    dml_created_by bigint,
    row_name character varying,
    CONSTRAINT question_audits_table_dml_type_check CHECK (((dml_type)::text = ANY ((ARRAY['INSERT'::character varying, 'DELETE'::character varying, 'UPDATE'::character varying])::text[])))
);
 '   DROP TABLE logs.question_audits_table;
       logs         heap    postgres    false    11            ?            1259    19938    question_audits_table_id_seq    SEQUENCE     ?   CREATE SEQUENCE logs.question_audits_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE logs.question_audits_table_id_seq;
       logs          postgres    false    11    256            B           0    0    question_audits_table_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE logs.question_audits_table_id_seq OWNED BY logs.question_audits_table.id;
          logs          postgres    false    255                       1259    19963    quiz_history_audits_table    TABLE     ?  CREATE TABLE logs.quiz_history_audits_table (
    id bigint NOT NULL,
    quiz_history_id bigint NOT NULL,
    old_row_data text,
    new_row_data text,
    dml_type character varying(10) NOT NULL,
    dml_time_stamp timestamp without time zone NOT NULL,
    dml_created_by bigint,
    row_name character varying,
    CONSTRAINT quiz_history_audits_table_dml_type_check CHECK (((dml_type)::text = ANY ((ARRAY['INSERT'::character varying, 'DELETE'::character varying, 'UPDATE'::character varying])::text[])))
);
 +   DROP TABLE logs.quiz_history_audits_table;
       logs         heap    postgres    false    11                       1259    19962     quiz_history_audits_table_id_seq    SEQUENCE     ?   CREATE SEQUENCE logs.quiz_history_audits_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE logs.quiz_history_audits_table_id_seq;
       logs          postgres    false    260    11            C           0    0     quiz_history_audits_table_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE logs.quiz_history_audits_table_id_seq OWNED BY logs.quiz_history_audits_table.id;
          logs          postgres    false    259            ?            1259    19891    users_audits_table    TABLE     ?  CREATE TABLE logs.users_audits_table (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    old_row_data text,
    new_row_data text,
    dml_type character varying(10) NOT NULL,
    dml_time_stamp timestamp with time zone NOT NULL,
    dml_created_by bigint,
    row_name character varying,
    CONSTRAINT users_audits_table_dml_type_check CHECK (((dml_type)::text = ANY ((ARRAY['INSERT'::character varying, 'DELETE'::character varying, 'UPDATE'::character varying])::text[])))
);
 $   DROP TABLE logs.users_audits_table;
       logs         heap    postgres    false    11            ?            1259    19890    users_audits_table_id_seq    SEQUENCE     ?   CREATE SEQUENCE logs.users_audits_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE logs.users_audits_table_id_seq;
       logs          postgres    false    11    248            D           0    0    users_audits_table_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE logs.users_audits_table_id_seq OWNED BY logs.users_audits_table.id;
          logs          postgres    false    247                       1259    19951    variant_audits_table    TABLE     ?  CREATE TABLE logs.variant_audits_table (
    id bigint NOT NULL,
    variant_id bigint NOT NULL,
    old_row_data text,
    new_row_data text,
    dml_type character varying(10) NOT NULL,
    dml_time_stamp timestamp without time zone NOT NULL,
    dml_created_by bigint,
    row_name character varying,
    CONSTRAINT variant_audits_table_dml_type_check CHECK (((dml_type)::text = ANY ((ARRAY['INSERT'::character varying, 'DELETE'::character varying, 'UPDATE'::character varying])::text[])))
);
 &   DROP TABLE logs.variant_audits_table;
       logs         heap    postgres    false    11                       1259    19950    variant_audits_table_id_seq    SEQUENCE     ?   CREATE SEQUENCE logs.variant_audits_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE logs.variant_audits_table_id_seq;
       logs          postgres    false    258    11            E           0    0    variant_audits_table_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE logs.variant_audits_table_id_seq OWNED BY logs.variant_audits_table.id;
          logs          postgres    false    257            ?            1259    19195    category_id_seq    SEQUENCE     w   CREATE SEQUENCE utils.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE utils.category_id_seq;
       utils          postgres    false    7            ?            1259    19034    category    TABLE     ?  CREATE TABLE public.category (
    id smallint DEFAULT nextval('utils.category_id_seq'::regclass) NOT NULL,
    category_name utils.no_null_length_zero_varchar,
    language_id smallint DEFAULT 1 NOT NULL,
    is_deleted smallint DEFAULT 0 NOT NULL,
    created_at timestamp(0) with time zone DEFAULT '2023-01-07 22:15:57.024598+05'::timestamp with time zone NOT NULL,
    created_by bigint NOT NULL,
    updated_at timestamp(0) with time zone,
    updated_by bigint
);
    DROP TABLE public.category;
       public         heap    postgres    false    228    1038            ?            1259    19197    language_id_seq    SEQUENCE     w   CREATE SEQUENCE utils.language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE utils.language_id_seq;
       utils          postgres    false    7            ?            1259    19081    language    TABLE     2  CREATE TABLE public.language (
    id smallint DEFAULT nextval('utils.language_id_seq'::regclass) NOT NULL,
    name utils.no_null_length_zero_varchar,
    code utils.no_null_length_zero_varchar,
    is_deleted smallint DEFAULT 0 NOT NULL,
    updated_by bigint,
    updated_at timestamp with time zone
);
    DROP TABLE public.language;
       public         heap    postgres    false    229    1038    1038            ?            1259    19199    level_id_seq    SEQUENCE     t   CREATE SEQUENCE utils.level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE utils.level_id_seq;
       utils          postgres    false    7            ?            1259    19045    level    TABLE     ?  CREATE TABLE public.level (
    id integer DEFAULT nextval('utils.level_id_seq'::regclass) NOT NULL,
    level_name utils.no_null_length_zero_varchar,
    category_id bigint NOT NULL,
    power integer DEFAULT 0,
    created_at timestamp(0) with time zone DEFAULT '2023-01-07 22:15:57.056467+05'::timestamp with time zone NOT NULL,
    created_by bigint NOT NULL,
    updated_at timestamp(0) with time zone,
    updated_by bigint,
    is_deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.level;
       public         heap    postgres    false    230    1038            ?            1259    19201    question_id_seq    SEQUENCE     w   CREATE SEQUENCE utils.question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE utils.question_id_seq;
       utils          postgres    false    7            ?            1259    19055    question    TABLE       CREATE TABLE public.question (
    id bigint DEFAULT nextval('utils.question_id_seq'::regclass) NOT NULL,
    category_id bigint NOT NULL,
    question_body text NOT NULL,
    level_id smallint NOT NULL,
    created_at timestamp(0) with time zone DEFAULT '2023-01-07 22:15:57.087037+05'::timestamp with time zone NOT NULL,
    created_by bigint NOT NULL,
    updated_at timestamp(0) with time zone,
    updated_by bigint,
    correct_answers smallint DEFAULT 0 NOT NULL,
    is_deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.question;
       public         heap    postgres    false    231            ?            1259    19203    quiz_history_id_seq    SEQUENCE     {   CREATE SEQUENCE utils.quiz_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE utils.quiz_history_id_seq;
       utils          postgres    false    7            ?            1259    19072    quiz_history    TABLE       CREATE TABLE public.quiz_history (
    id bigint DEFAULT nextval('utils.quiz_history_id_seq'::regclass) NOT NULL,
    user_id bigint NOT NULL,
    user_answers jsonb,
    correct_answers smallint,
    created_at timestamp(0) with time zone DEFAULT '2023-01-07 22:15:57.146394+05'::timestamp with time zone NOT NULL,
    updated_at timestamp(0) with time zone,
    updated_by bigint,
    is_deleted smallint DEFAULT 0,
    question_count smallint NOT NULL,
    started_at timestamp with time zone,
    finished_at timestamp with time zone
);
     DROP TABLE public.quiz_history;
       public         heap    postgres    false    232                       1259    28743    quiz_question    TABLE     ?   CREATE TABLE public.quiz_question (
    quiz_id bigint NOT NULL,
    question_id bigint NOT NULL,
    correct boolean,
    user_choices bigint[]
);
 !   DROP TABLE public.quiz_question;
       public         heap    postgres    false            ?            1259    19019    users    TABLE       CREATE TABLE public.users (
    id bigint DEFAULT nextval('utils.category_id_seq'::regclass) NOT NULL,
    username utils.no_null_length_zero_varchar,
    password utils.no_null_length_zero_varchar,
    fullname utils.no_null_length_zero_varchar,
    email utils.no_null_length_zero_varchar,
    role utils.user_role DEFAULT 'USER'::utils.user_role NOT NULL,
    is_deleted smallint DEFAULT 0 NOT NULL,
    created_at timestamp(0) with time zone DEFAULT '2023-01-07 22:15:56.950134+05'::timestamp with time zone NOT NULL,
    updated_at timestamp(0) with time zone,
    updated_by bigint,
    language_id smallint NOT NULL,
    CONSTRAINT users_email_check CHECK (((email)::text ~ '^(?=.{1,64}@)[A-Za-z0-9_-]+(\.[A-Za-z0-9_-]+)*@[^-][A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[A-Za-z]{2,})$'::text))
);
    DROP TABLE public.users;
       public         heap    postgres    false    228    1046    1046    1038    1038    1038    1038            ?            1259    19205    quiz_variants_id_seq    SEQUENCE     |   CREATE SEQUENCE utils.quiz_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE utils.quiz_variants_id_seq;
       utils          postgres    false    7            ?            1259    19063    variant    TABLE     ?  CREATE TABLE public.variant (
    id bigint DEFAULT nextval('utils.quiz_variants_id_seq'::regclass) NOT NULL,
    question_id bigint NOT NULL,
    body utils.no_null_length_zero_text,
    is_correct boolean DEFAULT false NOT NULL,
    created_at timestamp(0) with time zone DEFAULT now() NOT NULL,
    created_by bigint,
    updated_at timestamp(0) with time zone,
    updated_by bigint,
    is_deleted smallint DEFAULT 0 NOT NULL
);
    DROP TABLE public.variant;
       public         heap    postgres    false    233    1042                       1259    20554    answer    TABLE     ?   CREATE TABLE quizapp.answer (
    id integer NOT NULL,
    question_id integer,
    choices jsonb DEFAULT '[]'::jsonb NOT NULL,
    CONSTRAINT answer_choices_count_check CHECK ((jsonb_array_length(choices) > 0))
);
    DROP TABLE quizapp.answer;
       quizapp         heap    postgres    false    12                       1259    20561    answer_id_seq    SEQUENCE     ?   CREATE SEQUENCE quizapp.answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE quizapp.answer_id_seq;
       quizapp          postgres    false    12    268            F           0    0    answer_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE quizapp.answer_id_seq OWNED BY quizapp.answer.id;
          quizapp          postgres    false    269                       1259    20562 	   auth_role    TABLE     m   CREATE TABLE quizapp.auth_role (
    code character varying NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE quizapp.auth_role;
       quizapp         heap    postgres    false    12                       1259    20567 	   auth_user    TABLE     ?   CREATE TABLE quizapp.auth_user (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    role character varying,
    language character varying
);
    DROP TABLE quizapp.auth_user;
       quizapp         heap    postgres    false    12                       1259    20572    auth_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE quizapp.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE quizapp.auth_user_id_seq;
       quizapp          postgres    false    271    12            G           0    0    auth_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE quizapp.auth_user_id_seq OWNED BY quizapp.auth_user.id;
          quizapp          postgres    false    272                       1259    20573    language    TABLE     c   CREATE TABLE quizapp.language (
    code character varying NOT NULL,
    name character varying
);
    DROP TABLE quizapp.language;
       quizapp         heap    postgres    false    12                       1259    20578    level    TABLE     {   CREATE TABLE quizapp.level (
    code character varying NOT NULL,
    subject character varying,
    translations jsonb
);
    DROP TABLE quizapp.level;
       quizapp         heap    postgres    false    12                       1259    20583    question    TABLE     ?   CREATE TABLE quizapp.question (
    id integer NOT NULL,
    subject character varying,
    title character varying NOT NULL,
    level character varying,
    translations jsonb
);
    DROP TABLE quizapp.question;
       quizapp         heap    postgres    false    12                       1259    20588    question_id_seq    SEQUENCE     ?   CREATE SEQUENCE quizapp.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE quizapp.question_id_seq;
       quizapp          postgres    false    275    12            H           0    0    question_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE quizapp.question_id_seq OWNED BY quizapp.question.id;
          quizapp          postgres    false    276                       1259    20589    quiz    TABLE     ?  CREATE TABLE quizapp.quiz (
    id integer NOT NULL,
    user_id integer,
    subject character varying,
    level character varying,
    language character varying,
    started_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    finished_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    total_question_count smallint,
    wrong_question_count smallint,
    right_question_count smallint
);
    DROP TABLE quizapp.quiz;
       quizapp         heap    postgres    false    12                       1259    20596    quiz_id_seq    SEQUENCE     ?   CREATE SEQUENCE quizapp.quiz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE quizapp.quiz_id_seq;
       quizapp          postgres    false    277    12            I           0    0    quiz_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE quizapp.quiz_id_seq OWNED BY quizapp.quiz.id;
          quizapp          postgres    false    278                       1259    20597    quiz_question    TABLE     ?   CREATE TABLE quizapp.quiz_question (
    id integer NOT NULL,
    quiz_id integer,
    question_id integer,
    correct boolean
);
 "   DROP TABLE quizapp.quiz_question;
       quizapp         heap    postgres    false    12                       1259    20600    quiz_question_id_seq    SEQUENCE     ?   CREATE SEQUENCE quizapp.quiz_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE quizapp.quiz_question_id_seq;
       quizapp          postgres    false    12    279            J           0    0    quiz_question_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE quizapp.quiz_question_id_seq OWNED BY quizapp.quiz_question.id;
          quizapp          postgres    false    280                       1259    20601    settings    TABLE     #   CREATE TABLE quizapp.settings (
);
    DROP TABLE quizapp.settings;
       quizapp         heap    postgres    false    12                       1259    20604    subject    TABLE     ?   CREATE TABLE quizapp.subject (
    code character varying NOT NULL,
    name character varying NOT NULL,
    translations jsonb
);
    DROP TABLE quizapp.subject;
       quizapp         heap    postgres    false    12                       2604    19906    category_audits_table id    DEFAULT     ?   ALTER TABLE ONLY logs.category_audits_table ALTER COLUMN id SET DEFAULT nextval('logs.category_audits_table_id_seq'::regclass);
 E   ALTER TABLE logs.category_audits_table ALTER COLUMN id DROP DEFAULT;
       logs          postgres    false    249    250    250            	           2604    19930    language_audits_table id    DEFAULT     ?   ALTER TABLE ONLY logs.language_audits_table ALTER COLUMN id SET DEFAULT nextval('logs.language_audits_table_id_seq'::regclass);
 E   ALTER TABLE logs.language_audits_table ALTER COLUMN id DROP DEFAULT;
       logs          postgres    false    254    253    254                       2604    19918    level_audits_table id    DEFAULT     z   ALTER TABLE ONLY logs.level_audits_table ALTER COLUMN id SET DEFAULT nextval('logs.level_audits_table_id_seq'::regclass);
 B   ALTER TABLE logs.level_audits_table ALTER COLUMN id DROP DEFAULT;
       logs          postgres    false    252    251    252            
           2604    19942    question_audits_table id    DEFAULT     ?   ALTER TABLE ONLY logs.question_audits_table ALTER COLUMN id SET DEFAULT nextval('logs.question_audits_table_id_seq'::regclass);
 E   ALTER TABLE logs.question_audits_table ALTER COLUMN id DROP DEFAULT;
       logs          postgres    false    256    255    256                       2604    19966    quiz_history_audits_table id    DEFAULT     ?   ALTER TABLE ONLY logs.quiz_history_audits_table ALTER COLUMN id SET DEFAULT nextval('logs.quiz_history_audits_table_id_seq'::regclass);
 I   ALTER TABLE logs.quiz_history_audits_table ALTER COLUMN id DROP DEFAULT;
       logs          postgres    false    260    259    260                       2604    19894    users_audits_table id    DEFAULT     z   ALTER TABLE ONLY logs.users_audits_table ALTER COLUMN id SET DEFAULT nextval('logs.users_audits_table_id_seq'::regclass);
 B   ALTER TABLE logs.users_audits_table ALTER COLUMN id DROP DEFAULT;
       logs          postgres    false    247    248    248                       2604    19954    variant_audits_table id    DEFAULT     ~   ALTER TABLE ONLY logs.variant_audits_table ALTER COLUMN id SET DEFAULT nextval('logs.variant_audits_table_id_seq'::regclass);
 D   ALTER TABLE logs.variant_audits_table ALTER COLUMN id DROP DEFAULT;
       logs          postgres    false    257    258    258                       2604    20609 	   answer id    DEFAULT     h   ALTER TABLE ONLY quizapp.answer ALTER COLUMN id SET DEFAULT nextval('quizapp.answer_id_seq'::regclass);
 9   ALTER TABLE quizapp.answer ALTER COLUMN id DROP DEFAULT;
       quizapp          postgres    false    269    268                       2604    20610    auth_user id    DEFAULT     n   ALTER TABLE ONLY quizapp.auth_user ALTER COLUMN id SET DEFAULT nextval('quizapp.auth_user_id_seq'::regclass);
 <   ALTER TABLE quizapp.auth_user ALTER COLUMN id DROP DEFAULT;
       quizapp          postgres    false    272    271                       2604    20611    question id    DEFAULT     l   ALTER TABLE ONLY quizapp.question ALTER COLUMN id SET DEFAULT nextval('quizapp.question_id_seq'::regclass);
 ;   ALTER TABLE quizapp.question ALTER COLUMN id DROP DEFAULT;
       quizapp          postgres    false    276    275                       2604    20612    quiz id    DEFAULT     d   ALTER TABLE ONLY quizapp.quiz ALTER COLUMN id SET DEFAULT nextval('quizapp.quiz_id_seq'::regclass);
 7   ALTER TABLE quizapp.quiz ALTER COLUMN id DROP DEFAULT;
       quizapp          postgres    false    278    277                       2604    20613    quiz_question id    DEFAULT     v   ALTER TABLE ONLY quizapp.quiz_question ALTER COLUMN id SET DEFAULT nextval('quizapp.quiz_question_id_seq'::regclass);
 @   ALTER TABLE quizapp.quiz_question ALTER COLUMN id DROP DEFAULT;
       quizapp          postgres    false    280    279                      0    19903    category_audits_table 
   TABLE DATA           ?   COPY logs.category_audits_table (id, category_id, old_row_data, new_row_data, dml_type, dml_time_stamp, dml_created_by, row_name) FROM stdin;
    logs          postgres    false    250   ?      !          0    19927    language_audits_table 
   TABLE DATA           ?   COPY logs.language_audits_table (id, language_id, old_row_data, new_row_data, dml_type, dml_time_stamp, dml_created_by, row_name) FROM stdin;
    logs          postgres    false    254   1?                0    19915    level_audits_table 
   TABLE DATA           ?   COPY logs.level_audits_table (id, level_id, old_row_data, new_row_data, dml_type, dml_time_stamp, dml_created_by, row_name) FROM stdin;
    logs          postgres    false    252   N?      #          0    19939    question_audits_table 
   TABLE DATA           ?   COPY logs.question_audits_table (id, question_id, old_row_data, new_row_data, dml_type, dml_time_stamp, dml_created_by, row_name) FROM stdin;
    logs          postgres    false    256   k?      '          0    19963    quiz_history_audits_table 
   TABLE DATA           ?   COPY logs.quiz_history_audits_table (id, quiz_history_id, old_row_data, new_row_data, dml_type, dml_time_stamp, dml_created_by, row_name) FROM stdin;
    logs          postgres    false    260   *?                0    19891    users_audits_table 
   TABLE DATA           ?   COPY logs.users_audits_table (id, user_id, old_row_data, new_row_data, dml_type, dml_time_stamp, dml_created_by, row_name) FROM stdin;
    logs          postgres    false    248   ??      %          0    19951    variant_audits_table 
   TABLE DATA           ?   COPY logs.variant_audits_table (id, variant_id, old_row_data, new_row_data, dml_type, dml_time_stamp, dml_created_by, row_name) FROM stdin;
    logs          postgres    false    258   [?                0    19034    category 
   TABLE DATA           ~   COPY public.category (id, category_name, language_id, is_deleted, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    222   5?                0    19081    language 
   TABLE DATA           V   COPY public.language (id, name, code, is_deleted, updated_by, updated_at) FROM stdin;
    public          postgres    false    227   ??                0    19045    level 
   TABLE DATA              COPY public.level (id, level_name, category_id, power, created_at, created_by, updated_at, updated_by, is_deleted) FROM stdin;
    public          postgres    false    223   H?                0    19055    question 
   TABLE DATA           ?   COPY public.question (id, category_id, question_body, level_id, created_at, created_by, updated_at, updated_by, correct_answers, is_deleted) FROM stdin;
    public          postgres    false    224   /?                0    19072    quiz_history 
   TABLE DATA           ?   COPY public.quiz_history (id, user_id, user_answers, correct_answers, created_at, updated_at, updated_by, is_deleted, question_count, started_at, finished_at) FROM stdin;
    public          postgres    false    226   ??      7          0    28743    quiz_question 
   TABLE DATA           T   COPY public.quiz_question (quiz_id, question_id, correct, user_choices) FROM stdin;
    public          postgres    false    283   ??                0    19019    users 
   TABLE DATA           ?   COPY public.users (id, username, password, fullname, email, role, is_deleted, created_at, updated_at, updated_by, language_id) FROM stdin;
    public          postgres    false    221   `?                0    19063    variant 
   TABLE DATA           ?   COPY public.variant (id, question_id, body, is_correct, created_at, created_by, updated_at, updated_by, is_deleted) FROM stdin;
    public          postgres    false    225   ??      (          0    20554    answer 
   TABLE DATA           ;   COPY quizapp.answer (id, question_id, choices) FROM stdin;
    quizapp          postgres    false    268   N?      *          0    20562 	   auth_role 
   TABLE DATA           0   COPY quizapp.auth_role (code, name) FROM stdin;
    quizapp          postgres    false    270   ??      +          0    20567 	   auth_user 
   TABLE DATA           L   COPY quizapp.auth_user (id, username, password, role, language) FROM stdin;
    quizapp          postgres    false    271   ??      -          0    20573    language 
   TABLE DATA           /   COPY quizapp.language (code, name) FROM stdin;
    quizapp          postgres    false    273   ??      .          0    20578    level 
   TABLE DATA           =   COPY quizapp.level (code, subject, translations) FROM stdin;
    quizapp          postgres    false    274   ?      /          0    20583    question 
   TABLE DATA           L   COPY quizapp.question (id, subject, title, level, translations) FROM stdin;
    quizapp          postgres    false    275   \?      1          0    20589    quiz 
   TABLE DATA           ?   COPY quizapp.quiz (id, user_id, subject, level, language, started_at, finished_at, total_question_count, wrong_question_count, right_question_count) FROM stdin;
    quizapp          postgres    false    277   =?      3          0    20597    quiz_question 
   TABLE DATA           K   COPY quizapp.quiz_question (id, quiz_id, question_id, correct) FROM stdin;
    quizapp          postgres    false    279   ??      5          0    20601    settings 
   TABLE DATA           #   COPY quizapp.settings  FROM stdin;
    quizapp          postgres    false    281   ??      6          0    20604    subject 
   TABLE DATA           <   COPY quizapp.subject (code, name, translations) FROM stdin;
    quizapp          postgres    false    282   ??      K           0    0    category_audits_table_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('logs.category_audits_table_id_seq', 1, false);
          logs          postgres    false    249            L           0    0    language_audits_table_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('logs.language_audits_table_id_seq', 1, false);
          logs          postgres    false    253            M           0    0    level_audits_table_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('logs.level_audits_table_id_seq', 1, false);
          logs          postgres    false    251            N           0    0    question_audits_table_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('logs.question_audits_table_id_seq', 30, true);
          logs          postgres    false    255            O           0    0     quiz_history_audits_table_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('logs.quiz_history_audits_table_id_seq', 4, true);
          logs          postgres    false    259            P           0    0    users_audits_table_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('logs.users_audits_table_id_seq', 20, true);
          logs          postgres    false    247            Q           0    0    variant_audits_table_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('logs.variant_audits_table_id_seq', 34, true);
          logs          postgres    false    257            R           0    0    answer_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('quizapp.answer_id_seq', 1, true);
          quizapp          postgres    false    269            S           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('quizapp.auth_user_id_seq', 7, true);
          quizapp          postgres    false    272            T           0    0    question_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('quizapp.question_id_seq', 1, true);
          quizapp          postgres    false    276            U           0    0    quiz_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('quizapp.quiz_id_seq', 1, true);
          quizapp          postgres    false    278            V           0    0    quiz_question_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('quizapp.quiz_question_id_seq', 1, true);
          quizapp          postgres    false    280            W           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('utils.category_id_seq', 27, true);
          utils          postgres    false    228            X           0    0    language_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('utils.language_id_seq', 5, true);
          utils          postgres    false    229            Y           0    0    level_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('utils.level_id_seq', 30, true);
          utils          postgres    false    230            Z           0    0    question_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('utils.question_id_seq', 69, true);
          utils          postgres    false    231            [           0    0    quiz_history_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('utils.quiz_history_id_seq', 12, true);
          utils          postgres    false    232            \           0    0    quiz_variants_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('utils.quiz_variants_id_seq', 49, true);
          utils          postgres    false    233            ;           2606    19911 0   category_audits_table category_audits_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY logs.category_audits_table
    ADD CONSTRAINT category_audits_table_pkey PRIMARY KEY (category_id, dml_type, dml_time_stamp);
 X   ALTER TABLE ONLY logs.category_audits_table DROP CONSTRAINT category_audits_table_pkey;
       logs            postgres    false    250    250    250            ?           2606    19935 0   language_audits_table language_audits_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY logs.language_audits_table
    ADD CONSTRAINT language_audits_table_pkey PRIMARY KEY (language_id, dml_type, dml_time_stamp);
 X   ALTER TABLE ONLY logs.language_audits_table DROP CONSTRAINT language_audits_table_pkey;
       logs            postgres    false    254    254    254            =           2606    19923 *   level_audits_table level_audits_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY logs.level_audits_table
    ADD CONSTRAINT level_audits_table_pkey PRIMARY KEY (level_id, dml_type, dml_time_stamp);
 R   ALTER TABLE ONLY logs.level_audits_table DROP CONSTRAINT level_audits_table_pkey;
       logs            postgres    false    252    252    252            A           2606    19947 0   question_audits_table question_audits_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY logs.question_audits_table
    ADD CONSTRAINT question_audits_table_pkey PRIMARY KEY (question_id, dml_type, dml_time_stamp);
 X   ALTER TABLE ONLY logs.question_audits_table DROP CONSTRAINT question_audits_table_pkey;
       logs            postgres    false    256    256    256            E           2606    19971 8   quiz_history_audits_table quiz_history_audits_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY logs.quiz_history_audits_table
    ADD CONSTRAINT quiz_history_audits_table_pkey PRIMARY KEY (quiz_history_id, dml_type, dml_time_stamp);
 `   ALTER TABLE ONLY logs.quiz_history_audits_table DROP CONSTRAINT quiz_history_audits_table_pkey;
       logs            postgres    false    260    260    260            9           2606    19899 *   users_audits_table users_audits_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY logs.users_audits_table
    ADD CONSTRAINT users_audits_table_pkey PRIMARY KEY (user_id, dml_type, dml_time_stamp);
 R   ALTER TABLE ONLY logs.users_audits_table DROP CONSTRAINT users_audits_table_pkey;
       logs            postgres    false    248    248    248            C           2606    19959 .   variant_audits_table variant_audits_table_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY logs.variant_audits_table
    ADD CONSTRAINT variant_audits_table_pkey PRIMARY KEY (variant_id, dml_type, dml_time_stamp);
 V   ALTER TABLE ONLY logs.variant_audits_table DROP CONSTRAINT variant_audits_table_pkey;
       logs            postgres    false    258    258    258            %           2606    19042 #   category category_category_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_category_name_key UNIQUE (category_name);
 M   ALTER TABLE ONLY public.category DROP CONSTRAINT category_category_name_key;
       public            postgres    false    222            '           2606    19044    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    222            3           2606    19090    language language_code_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_code_key UNIQUE (code);
 D   ALTER TABLE ONLY public.language DROP CONSTRAINT language_code_key;
       public            postgres    false    227            5           2606    19088    language language_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.language DROP CONSTRAINT language_name_key;
       public            postgres    false    227            7           2606    19092    language language_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.language DROP CONSTRAINT language_pkey;
       public            postgres    false    227            )           2606    19054    level level_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.level
    ADD CONSTRAINT level_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.level DROP CONSTRAINT level_pkey;
       public            postgres    false    223            -           2606    19062    question question_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.question DROP CONSTRAINT question_pkey;
       public            postgres    false    224            1           2606    19080    quiz_history quiz_history_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.quiz_history
    ADD CONSTRAINT quiz_history_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.quiz_history DROP CONSTRAINT quiz_history_pkey;
       public            postgres    false    226            +           2606    19052    level uk_level_name_category_id 
   CONSTRAINT     m   ALTER TABLE ONLY public.level
    ADD CONSTRAINT uk_level_name_category_id UNIQUE (level_name, category_id);
 I   ALTER TABLE ONLY public.level DROP CONSTRAINT uk_level_name_category_id;
       public            postgres    false    223    223            [           2606    28758 #   quiz_question uk_quizid_question_id 
   CONSTRAINT     n   ALTER TABLE ONLY public.quiz_question
    ADD CONSTRAINT uk_quizid_question_id UNIQUE (quiz_id, question_id);
 M   ALTER TABLE ONLY public.quiz_question DROP CONSTRAINT uk_quizid_question_id;
       public            postgres    false    283    283                       2606    19033    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    221            !           2606    19029    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    221            #           2606    19031    users users_username_unique 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_unique;
       public            postgres    false    221            /           2606    19071    variant variant_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.variant DROP CONSTRAINT variant_pkey;
       public            postgres    false    225            G           2606    20615    answer answer_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY quizapp.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY quizapp.answer DROP CONSTRAINT answer_pkey;
       quizapp            postgres    false    268            I           2606    20617    auth_role auth_role_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY quizapp.auth_role
    ADD CONSTRAINT auth_role_pkey PRIMARY KEY (code);
 C   ALTER TABLE ONLY quizapp.auth_role DROP CONSTRAINT auth_role_pkey;
       quizapp            postgres    false    270            K           2606    20619    auth_user auth_user_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY quizapp.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY quizapp.auth_user DROP CONSTRAINT auth_user_pkey;
       quizapp            postgres    false    271            M           2606    20621     auth_user auth_user_username_key 
   CONSTRAINT     `   ALTER TABLE ONLY quizapp.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 K   ALTER TABLE ONLY quizapp.auth_user DROP CONSTRAINT auth_user_username_key;
       quizapp            postgres    false    271            O           2606    20623    language language_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY quizapp.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (code);
 A   ALTER TABLE ONLY quizapp.language DROP CONSTRAINT language_pkey;
       quizapp            postgres    false    273            Q           2606    20625    level level_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY quizapp.level
    ADD CONSTRAINT level_pkey PRIMARY KEY (code);
 ;   ALTER TABLE ONLY quizapp.level DROP CONSTRAINT level_pkey;
       quizapp            postgres    false    274            S           2606    20627    question question_id_pk 
   CONSTRAINT     V   ALTER TABLE ONLY quizapp.question
    ADD CONSTRAINT question_id_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY quizapp.question DROP CONSTRAINT question_id_pk;
       quizapp            postgres    false    275            U           2606    20629    quiz quiz_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY quizapp.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY quizapp.quiz DROP CONSTRAINT quiz_pkey;
       quizapp            postgres    false    277            W           2606    20631     quiz_question quiz_question_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY quizapp.quiz_question
    ADD CONSTRAINT quiz_question_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY quizapp.quiz_question DROP CONSTRAINT quiz_question_pkey;
       quizapp            postgres    false    279            Y           2606    20633    subject subject_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY quizapp.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (code);
 ?   ALTER TABLE ONLY quizapp.subject DROP CONSTRAINT subject_pkey;
       quizapp            postgres    false    282            y           2620    19913    category category_changes    TRIGGER     ?   CREATE TRIGGER category_changes AFTER INSERT OR DELETE OR UPDATE ON public.category FOR EACH ROW EXECUTE FUNCTION logs.log_category_changes();
 2   DROP TRIGGER category_changes ON public.category;
       public          postgres    false    222    402            ~           2620    19937    language language_changes    TRIGGER     ?   CREATE TRIGGER language_changes AFTER INSERT OR DELETE OR UPDATE ON public.language FOR EACH ROW EXECUTE FUNCTION logs.log_language_changes();
 2   DROP TRIGGER language_changes ON public.language;
       public          postgres    false    227    404            z           2620    19925    level level_changes    TRIGGER     ?   CREATE TRIGGER level_changes AFTER INSERT OR DELETE OR UPDATE ON public.level FOR EACH ROW EXECUTE FUNCTION logs.log_level_changes();
 ,   DROP TRIGGER level_changes ON public.level;
       public          postgres    false    223    403            {           2620    19949    question question_changes    TRIGGER     ?   CREATE TRIGGER question_changes AFTER INSERT OR DELETE OR UPDATE ON public.question FOR EACH ROW EXECUTE FUNCTION logs.log_question_changes();
 2   DROP TRIGGER question_changes ON public.question;
       public          postgres    false    224    405            }           2620    19973 !   quiz_history quiz_history_changes    TRIGGER     ?   CREATE TRIGGER quiz_history_changes AFTER INSERT OR DELETE OR UPDATE ON public.quiz_history FOR EACH ROW EXECUTE FUNCTION logs.log_quiz_history_changes();
 :   DROP TRIGGER quiz_history_changes ON public.quiz_history;
       public          postgres    false    226    407            x           2620    19901    users user_changes    TRIGGER     ?   CREATE TRIGGER user_changes AFTER INSERT OR DELETE OR UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION logs.log_user_changes();
 +   DROP TRIGGER user_changes ON public.users;
       public          postgres    false    352    221            |           2620    19961    variant variant_changes    TRIGGER     ?   CREATE TRIGGER variant_changes AFTER INSERT OR DELETE OR UPDATE ON public.variant FOR EACH ROW EXECUTE FUNCTION logs.log_variant_changes();
 0   DROP TRIGGER variant_changes ON public.variant;
       public          postgres    false    225    406            ]           2606    19128 $   category category_created_by_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.category DROP CONSTRAINT category_created_by_foreign;
       public          postgres    false    3617    222    221            ^           2606    19123 %   category category_language_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_language_id_foreign FOREIGN KEY (language_id) REFERENCES public.language(id);
 O   ALTER TABLE ONLY public.category DROP CONSTRAINT category_language_id_foreign;
       public          postgres    false    227    222    3639            _           2606    19133 $   category category_updated_by_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.category DROP CONSTRAINT category_updated_by_foreign;
       public          postgres    false    222    3617    221            l           2606    19179 !   language language_updated_by_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.users(id);
 K   ALTER TABLE ONLY public.language DROP CONSTRAINT language_updated_by_fkey;
       public          postgres    false    221    227    3617            `           2606    19098    level level_category_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.level
    ADD CONSTRAINT level_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.category(id);
 I   ALTER TABLE ONLY public.level DROP CONSTRAINT level_category_id_foreign;
       public          postgres    false    223    3623    222            a           2606    19143    level level_created_by_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.level
    ADD CONSTRAINT level_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.level DROP CONSTRAINT level_created_by_foreign;
       public          postgres    false    223    3617    221            b           2606    19138    level level_updated_by_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.level
    ADD CONSTRAINT level_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.level DROP CONSTRAINT level_updated_by_foreign;
       public          postgres    false    223    3617    221            c           2606    19103 %   question question_category_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.category(id);
 O   ALTER TABLE ONLY public.question DROP CONSTRAINT question_category_id_foreign;
       public          postgres    false    224    3623    222            d           2606    19153 $   question question_created_by_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.question DROP CONSTRAINT question_created_by_foreign;
       public          postgres    false    3617    224    221            e           2606    19113 "   question question_level_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_level_id_foreign FOREIGN KEY (level_id) REFERENCES public.level(id);
 L   ALTER TABLE ONLY public.question DROP CONSTRAINT question_level_id_foreign;
       public          postgres    false    224    3625    223            f           2606    19148 $   question question_updated_by_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.question DROP CONSTRAINT question_updated_by_foreign;
       public          postgres    false    224    3617    221            j           2606    19168 ,   quiz_history quiz_history_updated_by_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.quiz_history
    ADD CONSTRAINT quiz_history_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.quiz_history DROP CONSTRAINT quiz_history_updated_by_foreign;
       public          postgres    false    3617    226    221            k           2606    19108 )   quiz_history quiz_history_user_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.quiz_history
    ADD CONSTRAINT quiz_history_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 S   ALTER TABLE ONLY public.quiz_history DROP CONSTRAINT quiz_history_user_id_foreign;
       public          postgres    false    226    3617    221            v           2606    28751 *   quiz_question quiz_question_question_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.quiz_question
    ADD CONSTRAINT quiz_question_question_id_fk FOREIGN KEY (question_id) REFERENCES public.question(id);
 T   ALTER TABLE ONLY public.quiz_question DROP CONSTRAINT quiz_question_question_id_fk;
       public          postgres    false    3629    283    224            w           2606    28746 .   quiz_question quiz_question_quiz_history_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.quiz_question
    ADD CONSTRAINT quiz_question_quiz_history_id_fk FOREIGN KEY (quiz_id) REFERENCES public.quiz_history(id);
 X   ALTER TABLE ONLY public.quiz_question DROP CONSTRAINT quiz_question_quiz_history_id_fk;
       public          postgres    false    3633    226    283            \           2606    19093    users users_language_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_language_id_foreign FOREIGN KEY (language_id) REFERENCES public.language(id);
 I   ALTER TABLE ONLY public.users DROP CONSTRAINT users_language_id_foreign;
       public          postgres    false    227    221    3639            g           2606    19163 "   variant variant_created_by_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.variant DROP CONSTRAINT variant_created_by_foreign;
       public          postgres    false    225    3617    221            h           2606    19118 #   variant variant_question_id_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_question_id_foreign FOREIGN KEY (question_id) REFERENCES public.question(id);
 M   ALTER TABLE ONLY public.variant DROP CONSTRAINT variant_question_id_foreign;
       public          postgres    false    225    3629    224            i           2606    19158 "   variant variant_updated_by_foreign    FK CONSTRAINT     ?   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.variant DROP CONSTRAINT variant_updated_by_foreign;
       public          postgres    false    3617    225    221            m           2606    20634 %   answer answer_question_question_id_id    FK CONSTRAINT     ?   ALTER TABLE ONLY quizapp.answer
    ADD CONSTRAINT answer_question_question_id_id FOREIGN KEY (question_id) REFERENCES quizapp.question(id);
 P   ALTER TABLE ONLY quizapp.answer DROP CONSTRAINT answer_question_question_id_id;
       quizapp          postgres    false    3667    268    275            n           2606    20639 *   auth_user auth_user_auth_role_role_code_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY quizapp.auth_user
    ADD CONSTRAINT auth_user_auth_role_role_code_fk FOREIGN KEY (role) REFERENCES quizapp.auth_role(code);
 U   ALTER TABLE ONLY quizapp.auth_user DROP CONSTRAINT auth_user_auth_role_role_code_fk;
       quizapp          postgres    false    3657    271    270            o           2606    20644 -   auth_user auth_user_language_language_code_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY quizapp.auth_user
    ADD CONSTRAINT auth_user_language_language_code_fk FOREIGN KEY (language) REFERENCES quizapp.language(code);
 X   ALTER TABLE ONLY quizapp.auth_user DROP CONSTRAINT auth_user_language_language_code_fk;
       quizapp          postgres    false    271    3663    273            p           2606    20649 #   level level_subject_subject_code_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY quizapp.level
    ADD CONSTRAINT level_subject_subject_code_fk FOREIGN KEY (subject) REFERENCES quizapp.subject(code);
 N   ALTER TABLE ONLY quizapp.level DROP CONSTRAINT level_subject_subject_code_fk;
       quizapp          postgres    false    274    3673    282            q           2606    20654 %   question question_level_level_code_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY quizapp.question
    ADD CONSTRAINT question_level_level_code_fk FOREIGN KEY (level) REFERENCES quizapp.level(code);
 P   ALTER TABLE ONLY quizapp.question DROP CONSTRAINT question_level_level_code_fk;
       quizapp          postgres    false    275    274    3665            r           2606    20659 #   quiz quiz_language_language_code_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY quizapp.quiz
    ADD CONSTRAINT quiz_language_language_code_fk FOREIGN KEY (language) REFERENCES quizapp.language(code);
 N   ALTER TABLE ONLY quizapp.quiz DROP CONSTRAINT quiz_language_language_code_fk;
       quizapp          postgres    false    273    277    3663            s           2606    20664    quiz quiz_level_level_code_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY quizapp.quiz
    ADD CONSTRAINT quiz_level_level_code_fk FOREIGN KEY (level) REFERENCES quizapp.level(code);
 H   ALTER TABLE ONLY quizapp.quiz DROP CONSTRAINT quiz_level_level_code_fk;
       quizapp          postgres    false    274    277    3665            t           2606    20669 -   quiz_question quiz_question_question_id_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY quizapp.quiz_question
    ADD CONSTRAINT quiz_question_question_id_id_fk FOREIGN KEY (question_id) REFERENCES quizapp.question(id);
 X   ALTER TABLE ONLY quizapp.quiz_question DROP CONSTRAINT quiz_question_question_id_id_fk;
       quizapp          postgres    false    279    275    3667            u           2606    20674 )   quiz_question quiz_question_quiz_id_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY quizapp.quiz_question
    ADD CONSTRAINT quiz_question_quiz_id_id_fk FOREIGN KEY (quiz_id) REFERENCES quizapp.quiz(id);
 T   ALTER TABLE ONLY quizapp.quiz_question DROP CONSTRAINT quiz_question_quiz_id_id_fk;
       quizapp          postgres    false    277    279    3669                  x?????? ? ?      !      x?????? ? ?            x?????? ? ?      #   ?   x???=n0??"????K??c??8j?-??????Y????|????~@H?J|?ya?5RXd??wo????DK??R?????d??z??6?'#???^??s?!?9??k?L?& ?h?Y?]5t?????????,?v)?C?e??P?2_9v?7???Tj?@	b?g&r????;?1Ek[      '   g   x?}???@c?
??NB?~?$lB?_0??g.???9??????_??X??qc/?hX??3%X???ZC??E??5???.???
i????4U}j*;         ?  x???]o?0???_?r?????$?U;?iH+C-h7??.M?!4????c?-E? mA??$?X~?<v`f??????k?v-?	??pAX??}?e???U?M,????\D?l??E??N8t9w??Jc9V?p&y??y?s?Ld???T?8~O??h?O>N?hU???H5??}I?em?q9{JP??Z?D???'?????T????;?TI??/s]??=?????`??c?7???z"?3???H????????OB	5S?:?W?????`y?]??0[M?v-X+ ?t???W1????t???b6?2y???t^??$?M 7?v???n???4????Wh?2X?68O???wg?????n,?@(?=???ae??8???`?d??? ??[???0?!?wC???i?? A?>Z??gd????????h!?p?'*??????????{?-J??bR?L???s????f?K9??'??tTOp???????z??m?#????0d?????{?M?????t??24pP	x??G???QB??6?SR?rR??+?jpD?xP?Fp2jo???$?&p??	????0# ????K9????M?????

tI???Fn<?,????PyM?
bF ? (?KAh[??D?#M? ?fe|?j??]??7R?/?,?r????
??=n      %   ?  x???K??0???_?????<d?u+t?,?Mo!???<???W&q]g?=t??fF??H???????????}???????H?I?9?U5 OD??H?)yJ?3??q"? ?&?2?????? ??2?Xq?K??J+C?0?a s?2???ZJ:3l?#?%??p???D`4???=F???6?	9???U?en	??g?Q`??q?6?e????NaR????0B`??q??u*???o???Fs@?I?(??35????@lF?=(L?1)Db[?7Q.???#?6?A?????u?e????????,?@]?????????fn?_???]?:??c??w3??u?C?.?%??{??V??r???\?F3w|m/??q??F??S?l?v??]???????k???????e??Ps?>?!??VX?????~{??*R?S?fx??y???w?y?UU????         ?   x????
?@???)n?J?z??6!???????ElA???j??2???????$??3*??g?m? ,?n??
??{??[ Ns?-?????1&v?KR?);????d????^?Aeh??~U?
?^?-????????'?.?	??#         _   x?=?1
?0??99??X??tS??(Z??????????c????+?????wn?????l???i????'?????x"H?p`u*~ai??!?S??         ?   x????
?@???S?K%I{??m
".?]?Z???U???"?*h?l??|????:?????Rd`???)B3cv??6s?@???B?n???i?IB??N|-eUt?B:E??`??l?|???;#??:??F?L?,oEs??_??????m?????~9fc????S?8??"R??+???V?j?????=??WZ???b????r?MW?{8O#??R?Y ?e         T   x????	? D??l9+???(?t?
???h???kE??~`T?????[????])T?O`???????M@??-?)"c?#?         T   x?????0?w3??q?d&??s *????%???4?'-C3?F?zx????Tg???e?)??>??+V?7??2??\?{+n      7   Y   x?M???0 ?0?1"??%??c??tw?5B??)P?wPA?1;??t??X??O???K?????4?????????'Z?vM???#?F?'T           x??RMo?0<???z[5M???l??B?|??????18v?R???"??J?xf4?7~09??L??2?=d????IiXQ0{?I?	#??%??8?8De0?????"??????F??? ????g?%?\?X6??G?????S??????I?T+?e{d?B??3???????e?%?v??:Ee?I?0Z?d6??k???K?Ve?Ysy??????????????B???=??}yX&??w?txq"??@$X)?\h
???k},????? 2Yz0wp?e?
??Q??rW,A????????w?7O,?????~?1????i?c??;??e?_???1?b(TFp-3??7???:?h?? ????=?TI??b??????K??,?????J???|b'???*?f??1 /?*?}g??;a?d???O|T???????K?>??g9?r???????yj7???Ti{????"?c?2G??wvY?mr????????C*??????n.?a??oyn?k`?;o?eY?j6S         ?   x???=? ???"{?
?8DO??'??UL?????????	???@?x?????6????
??oN]u???nM?r;< ????I??14??F??c????^???J8????>A?????%?Z?r?m4??
X???NV?Z???5????1l?w?,c????I????H7???d`??:4??>?)?/F???      (   E   x?3?4???V*?L?(Q?R()*M?QPJ???LN??ku?i?9?(?&????L?+0?3???????? #?(Y      *   0   x?v?-N-?rt????tL????
qut? J??&&g ?b???? ??      +   ?   x?=?=S?0 ??9??)?$?1B"??? ???
??9??????s/}= ?7???>?M???r?~?iE?Q?3K????????t?7??>?\?T???G?f?p???d?8K\F?f??^I??(k:?k?R>?????'q?????z??B?j0S?????[h??C&+???U4z?>*?w????O?D?????vN=????;?r?? ??M(E8      -   ,   x????JJ??

?*-.?L??r??t?K??,??????? ??
{      .   F   x??pr??u???Vr?S?RP?H,JQ?QP

?.,??????.?????fVf?)?r??qqq ???      /   ?   x?]??JQ??3Oq?;A&?VB?g?+vG?$Z6?@h8
B???G?"???U?#?w'??9?~????4t?b???s?Q^N^?>I+J??WY?b8??????rB??7?[??
?m#}?~?uSD?4????dILd?TU?????+~??k?? w\p?o~?(C?=?#a?9???!*.??????3??}Z????}?D7]mo=4kg???????A?X      1   C   x?3?4??u???pr???4202?50?5?P04?2??2??33?45??60% k??D\1z\\\ -wi      3      x?3?4???=...       5      x?????? ? ?      6   M   x??u???M,?H?M,?L.??Vr?S?RPBS?QP

	^?sa???[????.l ??FA??ud'*?r??qqq ??#?     