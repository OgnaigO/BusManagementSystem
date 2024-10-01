DROP SCHEMA IF EXISTS TRANSPORT CASCADE;
CREATE SCHEMA TRANSPORT;
SET search_path TO TRANSPORT;

CREATE TABLE BUS_STOP (
    STOP_Code SERIAL PRIMARY KEY,
    STOP_NAME VARCHAR(120)
);

CREATE TABLE EMPLOYEE_TYPE (
    Type_no SERIAL PRIMARY KEY,
    Type_Name VARCHAR(25)
);

CREATE TABLE COMPANY (
    C_ID SERIAL PRIMARY KEY,
    C_NAME VARCHAR(25)
);

CREATE TABLE EMPLOYEE (
    E_ID SERIAL PRIMARY KEY,
    E_Name VARCHAR(25),
    Address VARCHAR(150),
    E_Type INTEGER,
    C_ID INTEGER,
    FOREIGN KEY (E_Type) REFERENCES EMPLOYEE_TYPE(Type_no),
    FOREIGN KEY (C_ID) REFERENCES COMPANY(C_ID)
);

CREATE TABLE ROUTE (
    ROUTE_NAME VARCHAR(10) PRIMARY KEY,
    C_ID INTEGER,
    FOREIGN KEY (C_ID) REFERENCES COMPANY(C_ID)
);

CREATE TABLE Route_Type (
    R_ID SERIAL PRIMARY KEY,
    ROUTE_NAME VARCHAR(10),
    R_Type_Name VARCHAR(10),
    First_Stop INTEGER,
    FOREIGN KEY (ROUTE_NAME) REFERENCES ROUTE(ROUTE_NAME),
    FOREIGN KEY (First_Stop) REFERENCES BUS_STOP(STOP_Code)
);

CREATE TABLE BUS (
    BUS_NO SERIAL PRIMARY KEY,
    BUS_NUMBER_PLATE varCHAR(10),
    ROUTE_NAME VARCHAR(10),
    STATUS BOOLEAN,
    FOREIGN KEY (ROUTE_NAME) REFERENCES ROUTE(ROUTE_NAME)
);

CREATE TABLE BUS_TYPE (
    BUS_NO INTEGER PRIMARY KEY,
    Bus_Type_NAME VARCHAR(10),
    Seats INTEGER,
    FOREIGN KEY (BUS_NO) REFERENCES BUS(BUS_NO)
);

CREATE TABLE PASS_SOLD (
    ID SERIAL PRIMARY KEY,
    ROUTE_NAME VARCHAR(12),
	pass_cost integer,
    Pass_sold INTEGER,
    FOREIGN KEY (ROUTE_NAME) REFERENCES ROUTE(ROUTE_NAME)
);


CREATE TABLE Has_ROUTE (
    Schedule_ID SERIAL PRIMARY KEY,
    E_ID INTEGER,
    R_ID INTEGER,
    BUS_NO INTEGER,
    Starting_time TIME,
    FOREIGN KEY (E_ID) REFERENCES EMPLOYEE(E_ID),
    FOREIGN KEY (R_ID) REFERENCES Route_Type(R_ID),
    FOREIGN KEY (BUS_NO) REFERENCES BUS(BUS_NO)
);


CREATE TABLE Has_STOP (
    R_ID INTEGER,
    STOP_NO INTEGER,
    STOP_Code INTEGER,
    time_to_stop TIME,
    PRIMARY KEY (R_ID, STOP_NO),
    FOREIGN KEY (R_ID) REFERENCES Route_Type(R_ID),
    FOREIGN KEY (STOP_Code) REFERENCES BUS_STOP(STOP_Code)
);


CREATE TABLE Contact (
    E_ID INTEGER,
    Contact_no VARCHAR(20),
    PRIMARY KEY (E_ID, Contact_no),
    FOREIGN KEY (E_ID) REFERENCES EMPLOYEE(E_ID)
);

INSERT INTO EMPLOYEE_TYPE (Type_Name) VALUES ('tai xe');
INSERT INTO EMPLOYEE_TYPE (Type_Name) VALUES ('phu xe');
INSERT INTO EMPLOYEE_TYPE (Type_Name) VALUES ('ve sinh');

