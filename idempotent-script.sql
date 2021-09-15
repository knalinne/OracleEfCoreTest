DECLARE
V_COUNT INTEGER;
BEGIN
SELECT COUNT(TABLE_NAME) INTO V_COUNT from USER_TABLES where TABLE_NAME = '__EF_MIGRATION';
IF V_COUNT = 0 THEN
Begin
BEGIN 

execute immediate 'CREATE TABLE "__EF_MIGRATION" (
    "MigrationId" NVARCHAR2(150) NOT NULL,
    "ProductVersion" NVARCHAR2(32) NOT NULL,
    CONSTRAINT "PK___EF_MIGRATION" PRIMARY KEY ("MigrationId")
)';
END;

End;

END IF;
EXCEPTION
WHEN OTHERS THEN
    IF(SQLCODE != -942)THEN
        RAISE;
    END IF;
END;
/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214411_Initial';
IF v_Count = 0 THEN

    BEGIN 

    execute immediate 'CREATE SEQUENCE "SQ_Types" start with 1';

    execute immediate 'CREATE TABLE "Types" (
        "Id" NUMBER(10) NOT NULL,
        "Code" NVARCHAR2(2000),
        CONSTRAINT "PK_Types" PRIMARY KEY ("Id")
    )';
    execute immediate 'create or replace trigger "TR_Types"
    before insert on "Types" for each row 
    begin 
      if :new."Id" is NULL then 
        select "SQ_Types".nextval into :new."Id" from dual;  
      end if; 
    end;';
    END;
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214411_Initial';
IF v_Count = 0 THEN

    BEGIN 

    execute immediate 'CREATE SEQUENCE "SQ_Users" start with 1';

    execute immediate 'CREATE TABLE "Users" (
        "Id" NUMBER(10) NOT NULL,
        "Name" NVARCHAR2(2000),
        "TypeId" NUMBER(10) NOT NULL,
        CONSTRAINT "PK_Users" PRIMARY KEY ("Id"),
        CONSTRAINT "FK_Users_Types_TypeId" FOREIGN KEY ("TypeId") REFERENCES "Types" ("Id") ON DELETE CASCADE
    )';
    execute immediate 'create or replace trigger "TR_Users"
    before insert on "Users" for each row 
    begin 
      if :new."Id" is NULL then 
        select "SQ_Users".nextval into :new."Id" from dual;  
      end if; 
    end;';
    END;
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214411_Initial';
IF v_Count = 0 THEN

    EXECUTE IMMEDIATE '
    CREATE INDEX "IX_Users_TypeId" ON "Users" ("TypeId")
    ';
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214411_Initial';
IF v_Count = 0 THEN

    EXECUTE IMMEDIATE '
    INSERT INTO "__EF_MIGRATION" ("MigrationId", "ProductVersion")
    VALUES (N''20210915214411_Initial'', N''5.0.10'')
    ';
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214544_AddUserAndType';
IF v_Count = 0 THEN

    BEGIN
    INSERT INTO "Types" ("Id", "Code")
    VALUES (1, N'INTERNAL');
    END;
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214544_AddUserAndType';
IF v_Count = 0 THEN

    BEGIN
    INSERT INTO "Types" ("Id", "Code")
    VALUES (2, N'EXTERNAL');
    END;
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214544_AddUserAndType';
IF v_Count = 0 THEN

    BEGIN
    INSERT INTO "Users" ("Id", "Name", "TypeId")
    VALUES (1, N'User One', 1);
    END;
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214544_AddUserAndType';
IF v_Count = 0 THEN

    EXECUTE IMMEDIATE '
    INSERT INTO "__EF_MIGRATION" ("MigrationId", "ProductVersion")
    VALUES (N''20210915214544_AddUserAndType'', N''5.0.10'')
    ';
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214657_RemoveType';
IF v_Count = 0 THEN

    EXECUTE IMMEDIATE '
    ALTER TABLE "Users" DROP CONSTRAINT "FK_Users_Types_TypeId"
    ';
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214657_RemoveType';
IF v_Count = 0 THEN

    EXECUTE IMMEDIATE '
    DROP TABLE "Types"
    ';
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214657_RemoveType';
IF v_Count = 0 THEN

    EXECUTE IMMEDIATE '
    DROP INDEX "IX_Users_TypeId"
    ';
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214657_RemoveType';
IF v_Count = 0 THEN

    EXECUTE IMMEDIATE '
    ALTER TABLE "Users" DROP COLUMN "TypeId"
    ';
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214657_RemoveType';
IF v_Count = 0 THEN

    EXECUTE IMMEDIATE '
    INSERT INTO "__EF_MIGRATION" ("MigrationId", "ProductVersion")
    VALUES (N''20210915214657_RemoveType'', N''5.0.10'')
    ';
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214736_AddAnotherUser';
IF v_Count = 0 THEN

    BEGIN
    INSERT INTO "Users" ("Id", "Name")
    VALUES (2, N'User Two');
    END;
 END IF;
END;

/

DECLARE
    v_Count INTEGER;
BEGIN
SELECT COUNT(*) INTO v_Count FROM "__EF_MIGRATION" WHERE "MigrationId" = N'20210915214736_AddAnotherUser';
IF v_Count = 0 THEN

    EXECUTE IMMEDIATE '
    INSERT INTO "__EF_MIGRATION" ("MigrationId", "ProductVersion")
    VALUES (N''20210915214736_AddAnotherUser'', N''5.0.10'')
    ';
 END IF;
END;

/

