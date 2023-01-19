
-- Práticas
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT(DATETIME('now', 'localtime')) NOT NULL
);

INSERT INTO users(id, name, email, password)
VALUES
("U001", "Indio Medeiros", "indiom@gmail.com", "123456"),
("U002", "Clara Meirelles", "claram@gmail.com", "qwerty"),
("U003", "Luiz Barbosa", "luizb@gmail.com", "password");

SELECT * FROM users;

CREATE TABLE follows(
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id)
);

INSERT INTO follows (follower_id, followed_id) VALUES
    ("U001", "U002"),
    ("U001", "U003"),
    ("U002", "U001");

SELECT * FROM users;

SELECT * FROM users
INNER JOIN follows
ON users.id = follows.follower_id;

SELECT * FROM users
LEFT JOIN follows
ON users.id = follows.follower_id
INNER JOIN users AS usersFollowed
ON usersFollowed.id = follows.followed_id;

SELECT * FROM users
LEFT JOIN follows
ON follows.follower_id = users.id;

SELECT
users.id AS userId,
users.name,
users.email,
users.password,
usersFollowed.name as userFollowed
FROM users
LEFT JOIN follows
ON follows.follower_id = users.id
LEFT JOIN users AS usersFollowed
ON follows.followed_id = usersFollowed.id;