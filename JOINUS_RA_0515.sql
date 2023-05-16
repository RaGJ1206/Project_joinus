----- ���̺� ���� -----
drop TABLE wishlist;
drop TABLE cart;
drop table products_purchase_table;
drop table products_table cascade constraints;
drop table store_table cascade constraints;
drop table business_table cascade constraints;
drop table file_product_table;
drop table customers_table;
drop table file_store_table;
----- ������ ���� -----
drop sequence customers_seq;
drop sequence business_seq;
drop sequence store_seq;
drop sequence products_seq;
drop sequence file_seq;
drop sequence wish_seq;
drop sequence cart_seq;
drop sequence file_store_seq;
----- ������ ���� -----
create sequence customers_seq INCREMENT BY 1 START WITH 1;
create sequence business_seq INCREMENT BY 1 START WITH 1;
create sequence store_seq INCREMENT BY 1 START WITH 1;
create sequence products_seq INCREMENT BY 1 START WITH 1;
create sequence file_seq INCREMENT BY 1 START WITH 1;
create sequence wish_seq INCREMENT BY 1 START WITH 1;
create sequence cart_seq INCREMENT BY 1 START WITH 1;
create sequence file_store_seq INCREMENT BY 1 START WITH 1;
----- ���̺� ���� -----
-- �� ���� ���̺�
-- u_id(�ߺ� ����), u_pwd, u_name, u_email, u_phone�� �Է� �ʼ�
create table customers_table(
                                uno number not null primary key,
                                u_id varchar2(100) unique not null,
                                u_pwd varchar2(100) not null,
                                u_name varchar2(100) not null,
                                u_email varchar2(100) not null,
                                u_phone varchar2(100) not null,
                                u_addresscode varchar2(100),
                                u_addressStreet varchar2(100),
                                u_addressDetail varchar2(100),
                                buyPoint number,
                                auth char default 'A',
                                payPoint number,
                                wish_cnt number default 0,
                                cart_cnt number default 0
);
update customers_table set buyPoint = 740000 where u_id = 'user1';
-- ����� ���� ���̺�
-- b_name, b_id(�ߺ� ����), b_pwd1, b_pwd2, b_email, b_phone�� �Է� �ʼ�
create table business_table(
                               bno number not null primary key,
                               b_name varchar2(100) not null,
                               b_id varchar2(100) unique not null,
                               b_pwd varchar2(100) not null,
                               b_email varchar2(100) not null,
                               b_phone varchar2(100) not null,
                               b_addresscode varchar2(100) not null,
                               b_addressStreet varchar2(100) not null,
                               b_addressDetail varchar2(100) not null,
                               auth char default 'A'
);
-- ���� ���� ���̺�
-- s_name, s_addr�� �Է� �ʼ�, s_url�� ���� ����� �����״� �н�
create table store_table(
                            sno number not null primary key,
                            bno number,
                            storeName varchar2(100) not null,
                            storeAddress varchar2(100) not null,
                            storeInst varchar2(100) not null,
                            storeURL varchar2(100),
                            storeImages varchar2(100),
                            storeNumber VARCHAR2(100),
                            foreign key (bno) references business_table(bno)
);
-- ���� ����� ���̺�
create table file_store_table(
                                   fno number not null primary key,
                                   sno number,
                                   fileName varchar2(50),
                                   uploadPath varchar2(50),
                                   uuid varchar2(50),
                                   image varchar2(1), -- ������̸� 'T', �������� 'I'
                                   foreign key(sno) references store_table(sno)
);
-- ��ǰ ���� ���̺�
-- p_name, p_intr, p_detail�� �Է� �ʼ�
create table products_table(
                               sno number,
                               pno number not null primary key,
                               p_name varchar2(100) not null,
                               p_subtitle varchar2(100) not null,
                               p_content varchar2(200) not null,
                               p_period varchar2(100), -- ���ڿ��� ���ڷ� ����
                               p_category varchar2(100),
                               p_price number,
                               foreign key (sno) references store_table(sno)
);
-- ��ǰ ����� ���̺�
create table file_product_table(
                                   fno number not null primary key,
                                   pno number,
                                   fileName varchar2(50),
                                   uploadPath varchar2(50),
                                   uuid varchar2(50),
                                   image varchar2(1), -- ������̸� 'T', �������� 'I'
                                   foreign key(pno) references products_table(pno)
);
-- �� ��� ���̺�
CREATE TABLE wishlist (
                          wno NUMBER(10) PRIMARY KEY,
                          pno NUMBER(10) NOT NULL,
                          u_id varchar2(100) ,
                          w_date DATE NOT NULL,
                          FOREIGN KEY (pno) REFERENCES products_table(pno) ON DELETE CASCADE,
                          FOREIGN KEY (u_id) REFERENCES customers_table(u_id) ON DELETE CASCADE,
                          CONSTRAINT unique_wishlist UNIQUE (pno, u_id)
);
-- ��ٱ��� ���̺�
create table cart(
                     cno number(10) PRIMARY KEY,
                     pno number(10) NOT NULL,
                     u_id varchar2(100),
                     w_date DATE NOT NULL,
                     quantity NUMBER(10) NOT NULL,
                     foreign key (u_id) references customers_table(u_id) ON DELETE CASCADE,
                     foreign key (pno) references products_table(pno) ON DELETE CASCADE,
                     CONSTRAINT unique_cart UNIQUE (pno, u_id)
);
-- ���� ��ǰ ���̺�
create table products_purchase_table (
    sno number,
    u_id varchar2(200),
    pno number,
    p_name varchar2(200),
    p_period number,
    p_price number,
    memo varchar2(200),
    foreign key (pno) references products_table(pno) ON DELETE CASCADE,
    foreign key (u_id) references customers_table(u_id) ON DELETE CASCADE,
    foreign key (sno) references store_table(sno) ON DELETE CASCADE
);
-- drop table products_purchase_table;
commit;
----- ���� ������ -----
insert into customers_table values (customers_seq.nextval, 'user1', '1234', 'name1', 'user1@naver.com',
                                    '010-1111-1111', '���ν�', 'ó�ȱ�', '���ּ�', 100000, 'A', 100, 1, 1);
