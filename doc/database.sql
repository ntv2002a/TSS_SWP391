drop database if exists SWP391;

Create database SWP391;

USE SWP391;

Create table package(
	package_id int AUTO_INCREMENT,
    title varchar(50),
    description text,
    subject_id int,
    primary key(package_id)
);

Create table user(
	user_id int AUTO_INCREMENT,
    full_name varchar(50),
    email varchar(50),
    mobile char(11),
    password varchar(100),
    avatar_url text,
    status bit,
    note text,
    primary key(user_id)
);

Create table client(
	client_id int AUTO_INCREMENT primary key,
    user_id int,
    mobile char(11),
    address text,
    position varchar(100),
    company varchar(50),
    FOREIGN KEY (user_id) REFERENCES user(user_id) 
);

create table web_contact(
	contact_id int auto_increment primary key,
    category_id int,
    suppoter_id int,
    full_name varchar(50),
    email varchar(50),
    mobile char(11),
    message text,
    response text,
    FOREIGN KEY (suppoter_id) REFERENCES user(user_id)
);

create table setting(
	setting_id int auto_increment primary key,
    type_id int,
    setting_title varchar(50),
    setting_value varchar(50),
    display_order varchar(50),
    status bit,
    description text,
    foreign key (type_id) references setting(setting_id)
);

create table user_role(
	user_id int, 
    setting_id int,
    primary key(user_id, setting_id),
	description text,
	FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (setting_id) REFERENCES setting(setting_id)
);

create table permission(
	screen_id int,
    setting_id int,
    get_all_data bit,
    can_delete bit,
    can_add bit,
    can_edit bit,
    FOREIGN KEY (screen_id) REFERENCES setting(setting_id),
    FOREIGN KEY (setting_id) REFERENCES setting(setting_id)
);

create table subject(
	subject_id int auto_increment primary key,
    subject_code varchar(20),
    subject_name varchar(50),
    manager_id int,
    expert_id int,
    status bit,
    body text,
    FOREIGN KEY (manager_id) REFERENCES user(user_id),
    FOREIGN KEY (expert_id) REFERENCES user(user_id)
);

create table subject_setting(
	setting_id int auto_increment primary key,
    type_id int,
    setting_title varchar(50),
    setting_value varchar(50),
    display_order varchar(50),
    status bit,
    description text,
    subject_id int,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
    FOREIGN KEY (type_id) REFERENCES setting(setting_id)
);

create table lesson(
	lesson_id int auto_increment primary key,
    subject_id int,
    author_id int,
    video_url text,
    file_url text,
    body text,
    module_id int,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
    FOREIGN KEY (author_id) REFERENCES user(user_id),
    FOREIGN KEY (module_id) REFERENCES subject_setting(setting_id)
);

create table class(
	class_id int auto_increment primary key,
    class_code varchar(20),
    combo_id int,
    trainer_id int,
    term_id int,
    status bit,
    description text,
    FOREIGN KEY (combo_id) REFERENCES package(package_id),
    FOREIGN KEY (trainer_id) REFERENCES user(user_id),
    FOREIGN KEY (term_id) REFERENCES setting(setting_id)
);

create table class_setting(
	setting_id int auto_increment primary key,
    type_id int,
    setting_title varchar(50),
    setting_value varchar(50),
    display_order varchar(50),
    status bit,
    description text,
    class_id int,
    FOREIGN KEY (class_id) REFERENCES class(class_id),
    FOREIGN KEY (type_id) REFERENCES setting(setting_id)
);

create table class_lesson(
	class_lesson_id int auto_increment primary key,
    lesson_id int,
    subject_id int,
    class_id int,
    slot_id int,
    FOREIGN KEY (lesson_id) REFERENCES lesson(lesson_id),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
    FOREIGN KEY (class_id) REFERENCES class(class_id),
    FOREIGN KEY (slot_id) REFERENCES class_setting(setting_id)
);

create table team(
	team_id int auto_increment primary key,
    class_id int,
    project_code varchar(50),
    topic_code varchar(50),
    topic_name varchar(50),
    status bit,
    description text
);