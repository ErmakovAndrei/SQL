DROP DATABASE IF EXISTS vk;
CREATE DATABASE IF NOT EXISTS vk;
USE vk;

CREATE TABLE users(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	phone CHAR(11) NOT NULL,
	email VARCHAR(120) UNIQUE,
	password_hash CHAR(65), 
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX (lastname),
	INDEX (phone)
);

-- показываем все таблицы
SHOW TABLES;


INSERT INTO users 
VALUES (1, 'Petya', 'Petukhov','99999999929', 'petya@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT);
INSERT INTO users (firstname, lastname, email, password_hash, phone) 
VALUES ('Vasya', 'Vasilkov', 'vasya@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', '99999999919');
INSERT INTO users (firstname, lastname, email, password_hash, phone) 
VALUES ('Lusya', 'Mikhailova', 'lusya@mail.com', '81dc9bdb52d04dc34567dbd8313ed055', '89217832442');
INSERT INTO users (firstname, lastname, email, password_hash, phone) 
VALUES ('Vanya', 'Rojkov', 'vanya@mail.com', '81dc4adb52d04dc34777dbd8313ed709', '89643233778');
INSERT INTO users (firstname, lastname, email, password_hash, phone) 
VALUES ('Luba', 'Kiseljeva', 'luba@mail.com', '56dc9bdb52d04dc34590dbd8313ed0904', '89115294321');

SELECT * FROM users;

ALTER TABLE users ADD COLUMN passport_number VARCHAR(10);
ALTER TABLE users MODIFY COLUMN passport_number VARCHAR(20);
ALTER TABLE users RENAME COLUMN passport_number TO passport;
ALTER TABLE users ADD INDEX passport_idx (passport);
ALTER TABLE users DROP COLUMN passport;
ALTER TABLE users ADD CONSTRAINT CHECK(REGEXP_LIKE(phone, '^[0-9]{11}$'));
DESCRIBE users;
INSERT users (id, firstname, lastname, phone, email, password_hash, created_at, updated_at)
VALUES (DEFAULT, 'Alex', 'Stepanov', '89213546566','alex@mail.com','asdsdaasd', DEFAULT, DEFAULT);
INSERT IGNORE users (id, firstname, lastname, phone, email, password_hash, created_at, updated_at)
VALUES (DEFAULT, 'Alex', 'Stepanov', '89213546566','alex@mail.com','asdsdaasd', DEFAULT, DEFAULT);
INSERT users (firstname, lastname, phone, email)
VALUES ('Lena', 'Stepanova', '89213546568', 'lena@mail.com');
INSERT INTO users (id, firstname, lastname, email, phone, password_hash)
VALUES (6, 'Vitya', 'Vitcyn', 'vitya@mail.com', '89179990765', '56dc9avb52d04dc34590dbd2290ed0904'),
(7, 'Venya', 'Vesnin', 'venya@mail.com', '89171445678', '33as9avb52d04gf22190dbd2290ed0776'),
(9, 'Manya', 'Manina', 'manya@mail.com', '89177308901', '77xm6avb52d04dc34590dbd1290es5551'),
(11, 'Senya', 'Senin', 'senya@mail.com', '89312209044', '11sh9rtu59c97dc34590slj2290ed0887');
INSERT users 
VALUES (DEFAULT, 'Dima', 'Temny', '89219907665', 'dima34@mail.com', '31hg7bvc87k33as0990ghj1956cc3300', DEFAULT, DEFAULT);
INSERT INTO users (id, firstname, lastname, email, phone, password_hash)
VALUES (12, 'Vitya', 'Vitcyn', 'vitya32@mail.com', '89179990765', '88dc9avb52d04dc34590dbd2290ed0904'),
(13, 'Kaha', 'Kavsadze', 'kaha@mail.com', '89145543223', '34er2avb52d04gf22190dbd2290ed0206'),
(14, 'Tamara', 'Kvareli', 'tamara@mail.com', '89140200908', '45xm6avb52d04dc34590dbd1290es7874'),
(15, 'Zaza', 'Zauriya', 'zaza@mail.com', '89149088887', '45as9avb52d04gf22190dbd2290ed6734'),
(16, 'Ildar', 'Manina', 'ildar@mail.com', '89180029887', '70xm6avb52d04dc34590dbd1290es3011'),
(17, 'Klava', 'Vesnin', 'klava@mail.com', '89213730087', '47as9avb52d04gf89590dbd2290ed4525'),
(18, 'Marusya', 'Marinina', 'marusya@mail.com', '89112210778', '89xm6avb52d04dc9112dbd1290es8898'),
(19, 'Salomon', 'Salamov', 'salo@mail.com', '89643778711', '09xm6avb52d04dg9900dbd1290es6623'),
(20, 'Dron', 'Dronov', 'dron@mail.com', '89317717171', '54kg5xcz44h22f4590slj2290ed0993');
INSERT users 
VALUES (DEFAULT, 'Chris', 'Ivanov', '89213546560', 'chris@mail.com', 'kdfhgkasd', DEFAULT, DEFAULT);
INSERT INTO users (id, firstname, lastname, email, phone)
VALUES (55, 'Jane', 'Kvanov', 'jane@mail.com', '89293546560');
INSERT INTO users (id, firstname, lastname, email, phone)
VALUES (45, 'Jane1', 'Night1', 'jane_n1@mail.com', '81293946560');
INSERT INTO users (firstname, lastname, email, phone)
VALUES ('Igor', 'Petrov', 'igor@mail.com', '89213549560'),
('Oksana', 'Petrova', 'oksana@mail.com', '89213549561');
INSERT users
SET firstname = 'Iren',
	lastname = 'Sidorova',
	email = 'iren@mail.com',
	phone = '89213541560';
INSERT INTO users (firstname, lastname, email, phone)
SELECT name, surname, email, phone FROM test1.users;
SELECT * FROM users;

-- выбираем все поля users
SELECT * FROM users;

-- выбираем только имена users
SELECT firstname FROM users;

-- выбираем только уникальные имена
SELECT DISTINCT firstname FROM users;
-- выбираем пользователей с именем Аноним
SELECT * FROM users WHERE firstname = 'Аноним';

-- выбираем пользователей с id больше или равным 85
SELECT * FROM users WHERE id >= 85;

-- выбираем пользователей с id больше или равным 85 и меньше или равным 100
SELECT * FROM users WHERE id >= 85 AND id <= 100;

-- аналогично предыдущему запросу
SELECT * FROM users WHERE id BETWEEN 85 AND 100;

-- выбираем столбцы с фамилией, именем и телефоном
SELECT lastname, firstname, phone FROM users;

-- соединяем имя и фамилию с помощью CONCAT, оставляет от имени только первую букву с помощью SUBSTR
-- задаем псевдоним username для столбца
SELECT CONCAT(lastname, ' ', firstname), phone FROM users;
-- указываем с какого символа отрезаем у имени буквы и сколько букв (1, 1) и добавим точку после обрезанного имени.
SELECT CONCAT(lastname,' ', SUBSTR(firstname, 1, 1), '.') AS username, phone FROM users;

-- аналогично предыдущему запросу, алиас задается без ключевого слова AS
SELECT CONCAT(lastname,' ', SUBSTR(firstname, 1, 1), '.') username, phone FROM users;

-- сортировка по столбцу lastname по убыванию (ASC- по возрастанию)
SELECT lastname, firstname, phone FROM users ORDER BY lastname DESC;

-- выбираем четырёх пользователей
SELECT * FROM users LIMIT 4;

-- выбираем 5 пользователей, пропускаем первых 10
SELECT * FROM users LIMIT 5 OFFSET 10;
SELECT * FROM users LIMIT 10, 5;

-- выбираем пользователей, у которых нет hash пароля
SELECT * FROM users WHERE password_hash IS NULL;

-- выбираем пользователей, у которых есть hash пароля
SELECT * FROM users WHERE password_hash IS NOT NULL;

-- выбираем пользователей с id c 70 по 100 или именем Екатерина
SELECT * FROM users WHERE id > 100 AND id < 120 OR firstname = 'Екатерина';

-- выбираем пользователей с именем, оканчивающимся на -ина
SELECT * FROM users WHERE firstname LIKE '%ина';

-- добавляем несколько сообщений
INSERT INTO messages (from_user_id, to_user_id, body)
VALUES (45, 55, 'Hi!');

INSERT INTO messages (from_user_id, to_user_id, body)
VALUES (45, 55, 'I hate you!');

SELECT * FROM messages;

-- меняем текст сообщения
UPDATE messages 
SET body = 'I love you!'
WHERE id = 5;

-- меняем статус на сообщение доставлено
UPDATE messages SET is_delievered = 1;

SELECT * FROM users WHERE lastname = 'Stepanov';

-- удаляем пользователя с фамилией Степанов
DELETE FROM users WHERE lastname = 'Stepanov';

-- Пытаемся удалить пользователя с id = 1
-- Но это не получится, так как есть информация, связанная с ним в дочерних таблицах (сообщения, сообщества и т.д)
DELETE FROM users WHERE id = 1;

-- удаляем все строки из messages
DELETE FROM messages;
SELECT * FROM messages;

SELECT * FROM communities_users;

-- Очищаем таблицу, TRUNCATE создаёт новую таблицу, где нумерация пойдёт с 1.
TRUNCATE TABLE communities_users;


/*
 * 2. Создадим таблицу с профилем пользователя, чтобы не хранить все данные в таблице users
 * 
 * Сценарий: Необходимо хранить личную информацию пользователей в отдельной таблице.
 * 
 * Какая личная информация нам нужна: пол, возраст, фотография, город, страна.
 * Но как связать пользователя с его личной информацией?
 * 
 * Мы можем сделать это с помощью ссылки на таблицу users. То есть ссылки на конкретного
 * пользователя в таблице users.
 *
 * Например, у Пети id = 1 в таблице users. В таблице profiles мы делаем запись с user_id = 1
 * и можем гарантировать, что в этой записи содержится личная информация Пети. То есть, user_id = 1
 * говорит нам о том, что в записи содержится информация именно для пользователя из таблицы users с 
 * id = 1 и ни для кого другого.
 * 
 * Для связи между таблицами создается foreign key. Он гарантирует, что для каждого user_id существует
 * id в таблице profiles. А также то, что не существует user_id, которому не соответсвует никакой id в users.
 * FOREIGN KEY (user_id) REFERENCES users (id)
 * 
 * Одному пользователю соответствует один профиль. Связь один к одному.
 * 
*/

CREATE TABLE profiles(
	user_id SERIAL PRIMARY KEY, -- BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	gender ENUM('f', 'm', 'x') NOT NULL,
	birhday DATE NOT NULL,
	photo_id BIGINT UNSIGNED NOT NULL,
	city VARCHAR(130),
	country VARCHAR(130),
	FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Заполним таблицу, добавим профили для уже созданных Пети и Васи

INSERT INTO profiles VALUES (1, 'm', '1997-12-01', 1, 'Moscow', 'Russia'); -- профиль Пети

-- INSERT INTO profiles VALUES (5, 'm', '1988-11-02', 5, 'Moscow', 'Russia'); -- ошибка 

INSERT INTO profiles VALUES (2, 'm', '1988-11-02', 2, 'Moscow', 'Russia'); -- профиль Васи
INSERT INTO profiles VALUES (3, 'f', '2005-06-21', 3, 'Tver', 'Russia'); -- профиль Люси
INSERT INTO profiles VALUES (4, 'm', '1998-10-18', 4, 'Minsk', 'Belarus'); -- профиль Вани
INSERT INTO profiles VALUES (5, 'f', '2007-03-14', 5, 'Gdansk', 'Polska'); -- профиль Любы
INSERT profiles (user_id, gender, birhday, photo_id, city, country)
VALUES (6, 'm', '1980-04-01', 6, 'Vladivostok', 'Russia'),
(7, 'm', '1989-01-09', 7, 'Vladivostok', 'Russia'),
(8, 'f', '1999-10-30', 8, 'Sankt-Peterburg', 'Russia'),
(9, 'f', '1979-02-28', 9, 'Vladivostok', 'Russia'),
(10, 'm', '1990-07-12', 10, 'Moscow', 'Russia'),
(11, 'm', '1976-09-21', 11, 'Moscow', 'Russia'),
(12, 'm', '1996-10-29', 12, 'Habarovsk', 'Russia'),
(13, 'm', '2006-01-20', 13, 'Tbilisi', 'Georgia'),
(14, 'f', '1988-07-18', 14, 'Telavi', 'Georgia'),
(15, 'm', '2001-08-08', 15, 'Poti', 'Georgia'),
(16, 'm', '1999-06-22', 16, 'Sochi', 'Russia'),
(17, 'f', '2010-03-20', 17, 'Sochi', 'Russia'),
(18, 'f', '1988-01-20', 18, 'Chishinau', 'Moldova'),
(19, 'm', '1987-11-11', 19, 'Pskov', 'Russia'),
(20, 'm', '2000-01-01', 20, 'Novgorod', 'Russia');


SELECT * FROM profiles;

/*
 * 3. Создадим таблицу с сообщениями пользователей.
 * 
 * Сценарий: Петя отправляет Васе личное сообщение.
 * 
 * Петя может написать сообщения Васе, Сереже, Грише, а Вася может написать также сообщения Пете, Сереже, Грише.
 * Это связь от многих (пользователей) к многим (пользователям).
 * 
 * Что нам необходимо хранить для сообщения? Отправителя сообщения, получателя сообщения, текст сообщения,
 * дату и время создания сообщения и дату и время обновления сообщения. Также можно хранить информацию о том,
 * прочитано ли сообщение.
 * 
 * Отправитель сообщения - это наш Петя. Когда мы смотрим на сообщение в Вконтакте мы видим имя и фамилию отправителя.
 * Нужно ли нам хранить имя и фамилию отправителя в таблице сообщений?
 * Нет, эта информация уже хранится в таблице users, ее нет необходимости дублировать.
 * Мы можем хранить ссылку на отправителя сообщения, Петю из таблицы users. То есть его id из таблицы users.
 * 
 * Обозначим отправителя сообщения через from_user_id. Значит, в from_user_id мы храним 1, id Пети.
 * С этой 1 мы сможем пойти в таблицу users, найти там запись с id = 1, и достать имя и фамилию Пети.
 * 
 * Аналогично для Васи, создаем поле to_user_id - ссылку на получателя сообщения из таблицы users.
 * Будем хранить в to_user_id 2, иначе - id Васи из таблицы users.
 * 
 * 
 * Нам необходимо определить, нужен ли нам айди сообщения в данной таблице. То есть, нужно ли нам как-то уникально
 * идентифицировать каждое сообщение от Пети к Васе, может ли Петя писать несколько сообщений Васе, необходимо
 * ли нам различать эти сообщения?
 * Да, необходимо.
 * Добавляем id сообщения с авто-инкрементом и primary key.
 * 
 * Для связи отправителя сообщения с таблицей users и получателя сообщения с таблицей users создаем два разных
 * FOREIGN KEY, которые направлены на одну и ту же колонку users id.
 * Отправитель сообщения и получатель могут как совпадать, так и не совпадать для одного сообщения. Foreign key
 * нас никак не ограничивает.
 * 
 * Для быстрого поиска всех сообщений, которые отправил отправитель сообщения с конкретным id (например, ищем
 * все сообщения, которые отправил Петя со своим id = 1) создадим индекс
 * для from_user_id. Он неуникальный, так как отправитель сообщения мог отправить много разных сообщений,
 * он может встречаться в нескольких разных записях как отправитель.
 * 
 * Аналогично для получателя сообщения, to_user_id, чтобы быстро искать все сообщения, которые он получил.
 * (Например, все сообщения, которые получил Вася)
 * 
*/

CREATE TABLE messages (
	id SERIAL PRIMARY KEY,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	create_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	is_delievered BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (from_user_id) REFERENCES users (id),
	FOREIGN KEY (to_user_id) REFERENCES users (id)	
);


-- Добавим два сообщения от Пети к Васе, одно сообщение от Васи к Пете

INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Hi!', DEFAULT, DEFAULT, DEFAULT); -- сообщение от Пети к Васе номер 1
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Vasya!', DEFAULT, DEFAULT, DEFAULT); -- сообщение от Пети к Васе номер 2
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'Hi, Petya', DEFAULT, DEFAULT, DEFAULT); -- сообщение от Пети к Васе номер 2
INSERT INTO messages VALUES (DEFAULT, 3, 5, 'Luba, how are you?', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 18, 5, 'Luba, where do you live?', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 13, 10, 'Chris, are you from Russia?', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 2, 16, 'Ildar, when will the snow fall for you? We are going to ski to you to come ...', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 9, 16, 'Ildar, I am from Vladivostok, I want to come to you in Sochi with my friends', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 9, 17, 'Klava, they drove to Ildar to ski', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 5, 3, 'Lusya, i am fine! And you?', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 20, 15, 'Zaza, hello', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 15, 20, 'What do you want brother?', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 4, 13, 'Kaha, the wines have come, we have all drunk', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 13, 4, 'Vano, the borders are closed, wait for the amnesty !!!', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 19, 20, 'Drone, listen to the peppers ...', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 20, 19, 'I only respect vinyl', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 16, 2, 'Vasya, there is snow in St. Petersburg, and even more so here.', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 12, 11, 'Senya, how old are you?', DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM messages;

/*
 * 4. Создадим таблицу запросов в друзья.
 * 
 * Сценарий: Петя хочет добавить Васю в друзья.
 * 
 * Петя может отправить запросы на дружбу Васе, Сереже, Грише, Вася также может отправить запросы Пете, Сереже, Грише.
 * Это связь от многих (пользователей) к многим (пользователям).
 * 
 * Что нам необходимо хранить для запросов в друзья? Отправителя запроса, получателя запроса,
 * статус запроса (принят или отклонен).
 * 
 * Аналогичная ситуация, которая возникла при создании таблицы messages.
 * Мы отдельно храним ссылку на отправителя запроса, from_user_id, и получателя запроса, to_user_id.
 * 
 * Нам необходимо определить, нужен ли нам айди запроса на дружбу в данной таблице. 
 * То есть, изначально определить, может ли Петя послать несколько запросов на дружбу Васе одновременно?
 * Нет, не может. Петя может отправить Васе только один запрос на дружбу. Идентификатор не нужен.
 * 
 * Однако нам нужно уникально идентифицировать пару отправителя запроса и получателя, чтобы Петя не мог
 * несколько раз отправить запрос на дружбу Васе.
 * Для этого мы можем использовать PRIMARY KEY по двум колонкам, так как он у нас не занят.
 * PRIMARY KEY нам будет гарантировать, что пара (Петя, Вася), где Петя - отправитель, Вася - получатель,
 * будет встречаться в таблице всего один раз.
 * 
 * Аналогично таблице messages добавляем foreign keys и индексы.
 * 
*/

CREATE TABLE friend_requests(
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	accepted BOOL DEFAULT FALSE,
	PRIMARY KEY(from_user_id, to_user_id),
	FOREIGN KEY (from_user_id) REFERENCES users (id),
	FOREIGN KEY (to_user_id) REFERENCES users (id)
);

-- Добавим запрос на дружбу от Пети к Васе
INSERT INTO friend_requests VALUES (1, 2, 1);
INSERT friend_requests (from_user_id, to_user_id, accepted)
VALUES (1, 3, 1),
(1, 4, 1),
(19, 20, 1),
(1, 17, 1),
(15, 16, 1),
(13, 14, 1),
(13, 15, 1),
(17, 4, 1),
(18, 19, 1),
(1, 8, 1),
(1, 20, 1),
(3, 17, 1),
(3, 16, 1),
(9, 12, 1),
(9, 20, 1),
(2, 14, 1),
(18, 17, 0),
(9, 14, 1),
(8, 16, 1),
(9, 17, 0);

SELECT * FROM friend_requests;
ALTER TABLE friend_requests ADD CONSTRAINT CHECK(from_user_id != to_user_id);

/*
 * 5. Создадим таблицу сообществ.
 * 
 * Сценарий: Петя создает сообщество.
 * 
 * Петя может создать много сообществ, однако у сообщества может быть только один создатель.
 * Связь от одного (пользователя) к многим (сообществам).
 * 
 * Что нам необходимо хранить для сообщества? Его айди, название, описание, создателя сообщества.
 * 
 * Создатель сообщества - это пользователь. Значит, по стандартной схеме, мы можем хранить ссылку на пользователя
 * на таблицу users. То есть id пользователя из таблицы users. Сразу же создаем и foreign key.
 * Необходимо запомнить, что при связи от одного к многим ссылка и соответсвенно foreign key создается
 * на стороне многих, то есть сообщества в данном случае.
 * 
 * Добавляем также индекс на создателя сообщества (admin_id) для быстрого поиска всех сообществ, у которых создатель
 * пользователь с конкретным id.
 * 
*/

CREATE TABLE communities(
	id SERIAL PRIMARY KEY,
	name VARCHAR(145) NOT NULL,
	description VARCHAR(255),
	admin_id BIGINT UNSIGNED NOT NULL,
	INDEX communities_name_idx (name),
	CONSTRAINT fk_communities_admin_id FOREIGN KEY (admin_id) REFERENCES users (id) 
);
INSERT INTO communities VALUES (DEFAULT, 'Skis', 'Who Loves Downhill Skiing?', 16);
INSERT INTO communities VALUES (DEFAULT, 'Cinema, wine and dominoes', 'There is wine from Batumi !!!', 13);
INSERT INTO communities VALUES (DEFAULT, 'Bath', 'Brooms and how to prepare them.', 6);
INSERT INTO communities VALUES (DEFAULT, 'Concert of Yegor Creed', 'Girls, who is with me?', 5);
INSERT INTO communities VALUES (DEFAULT, 'Sale in Italy', 'Girls and boys, subscribe to the channel', 17);
INSERT INTO communities VALUES (DEFAULT, 'French lessons', 'I give online lessons', 1);
INSERT INTO communities VALUES (DEFAULT, 'Dogs', 'Exhibition in Holland', 12);
INSERT INTO communities VALUES (DEFAULT, 'Sale in France', 'Cuckoos, I am waiting for you in Paris', 17);
INSERT INTO communities VALUES (DEFAULT, 'Cats', 'How to feed kittens?', 14);
INSERT INTO communities VALUES (DEFAULT, 'New Year', 'I invite everyone to celebrate the New Year in Khabarovsk!', 12);
INSERT INTO communities VALUES (DEFAULT, 'Holidays in Egypt', 'Who is with me for the Christmas holidays?', 3);


SELECT * FROM communities;

/*
 * 6. Создадим таблицу для хранения информации обо всех участниках всех сообществ.
 * 
 * Сценарий: Вася вступил в сообщество Number1.
 * 
 * Вася может вступить во много разных сообществ, при этом в одном сообществе может быть много участников.
 * Связь от многих к многим.
 * 
 * Что нам необходимо хранить? Пользователя, сообщество, в которое он вступил, дату вступления в сообщество.
 * 
 * Так как Вася может вступить в сообщество Number1 только один раз, уникальный идентификатор записи нам не нужен (id),
 * используем спецификацию таблицы friend_requests как макет и создаем по аналогии.
*/

CREATE TABLE communities_users(
	community_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY(community_id, user_id),
	FOREIGN KEY (community_id) REFERENCES communities (id),
	FOREIGN KEY (user_id) REFERENCES users (id) 
);

INSERT INTO communities_users VALUES (1, 2);
INSERT INTO communities_users (community_id, user_id)
VALUES (5, 3),
(5, 8),
(5, 9),
(5, 17),
(5, 18),
(2, 2),
(2, 9),
(3, 4),
(3, 1),
(3, 2),
(8, 11),
(8, 15),
(11, 7),
(12, 11),
(11, 19),
(7, 5);


SELECT * FROM communities_users;

/*
 * 7. Создадим таблицу для хранения типов медиа файлов, каталог типов медифайлов.
 * 
 * В таблице-каталоге обычно не хранятся ссылки на другие таблицы.
 * В таблице-каталоге обычно хранятся только айди и название, в данном случае айди типа
 * медиа-файла и название медиа-файла.
 * 
 * Аналогичные каталоги можно создать для списка городов, стран, ...
*/

CREATE TABLE media_types(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL UNIQUE
);

INSERT INTO media_types VALUES (DEFAULT, 'изображение');
INSERT INTO media_types VALUES (DEFAULT, 'музыка');
INSERT INTO media_types VALUES (DEFAULT, 'документ');
INSERT INTO media_types VALUES (DEFAULT, 'видео');

SELECT * FROM media_types;

/*
 * 8. Создадим таблицу всех медиафайлов.
 * 
 * Сценарий: Петя добавляет фотографию.
 * 
 * Петя может добавить много различных медиафайлов, однако у медиафайла может быть только один автор 
 * (тот, кто его добавил).
 * Связь от одного (пользователя) к многим (медиафайлам).
 * 
 * Что нам необходимо хранить для медиафайла? Его айди, создателя, тип, название, размер, дату добавления.
 * 
 * Ссылку на создателя (пользователя) создаем по аналогии с ранее созданными таблицами, добавляем индекс для
 * быстрого поиска медиафайлов пользователя и foreign key.
 * 
 * Также необходимо как-то хранить тип медиа-файла. Можно хранить название типа медиафайла, например, "изображение",
 * "музыка", "документ". Однако, названия типов медиафайлов у нас уже хранятся в нашем каталоге media_types и это будет
 * дублирование данных. Так мы можем хранить не название типа, а ссылку на название типа в каталоге (то есть id типа 
 * медиафайла из таблицы media_types).
 * 
 * У каждого типа медиафайла может быть множество медиафайлов (тип "изображение" может быть у множества медиафайлов),
 * однако у медиафайла может быть только один тип (фотография1 имеет только один тип - "изображение").
 * Так это связь от одного (типа) к многим (медиафайлам).
 * 
 * Создаем колонку media_types_id, где храним id типа из media_types. Создаем foreign key от media_types_id
 * к media_types (id). Индекс не создаем, так как типов медиафайлов будет мало, и индекс будет плохо работать
 * по такой колонке с часто повторяющимися значениями. 
 * 
 * Так в данной таблице у нас получилось две разных связи от одного к многим, которые несвязаны между собой.
*/

CREATE TABLE media(
	id SERIAL PRIMARY KEY,
	user_id BIGINT UNSIGNED NOT NULL,
	media_types_id INT UNSIGNED NOT NULL,
	file_name VARCHAR(255),
	file_size BIGINT UNSIGNED,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users (id),
	FOREIGN KEY (media_types_id) REFERENCES media_types (id)
);

-- Добавим два изображения, которые добавил Петя
INSERT INTO media VALUES (DEFAULT, 1, 1, 'im.jpg', 100, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 1, 1, 'im1.png', 78, DEFAULT);

-- Добавим документ, который добавил Вася
INSERT INTO media VALUES (DEFAULT, 2, 3, 'doc.docx', 1024, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 1, 1, 'im3.jpg', 150, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 5, 3, 'lesson_5.sql', 1024, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 4, 2, 'Around the world.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 4, 2, 'Scar Tissue.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 4, 2, 'Get On Top.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 4, 2, 'Californication.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 4, 2, 'Easily.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 4, 2, 'Savior.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 4, 2, 'Road Trippin.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 3, 2, 'Under The Bridge.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 5, 2, 'My Friends.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 1, 2, 'Save The Population.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 2, 2, 'By The Way.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 12, 3, 'doc1.docx', 1024, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 17, 3, 'doc2.docx', 1024, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 8, 4, 'video1.mp3', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 9, 4, 'video2.mp3', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 17, 1, 'im4.jpg', 150, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 12, 1, 'im5.jpg', 120, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 8, 1, 'im6.jpg', 140, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 14, 1, 'im7.jpg', 100, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 13, 1, 'im8.jpg', 150, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 17, 1, 'im9.jpg', 130, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 1, 2, 'People are strange.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 17, 2, 'Light my fire.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 8, 2, 'Love my two times.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 8, 2, 'Five to one.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 17, 2, 'Hello, I love you.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 9, 2, 'Roadhouse blues.mp4', 2048, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 4, 2, 'Riders on the storm.mp4', 2048, DEFAULT);

SELECT * FROM media;

/* 9. Создадим таблицу постов. 
 * Сценарий: Петя создает некий пост.
 * 
 * Что нам необходимо хранить для поста? Его айди, название, описание, медиафайл, создателя поста.
 * Укажем время создания и обновления.
 * Построим связи с таблицами users & media, откуда брали информацию.
 */

CREATE TABLE posts (
	post_id SERIAL PRIMARY KEY,
	name VARCHAR(145) NOT NULL,
	description VARCHAR(255),
	media_id BIGINT UNSIGNED NOT NULL,
	author_id BIGINT UNSIGNED NOT NULL,
	create_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (media_id) REFERENCES media (id),
	FOREIGN KEY (author_id) REFERENCES users (id)
);

INSERT posts
SET name = 'День моржа!',
description = 'Вчера ходил в баню с друзьями и купался в озере. Всем доброго здоровья!',
media_id = '4',
author_id = '1';
INSERT posts
SET name = 'Кто смотрел вебинар по MySQL?',
description = 'Чёрт ногу сломает',
media_id = '5',
author_id = '5';
INSERT INTO posts (name, description, media_id, author_id)
VALUES ('Смотрите, я в Италии!', 'Распродажа в разгаре:)', 1, 17),
('Новый рассказ!', 'Жду вашей оценки', 3, 17),
('Дрифтуем)))', 'Погнали с нами!', 4, 8),
('Какой красивый закат', 'Невероятные виды Владивостока!', 4, 9),
('Котята', 'Друзья, новый помёт персов)', 1, 12),
('Огонь!', 'Тест новых покрышек...', 1, 8),
('Швейцарские Альпы', 'Мой новый ски-тур, почитайте', 3, 12),
('Грузия!', 'У Кахи в гостях:)', 1, 14);
INSERT INTO posts (name, description, media_id, author_id)
VALUES ('Париж!', 'Подписываемся на канал, делаем заказы!', 1, 17),
('Вино', 'Ничего нет лучше!', 1, 13);

SELECT * FROM posts;



*
 * 10. Создадим таблицу запросов в видеочат.
 * 
 * Сценарий: Петя хочет пообщаться с Васей в видеочате.
 * 
 * Однако, если Петя решит раширить круг общения, то он может отправить запросы Васе, Сереже, Грише, 
 * Вася также может отправить запросы Пете, Сереже, Грише.
 * Это связь от многих (пользователей) к многим (пользователям).
 * 
 * Что нам необходимо хранить для запросов о вступлении в чат? Отправителя запроса, получателя запроса,
 * статус запроса (принят или отклонен).
 * 
 * Аналогичная ситуация, которая возникла при создании таблицы messages.
 * Мы отдельно храним ссылку на отправителя запроса, from_user_id, и получателя запроса, to_user_id.
 * 
 * Нам необходимо определить, нужен ли нам айди запроса на вступление в видеочат в данной таблице. 
 * То есть, изначально определить, может ли Петя послать несколько запросов на создание чата Васе одновременно?
 * Нет, не может. Петя может отправить Васе только один запрос. Идентификатор не нужен.
 * 
 * Однако нам нужно уникально идентифицировать пару отправителя запроса и получателя, чтобы Петя не мог
 * несколько раз отправить запрос Васе.
 * Для этого мы можем использовать PRIMARY KEY по двум колонкам, так как он у нас не занят.
 * PRIMARY KEY нам будет гарантировать, что пара (Петя, Вася), где Петя - отправитель, Вася - получатель,
 * будет встречаться в таблице всего один раз.
 * 
 * Аналогично таблице messages добавляем foreign keys и индексы.
 * 
*/
 
CREATE TABLE video_chats (
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	accepted BOOL DEFAULT FALSE,
	PRIMARY KEY(from_user_id, to_user_id),
	FOREIGN KEY (from_user_id) REFERENCES users (id),
	FOREIGN KEY (to_user_id) REFERENCES users (id)
);

-- Свяжем Петю с Васей
INSERT INTO video_chats VALUES (1, 2, 1);
INSERT INTO video_chats VALUES (1, 4, 1);
INSERT INTO video_chats VALUES (2, 5, 1);
INSERT INTO video_chats VALUES (2, 3, 0);
INSERT INTO video_chats VALUES (12, 8, 1);
INSERT INTO video_chats VALUES (17, 9, 1);
INSERT INTO video_chats VALUES (20, 12, 1);
INSERT INTO video_chats VALUES (13, 15, 1);
INSERT INTO video_chats VALUES (7, 5, 0);
INSERT INTO video_chats VALUES (5, 11, 1);
INSERT INTO video_chats VALUES (8, 1, 1);
INSERT INTO video_chats VALUES (3, 7, 1);
INSERT INTO video_chats VALUES (1, 3, 1);

SELECT * FROM video_chats;

/* 11. Создадим таблицу для хранения плейлистов музыки.
 * 
 * Сценарий: Петя добавляет аудиофайлы из медиатеки.
 * 
 * Петя может сохранять много различных аудиофайлов у себя на страничке под одним именем плэй-листа.
 * 
 * Что нам необходимо хранить для аудиофайла? Его айди, который можно взять из медиатеки. Связь с media.
 * Добавляем индекс для быстрого поиска медиафайлов пользователей и foreign key.
 * Также укажем дату создания и обновления альбома.
 */
CREATE TABLE play_lists (
	ID SERIAL PRIMARY KEY,
	name_play_list VARCHAR(55),
	media_id BIGINT UNSIGNED NOT NULL,
	create_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (media_id) REFERENCES media (id)
);

INSERT INTO play_lists VALUES (DEFAULT, 'Red Hot Chili Peppers', '16', DEFAULT, DEFAULT);
INSERT INTO play_lists VALUES (DEFAULT, 'Red Hot Chili Peppers', '10', DEFAULT, DEFAULT);
INSERT INTO play_lists VALUES (DEFAULT, 'Red Hot Chili Peppers', '17', DEFAULT, DEFAULT);
INSERT INTO play_lists VALUES (DEFAULT, 'Red Hot Chili Peppers', '7', DEFAULT, DEFAULT);
INSERT INTO play_lists VALUES (DEFAULT, 'Red Hot Chili Peppers', '8', DEFAULT, DEFAULT);
INSERT INTO play_lists VALUES (DEFAULT, 'The Doors', '28', DEFAULT, DEFAULT);
INSERT INTO play_lists VALUES (DEFAULT, 'The Doors', '29', DEFAULT, DEFAULT);
INSERT INTO play_lists VALUES (DEFAULT, 'The Doors', '30', DEFAULT, DEFAULT);
INSERT INTO play_lists VALUES (DEFAULT, 'The Doors', '31', DEFAULT, DEFAULT);
INSERT INTO play_lists VALUES (DEFAULT, 'The Doors', '33', DEFAULT, DEFAULT);

SELECT * FROM play_lists;
/*
 * ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке.
 */
SELECT DISTINCT firstname FROM users ORDER BY firstname ASC;

/*iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
 * Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
 */
-- добавим поле is_active в поле profiles
ALTER TABLE profiles ADD COLUMN is_active BOOL;
-- заполним его целиком, по умолчанию, значением TRUE, не используя WHERE...
UPDATE profiles SET is_active = TRUE;
-- посмотрим, что у нас вышло, всё в строчку
SELECT * FROM profiles;
-- добавим ограничение на несовершеннолетних пользователей...
-- исправим грамматику, теперь, с божьей помощью мы знаем, как это делать
ALTER TABLE profiles RENAME COLUMN birhday TO birthday;
-- выберем несовершеннолетних пассажиров, и переведём их в статус неактивных.
UPDATE profiles SET is_active = FALSE WHERE birthday > '2003-11-28';

/* iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
 */
-- сначала скроим мессидж от 2022 года под АЙ-ДИ 6
INSERT INTO messages VALUES (6, 15, 11, 'Test message', '2022-11-11 11:18:00', DEFAULT, DEFAULT);
-- проверим нашу таблицу...
SELECT * FROM messages;
-- теперь удалим сообщения, созданные позже сегодняшней даты... и обратно проверим таблицу - сообщения №6 нет, прекрасно.
DELETE FROM messages WHERE create_at > NOW();