INSERT INTO COMPANY (C_NAME) VALUES ('HanoiBus');
INSERT INTO COMPANY (C_NAME) VALUES ('HaiyenBus');
INSERT INTO COMPANY (C_NAME) VALUES ('VinBus');


INSERT INTO EMPLOYEE_TYPE (Type_Name) VALUES ('tai xe');
INSERT INTO EMPLOYEE_TYPE (Type_Name) VALUES ('phu xe');
INSERT INTO EMPLOYEE_TYPE (Type_Name) VALUES ('ve sinh');

INSERT INTO COMPANY (C_NAME) VALUES ('HanoiBus');
INSERT INTO COMPANY (C_NAME) VALUES ('HaiyenBus');
INSERT INTO COMPANY (C_NAME) VALUES ('VinBus');

INSERT INTO EMPLOYEE (E_Name, Address, E_Type, C_ID)
VALUES 
('Nguyen Van An', 'So 123, Duong Le Loi, Quan Hoan Kiem, Ha Noi', 1, 1),
('Tran Thi Bao', 'So 456, Duong Nguyen Hue, Quan Hai Ba Trung, Ha Noi', 2, 2),
('Le Van Cuong', 'So 789, Duong Tran Hung Dao, Quan Hoan Kiem, Ha Noi', 1, 3),
('Pham Thanh Dung', 'So 234, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 3, 1),
('Hoang Van Khanh', 'So 567, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 2, 2),
('Vu Thi Mai', 'So 890, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 1, 3),
('Dang Van Hoa', 'So 345, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 2, 1),
('Bui Thi Ha', 'So 678, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 3, 2),
('Do Van Tai', 'So 901, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 1, 3),
('Ho Thi Kim', 'So 456, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 2, 1),
('Ngo Van Thanh', 'So 789, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 1, 2),
('Tran Thi Lan', 'So 123, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Le Van Hien', 'So 234, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 2, 2),
('Phan Thi Thu', 'So 567, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 1, 3),
('Hoang Van Hieu', 'So 890, Duong Tran Hung Dao, Quan Hoan Kiem, Ha Noi', 2, 1),
('Vu Van Trung', 'So 345, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 3, 2),
('Dang Thi Mai', 'So 678, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 1, 3),
('Bui Van Dat', 'So 901, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 2, 1),
('Do Thi Thao', 'So 456, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 1, 2),
('Nguyen Van Thang', 'So 789, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 2, 2),
('Tran Thi Nga', 'So 123, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 3, 1),
('Le Van Hieu', 'So 234, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 2, 2),
('Pham Thi Hoa', 'So 567, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 1, 3),
('Hoang Van Long', 'So 890, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 3, 1),
('Vu Thi Hoai', 'So 345, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 1, 2),
('Dang Van Hien', 'So 678, Duong Tran Hung Dao, Quan Hoan Kiem, Ha Noi', 2, 3),
('Bui Thi Huong', 'So 901, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 3, 1),
('Do Van Khoa', 'So 456, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 1, 2),
('Ho Thi Lan Anh', 'So 789, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 2, 3),
('Nguyen Van Hoang', 'So 123, Duong Nguyen Huu Huan, Quan Hoan Kiem, Ha Noi', 3, 1),
('Tran Thi My Linh', 'So 234, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 2, 2),
('Le Van Tuan', 'So 567, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 1, 3),
('Pham Van Hung', 'So 890, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Hoang Thi Mai', 'So 345, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 2, 2),
('Vu Van Thien', 'So 678, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 1, 3),
('Dang Thi Hong', 'So 901, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 1, 1),
('Bui Van Nam', 'So 456, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 3, 2),
('Do Thi Ngoc', 'So 789, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 1, 3),
('Ho Thi Quynh', 'So 123, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 1, 1),
('Ngo Van Hieu', 'So 234, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 3, 2),
('Tran Thi Thanh', 'So 567, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 1, 1),
('Le Van Dung', 'So 890, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 2, 2),
('Phan Thi Minh', 'So 345, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Hoang Van Huy', 'So 678, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 1, 2),
('Vu Thi Loan', 'So 901, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 2, 3),
('Dang Van Luong', 'So 456, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 3, 1),
('Bui Van Khanh', 'So 789, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 1, 2),
('Do Thi Huong', 'So 123, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 2, 3),
('Ho Thi Phuong', 'So 234, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 3, 1),
('Ngo Van Hoan', 'So 567, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 1, 2),
('Tran Van Thanh', 'So 890, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 2, 3),
('Le Thi Hong', 'So 345, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 3, 1),
('Pham Van Hien', 'So 678, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 1, 2),
('Hoang Thi Ha', 'So 901, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 2, 3),
('Vu Van Anh', 'So 456, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Dang Van Khanh', 'So 789, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 1, 2),
('Bui Thi Mai', 'So 123, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 2, 3),
('Do Van Hieu', 'So 234, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 3, 1),
('Ho Thi Thuy', 'So 567, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 1, 2),
('Ngo Van Tuan', 'So 890, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 2, 3),
('Tran Thi Cam', 'So 345, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 3, 1),
('Le Van Nam', 'So 678, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 1, 2),
('Phan Van Huy', 'So 901, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 2, 3),
('Hoang Thi Ngoc', 'So 456, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 3, 1),
('Vu Van Hung', 'So 789, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 1, 2),
('Dang Thi Nhung', 'So 123, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 2, 3),
('Bui Van Cuong', 'So 234, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 3, 1),
('Do Thi Trang', 'So 567, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 1, 2),
('Ho Thi Lan Anh', 'So 890, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 2, 3),
('Nguyen Van Hoa', 'So 345, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 3, 1),
('Tran Thi My Linh', 'So 678, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 1, 2),
('Le Van Tuan', 'So 901, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 2, 3),
('Pham Van Hung', 'So 456, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Hoang Van Huy', 'So 789, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 1, 2),
('Vu Thi Loan', 'So 123, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 2, 3),
('Dang Van Luong', 'So 234, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 3, 1),
('Bui Van Khanh', 'So 567, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 1, 2),
('Do Thi Huong', 'So 890, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 2, 3),
('Ho Thi Phuong', 'So 345, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 3, 1),
('Ngo Van Hoan', 'So 678, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 1, 2),
('Tran Van Thanh', 'So 901, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 2, 3),
('Le Thi Hong', 'So 456, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 3, 1),
('Pham Van Hien', 'So 789, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 1, 2),
('Hoang Thi Ha', 'So 123, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 2, 3),
('Vu Van Anh', 'So 234, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Dang Van Khanh', 'So 567, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 1, 2),
('Bui Thi Mai', 'So 890, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 2, 3),
('Do Van Hieu', 'So 345, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 3, 1),
('Ho Thi Thuy', 'So 678, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 1, 2),
('Ngo Van Tuan', 'So 901, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 2, 3),
('Tran Thi Cam', 'So 456, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 3, 1),
('Le Van Nam', 'So 789, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 1, 2),
('Phan Van Huy', 'So 890, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 2, 3),
('Hoang Thi Ngoc', 'So 345, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 3, 1),
('Vu Van Hung', 'So 678, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 1, 2),
('Dang Thi Nhung', 'So 901, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 2, 3),
('Bui Van Cuong', 'So 456, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 3, 1),
('Do Thi Trang', 'So 789, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 1, 2),
('Ho Thi Lan Anh', 'So 890, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 2, 3),
('Nguyen Van Hoa', 'So 345, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 3, 1),
('Tran Thi My Linh', 'So 678, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 1, 2),
('Le Van Tuan', 'So 901, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 2, 3),
('Pham Van Hung', 'So 456, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Hoang Van Huy', 'So 789, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 1, 2),
('Vu Thi Loan', 'So 123, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 2, 3),
('Dang Van Luong', 'So 234, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 3, 1),
('Bui Van Khanh', 'So 567, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 1, 2),
('Do Thi Huong', 'So 890, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 2, 3),
('Ho Thi Phuong', 'So 345, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 3, 1),
('Ngo Van Hoan', 'So 678, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 1, 2),
('Tran Van Thanh', 'So 901, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 2, 3),
('Le Thi Hong', 'So 456, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 3, 1),
('Pham Van Hien', 'So 789, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 1, 2),
('Hoang Thi Ha', 'So 123, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 2, 3),
('Vu Van Anh', 'So 234, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Dang Van Khanh', 'So 567, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 1, 2),
('Bui Thi Mai', 'So 890, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 2, 3),
('Do Van Hieu', 'So 345, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 3, 1),
('Ho Thi Thuy', 'So 678, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 1, 2),
('Ngo Van Tuan', 'So 901, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 2, 3),
('Tran Thi Cam', 'So 456, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 3, 1),
('Le Van Nam', 'So 789, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 1, 2),
('Phan Van Huy', 'So 890, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 2, 3),
('Hoang Thi Ngoc', 'So 345, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 3, 1),
('Vu Van Hung', 'So 678, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 1, 2),
('Dang Thi Nhung', 'So 901, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 2, 3),
('Bui Van Cuong', 'So 456, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 3, 1),
('Do Thi Trang', 'So 789, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 1, 2),
('Ho Thi Lan Anh', 'So 890, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 2, 3),
('Nguyen Van Hoa', 'So 345, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 3, 1),
('Tran Thi My Linh', 'So 678, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 1, 2),
('Le Van Tuan', 'So 901, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 2, 3),
('Pham Van Hung', 'So 456, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Hoang Van Huy', 'So 789, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 1, 2),
('Vu Thi Loan', 'So 123, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 2, 3),
('Tran Van Khoa', 'So 567, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 3, 1),
('Le Thi Thu', 'So 890, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 1, 2),
('Pham Van Quan', 'So 345, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 2, 3),
('Hoang Thi Ha', 'So 678, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 3, 1),
('Vu Van Anh', 'So 901, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 1, 2),
('Dang Van Khanh', 'So 456, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 2, 3),
('Bui Thi Mai', 'So 789, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 3, 1),
('Do Van Hieu', 'So 123, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 1, 2),
('Ho Thi Thuy', 'So 234, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 2, 3),
('Ngo Van Tuan', 'So 567, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 3, 1),
('Tran Thi Cam', 'So 890, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 1, 2),
('Le Van Nam', 'So 345, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 2, 3),
('Phan Van Huy', 'So 678, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Hoang Thi Ngoc', 'So 901, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 1, 2),
('Vu Van Hung', 'So 456, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 2, 3),
('Dang Thi Nhung', 'So 789, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 3, 1),
('Bui Van Cuong', 'So 123, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 1, 2),
('Do Thi Trang', 'So 234, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 2, 3),
('Ho Thi Lan Anh', 'So 567, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 3, 1),
('Nguyen Van Hoa', 'So 890, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 1, 2),
('Tran Thi My Linh', 'So 345, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 2, 3),
('Le Van Tuan', 'So 678, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 3, 1),
('Pham Van Hung', 'So 901, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 1, 2),
('Hoang Van Huy', 'So 456, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 2, 3),
('Vu Thi Loan', 'So 789, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Dang Van Luong', 'So 123, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 1, 2),
('Bui Van Khanh', 'So 234, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 2, 3),
('Do Thi Huong', 'So 567, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 3, 1),
('Ho Thi Phuong', 'So 890, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 1, 2),
('Ngo Van Hoan', 'So 345, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 2, 3),
('Tran Van Thanh', 'So 678, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 3, 1),
('Le Thi Hong', 'So 901, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 1, 2),
('Pham Van Hien', 'So 456, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 2, 3),
('Hoang Thi Ha', 'So 789, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 3, 1),
('Vu Van Anh', 'So 123, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 1, 2),
('Dang Van Khanh', 'So 234, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 2, 3),
('Bui Thi Mai', 'So 567, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 3, 1),
('Do Van Hieu', 'So 890, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 1, 2),
('Ho Thi Thuy', 'So 345, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 2, 3),
('Ngo Van Tuan', 'So 678, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 3, 1),
('Tran Thi Cam', 'So 901, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 1, 2),
('Le Van Nam', 'So 456, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 2, 3),
('Phan Van Huy', 'So 789, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Hoang Thi Ngoc', 'So 890, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 1, 2),
('Vu Van Hung', 'So 345, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 2, 3),
('Dang Thi Nhung', 'So 678, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 3, 1),
('Bui Van Cuong', 'So 901, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 1, 2),
('Do Thi Trang', 'So 234, Duong Vo Van Tan, Quan Ba Dinh, Ha Noi', 2, 3),
('Ho Thi Lan Anh', 'So 567, Duong Le Duan, Quan Hoan Kiem, Ha Noi', 3, 1),
('Nguyen Van Hoa', 'So 890, Duong Nguyen Van Cu, Quan Long Bien, Ha Noi', 1, 2),
('Tran Thi My Linh', 'So 345, Duong Tran Phu, Quan Hoang Mai, Ha Noi', 2, 3),
('Le Van Tuan', 'So 678, Duong Nguyen Van Linh, Quan Nam Tu Liem, Ha Noi', 3, 1),
('Pham Van Hung', 'So 901, Duong Le Hong Phong, Quan Hai Ba Trung, Ha Noi', 1, 2),
('Hoang Van Huy', 'So 456, Duong Nguyen Trai, Quan Thanh Xuan, Ha Noi', 2, 3),
('Vu Thi Loan', 'So 789, Duong Vo Thi Sau, Quan Hai Ba Trung, Ha Noi', 3, 1),
('Dang Van Luong', 'So 123, Duong Le Thanh Ton, Quan Hoan Kiem, Ha Noi', 1, 2),
('Bui Van Khanh', 'So 234, Duong Nguyen Hue, Quan Hoan Kiem, Ha Noi', 2, 3);


-- Tìm nhân viên thuộc công ty 1
	SELECT E_Name
	FROM EMPLOYEE
	WHERE C_ID = 1;
-- Tìm biển số xe cùng tình trạng của một tuyến xe
SELECT BUS_NUMBER_PLATE, STATUS
FROM BUS
WHERE ROUTE_NAME = '03B';
-- Tìm nhân viên lái xe bus có hơn 30 người
SELECT E_Name
FROM EMPLOYEE e
INNER JOIN Has_ROUTE hr ON e.E_ID = hr.E_ID
INNER JOIN BUS b ON hr.BUS_NO = b.BUS_NO
INNER JOIN BUS_TYPE bt ON b.BUS_NO = bt.BUS_NO
WHERE bt.Seats > 20;
-- Tìm tổng số lượng nhân viên thuộc từng loại
SELECT et.Type_Name, COUNT(*) AS Employee_Count
FROM EMPLOYEE e
INNER JOIN EMPLOYEE_TYPE et ON e.E_Type = et.Type_no
GROUP BY et.Type_Name;
--
SELECT bs.STOP_NAME, AVG(h.time_to_stop) AS Avg_Arrival_Time
FROM BUS_STOP bs
INNER JOIN Has_STOP h ON bs.STOP_Code = h.STOP_Code
INNER JOIN Route_Type rt ON h.R_ID = rt.R_ID
WHERE rt.ROUTE_NAME = '04'
GROUP BY bs.STOP_NAME;
-- Tìm tuyến xe có số xe bus trung bình cao nhất 
SELECT rt.ROUTE_NAME, AVG(bt.Seats) AS Avg_Seat_Capacity
FROM Route_Type rt
INNER JOIN BUS b ON rt.ROUTE_NAME = b.ROUTE_NAME
INNER JOIN BUS_TYPE bt ON b.BUS_NO = bt.BUS_NO
GROUP BY rt.ROUTE_NAME
ORDER BY Avg_Seat_Capacity DESC
LIMIT 1;
--Xác định những nhân viên không được phân công bất kì tuyến đường nào
WITH employee_routes AS (
    SELECT e.E_ID, hr.R_ID
    FROM EMPLOYEE e
    LEFT JOIN Has_ROUTE hr ON e.E_ID = hr.E_ID
)
SELECT e.E_Name
FROM EMPLOYEE e
WHERE e.E_ID NOT IN (SELECT E_ID FROM employee_routes);
-- Tìm tuyến xe có số vé bán ra cao nhất
SELECT ps.ROUTE_NAME, SUM(Pass_sold) AS Total_Sold_Tickets
FROM PASS_SOLD ps
GROUP BY ps.ROUTE_NAME
ORDER BY Total_Sold_Tickets DESC
LIMIT 1;
-- Tìm các tuyến xe đi đến điểm B
SELECT DISTINCT
    r.ROUTE_NAME
FROM
    Route_Type rt
    JOIN Has_STOP hs ON rt.R_ID = hs.R_ID
    JOIN BUS_STOP bs ON hs.STOP_Code = bs.STOP_Code
    JOIN ROUTE r ON rt.ROUTE_NAME = r.ROUTE_NAME
WHERE
    bs.STOP_NAME = 'Ben xe Nuoc Ngam';

WITH RECURSIVE RoutePath AS (
    -- CTE (Common Table Expression) đệ quy bắt đầu từ các tuyến bắt đầu từ điểm dừng ban đầu
    SELECT RT.R_ID, RT.ROUTE_NAME, RT.First_Stop, 1 AS Depth
    FROM Route_Type RT
    INNER JOIN Has_STOP HS ON RT.R_ID = HS.R_ID
    INNER JOIN BUS_STOP BS ON HS.STOP_Code = BS.STOP_Code
    WHERE BS.STOP_NAME = 'Ben xe Giap Bat'  -- Điểm dừng ban đầu

    UNION ALL

    -- Thực hiện đệ quy để lấy các tuyến tiếp theo trên cùng một đường đi
    SELECT RT.R_ID, RT.ROUTE_NAME, RT.First_Stop, RP.Depth + 1
    FROM Route_Type RT
    INNER JOIN RoutePath RP ON RT.First_Stop = RP.R_ID
)
-- Cuối cùng, lấy ra các tuyến kết thúc tại điểm dừng đích
SELECT DISTINCT RP.ROUTE_NAME
FROM RoutePath RP
INNER JOIN Has_STOP HS ON RP.R_ID = HS.R_ID
INNER JOIN BUS_STOP BS ON HS.STOP_Code = BS.STOP_Code
WHERE BS.STOP_NAME = 'Ben xe Nuoc Ngam'  -- Điểm dừng đích
ORDER BY RP.Depth;
-- Các tuyến xe đi từ có thể đi từ điểm A đến điểm B
WITH RECURSIVE RoutePath AS (
    SELECT RT.R_ID, RT.ROUTE_NAME, RT.First_Stop, 1 AS Depth
    FROM Route_Type RT
    INNER JOIN Has_STOP HS ON RT.R_ID = HS.R_ID
    INNER JOIN BUS_STOP BS ON HS.STOP_Code = BS.STOP_Code
    WHERE BS.STOP_NAME = 'Ben xe Giap Bat' 

    UNION ALL

    SELECT RT.R_ID, RT.ROUTE_NAME, RT.First_Stop, RP.Depth + 1
    FROM Route_Type RT
    INNER JOIN RoutePath RP ON RT.R_ID = RP.First_Stop
)
SELECT DISTINCT RP.ROUTE_NAME
FROM RoutePath RP
INNER JOIN Has_STOP HS ON RP.R_ID = HS.R_ID
INNER JOIN BUS_STOP BS ON HS.STOP_Code = BS.STOP_Code
WHERE BS.STOP_NAME = 'Ben xe Nuoc Ngam'  
ORDER BY RP.ROUTE_NAME;

-- Hàm lấy thứ tự điểm dừng xe bus cho một tuyến xe
CREATE FUNCTION get_route_stops(route_id INTEGER)
RETURNS TABLE (
    STOP_NO INTEGER,
    STOP_Code INTEGER,
    STOP_NAME VARCHAR(120),
    time_to_stop TIME
)
AS $$
BEGIN
    RETURN QUERY
    SELECT HS.STOP_NO, HS.STOP_Code, BS.STOP_NAME, HS.time_to_stop
    FROM Has_STOP HS
    JOIN BUS_STOP BS ON HS.STOP_Code = BS.STOP_Code
    WHERE HS.R_ID = route_id
    ORDER BY HS.STOP_NO;
END;
$$ LANGUAGE plpgsql;

--SELECT * FROM get_route_stops(1);
--Hàm cập nhập tình trạng của xe bus
CREATE OR REPLACE FUNCTION update_bus_status(
    bus_no INTEGER,
    new_status BOOLEAN
)
RETURNS VOID AS $$
BEGIN
    UPDATE BUS
    SET STATUS = new_status
    WHERE BUS_NO = bus_no;
END;
$$ LANGUAGE plpgsql;
--SELECT update_bus_status(1, False);
--Trigger dùng để xóa lịch tình nhân viên khi rời công ty

CREATE OR REPLACE FUNCTION delete_employee_schedule_on_leave_function()
RETURNS TRIGGER AS $$
BEGIN
  DELETE FROM Has_ROUTE WHERE e_id = OLD.e_id;
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER delete_employee_schedule_on_leave
BEFORE DELETE
ON EMPLOYEE
FOR EACH ROW
EXECUTE FUNCTION delete_employee_schedule_on_leave_function();