insert into customers_table values (customers_seq.nextval, 'user2', '1234', 'name2', 'user2@naver.com',
                                    '010-1111-2222', '������', '��ȱ�', '���ּ�',  100, 'A', 100, 1, 1);
insert into customers_table values (customers_seq.nextval, 'user3', '1234', 'name3', 'user3@naver.com',
                                    '010-1111-3333', '�����', '���빮��', '���ּ�', 100, 'A', 100, 1, 1);
insert into business_table values (business_seq.nextval, 'business1', 'bs1', '1234', '1234','123', 'bs1@naver.com', '010-2222-1111',
                                   '������ ���뱸', 'B');
insert into business_table values (business_seq.nextval, 'business2', 'bs2', '1234', '1234','123', 'bs1@naver.com', '010-2222-1111',
                                   '������ ���뱸', 'B');
insert into business_table values (business_seq.nextval, 'business3', 'bs3', '1234', '1234','123', 'bs1@naver.com', '010-2222-1111',
                                   '������ ���뱸', 'B');
insert into store_table values (store_seq.nextval, 1, 'astore', '������ ���뱸', 'is AStore', 'www.naver.com',
                                '������̹���', 1);
insert into store_table values (store_seq.nextval, 2, 'bstore', '������ ���뱸', 'is BStore', 'www.naver.com',
                                '������̹���', 2);
insert into store_table values (store_seq.nextval, 3, 'cstore', '������ ���뱸', 'is CStore', 'www.naver.com',
                                '������̹���', 3);


insert into products_table values (1, products_seq.nextval, 'product1', 'is Product1', 'Porduct1 Detail',
                                   '1', 'traffic',10000);
insert into products_table values (2, products_seq.nextval, 'product2', 'is Product2', 'Porduct1 Detai2',
                                   '2', 'physical fitness',20000);
insert into products_table values (3, products_seq.nextval, 'product3', 'is Product3', 'Porduct1 Detai3',
                                   '3', 'academy',30000);
insert into file_product_table values (file_seq.nextval, 1, 'thumbnail1.png', 'thumbnail/1/1', 'aaa', 'T');
insert into file_product_table values (file_seq.nextval, 2, 'thumbnail2.png', 'thumbnail/2/2', 'bbb', 'T');
insert into file_product_table values (file_seq.nextval, 3, 'thumbnail3.png', 'thumbnail/3/3', 'ccc', 'T');
insert into file_product_table values (file_seq.nextval, 3, 'thumbnail4.png', 'thumbnail/3/3', 'ccc', 'T');
insert into file_product_table values (file_seq.nextval, 3, 'thumbnail5.png', 'thumbnail/3/3', 'ccc', 'T');

insert into wishlist values(wish_seq.nextval, 1, 'user1', sysdate);
insert into wishlist values(wish_seq.nextval, 2, 'user2', sysdate);
insert into wishlist values(wish_seq.nextval, 3, 'user3', sysdate);
insert into cart values(cart_seq.nextval, 1, 'user1', sysdate, 1);
insert into cart values(cart_seq.nextval, 2, 'user2', sysdate, 2);
insert into cart values(cart_seq.nextval, 3, 'user3', sysdate, 3);
----- ���̵����� Ȯ�� -----
select * from customers_table;
select * from business_table;
select * from store_table;
select * from products_table;
select * from file_product_table;
select * from wishlist;
select * from cart;
select * from products_purchase_table;
select * from file_store_table;
commit;