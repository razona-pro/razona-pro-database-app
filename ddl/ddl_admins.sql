CREATE TABLE razonapro.admins (
    admin_id          VARCHAR(6)   NOT NULL,
    first_name        VARCHAR(15)  NOT NULL,
    second_name       VARCHAR(15),
    first_surname     VARCHAR(15)  NOT NULL,
    second_surname    VARCHAR(15),
    email             VARCHAR(50)  NOT NULL,
    phone             VARCHAR(15),  -- opcional: ya no se solicita al crear admins
    password_hash     VARCHAR(60)  NOT NULL,
    is_active         CHAR(1)      NOT NULL DEFAULT 'Y',
    last_login_at     TIMESTAMP,
    created_at        TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP,
    CONSTRAINT PK_ADMINS                      PRIMARY KEY (admin_id),
    CONSTRAINT UN_ADMINS_EMAIL                UNIQUE (email),
    CONSTRAINT UN_ADMINS_PHONE                UNIQUE (phone),
    CONSTRAINT CK_ADMINS_IS_ACTIVE            CHECK (is_active IN ('Y','N')),
    CONSTRAINT CK_ADMINS_EMAIL_FMT            CHECK (email = LOWER(email) AND email NOT LIKE '%..%'
                                                  AND email ~ '^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$'),
    CONSTRAINT CK_ADMINS_PHONE_FMT            CHECK (phone ~ '^\+[1-9][0-9]{10,13}$'),
    CONSTRAINT CK_ADMINS_PWD_LEN              CHECK (LENGTH(password_hash) >= 60),
    CONSTRAINT CK_ADMINS_FIRST_NAME_NOTEMPTY  CHECK (LENGTH(TRIM(first_name)) > 0),
    CONSTRAINT CK_ADMINS_FIRST_SUR_NOTEMPTY   CHECK (LENGTH(TRIM(first_surname)) > 0),
    CONSTRAINT CK_ADMINS_SECOND_NAME_NOTEMPTY CHECK (second_name IS NULL OR LENGTH(TRIM(second_name)) > 0),
    CONSTRAINT CK_ADMINS_SECOND_SUR_NOTEMPTY  CHECK (second_surname IS NULL OR LENGTH(TRIM(second_surname)) > 0),
    CONSTRAINT CK_ADMINS_UPDATED_AT           CHECK (updated_at IS NULL OR updated_at >= created_at),
    CONSTRAINT CK_ADMINS_LAST_LOGIN_AT        CHECK (last_login_at IS NULL OR last_login_at >= created_at)
);
