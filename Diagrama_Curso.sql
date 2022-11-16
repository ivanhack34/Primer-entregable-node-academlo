CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8,
  "id_roles" int
);

CREATE TABLE "users_courses" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "level" int,
  "teacher" varchar,
  "courses_videos_id" int,
  "courses_level" int
);

CREATE TABLE "levels" (
  "id" serial PRIMARY KEY,
  "name" int
);

CREATE TABLE "courses_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "ulr" varchar,
  "courses_id" uuid
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "courses_categorias" (
  "id" uuid PRIMARY KEY,
  "courses_id" uuid,
  "categories" int
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("courses_level") REFERENCES "levels" ("id");

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id_roles") REFERENCES "roles" ("id");

ALTER TABLE "courses_categorias" ADD FOREIGN KEY ("categories") REFERENCES "categories" ("id");

ALTER TABLE "courses_categorias" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

---Mi codigo del dbeaver:


select * from users

select * from roles 

select * from categories 

select * from courses 

select * from courses_videos

select * from levels 

select * from users_courses 



---Sera en niveles del 1 al 3
insert into levels (
	name
) values (
	1
), (
	2
),(
	3
);

insert into roles (
	name
) values (
	'student'
),(
	'teacher'
),(
	'admin'
);

insert into categories  (
	name
) values (
	'Programacion'
),(
	'Administraccion'
),(
	'Diseño'
);

update categories  
set name = 'programming'
where id  = 1;

update categories  
set name = 'management'
where id  = 2;

update categories  
set name = 'design'
where id  = 3;

insert into users (
	id,
	name,
	email,
	"password",
	age,
	id_roles 
) values (
	'36bc456b-1fdf-4209-8647-a3998a7da5c9',
	'Ivan',
	'ivanpolanco@gmail.com',
	'root',
	21,
	3
), (
	'1a2f4aa9-baae-45e9-a56b-35dbbc8bd6c0',
	'Pedro',
	'pedro@gmail.com',
	'adm',
	25,
	2
);

insert into courses  (
	id,
	title,
	description,
	level,
	teacher,
	courses_videos_id,
	courses_level
) values (
	'0ab388b9-aa8b-45d0-938e-65101b3ef365',
	'Programming in react',
	'Perfecto',
	1,
	'Pedro Antonio',
	1,
	1
), (
	'e4a1a72e-aad1-4c70-8c07-327f92f5e12a',
	'Programming in javascript',
	'Nice',
	2,
	'Mario Casta',
	2,
	2
);


insert into courses_videos (
	id,
	title,
	ulr,
	courses_id 
) values (
--	'41deeb67-9dbb-41c0-bb04-5345eebf029e',
--	'video 1',
--	'http/:sadsdsadasasad.com',
--	'0ab388b9-aa8b-45d0-938e-65101b3ef365'

	'0c1b7e34-c40a-4a03-8872-a5c16934c99b',
	'video 2',
	'http:/ssewefsdd.com',
	'e4a1a72e-aad1-4c70-8c07-327f92f5e12a'
);

insert into users_courses (
	id,
	user_id,
	course_id 
) values (
	'3c7e662a-73ee-4bd9-8860-da3d45ca364a',
	'36bc456b-1fdf-4209-8647-a3998a7da5c9',
	'0ab388b9-aa8b-45d0-938e-65101b3ef365'
), (
	'e80f0c9c-0cdf-4415-b150-2d701e9becdb',
	'1a2f4aa9-baae-45e9-a56b-35dbbc8bd6c0',
	'e4a1a72e-aad1-4c70-8c07-327f92f5e12a'
)
