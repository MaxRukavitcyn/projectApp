-- Table: users
CREATE TABLE users (
                     id       INT          NOT NULL PRIMARY KEY,
                     username VARCHAR(255) NOT NULL,
                     password VARCHAR(255) NOT NULL
);

CREATE SEQUENCE user_seq;

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('public.user_seq');
ALTER SEQUENCE user_seq OWNED BY users.id;


-- Table: roles
CREATE TABLE roles (
                     id   INT          NOT NULL PRIMARY KEY,
                     name VARCHAR(100) NOT NULL
);

CREATE SEQUENCE roles_seq;
ALTER TABLE roles ALTER COLUMN id SET DEFAULT nextval('public.roles_seq');
ALTER SEQUENCE roles_seq OWNED BY roles.id;


-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
                          user_id INT NOT NULL,
                          role_id INT NOT NULL,

                          FOREIGN KEY (user_id) REFERENCES users (id),
                          FOREIGN KEY (role_id) REFERENCES roles (id),

                          UNIQUE (user_id, role_id)
);

CREATE SEQUENCE user_roles_user_id_seq;

ALTER TABLE user_roles ALTER COLUMN role_id SET DEFAULT nextval('public.user_roles_user_id_seq');

ALTER SEQUENCE user_roles_user_id_seq OWNED BY user_roles.user_id;



CREATE SEQUENCE user_roles_role_id_seq;

ALTER TABLE user_roles ALTER COLUMN role_id SET DEFAULT nextval('public.user_roles_role_id_seq');

ALTER SEQUENCE user_roles_role_id_seq OWNED BY user_roles.role_id;



-- Insert data

INSERT INTO users VALUES (1, 'maxhand', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);
