-- 1. 데이터베이스 생성
CREATE DATABASE fishbread_db;   -- 새로운 데이터베이스를 생성하는 명령어
USE fishbread_db;   -- 작업할 데이터베이스를 선택하는 명령어

-- 2. users 테이블 생성
CREATE TABLE users (   -- 테이블 이름과 사용자 정보를 저장
    user_id INT AUTO_INCREMENT PRIMARY KEY,
-- 사용자 고유 ID를 정수형 데이터 타입으로 설정하고 값을 자동으로 증가시키며 테이블의 고유 식별자로 설정
    name VARCHAR(255) NOT NULL,
-- 사용자 이름을 최대 255개의 문자를 저장할 수 있는 문자열 데이터 타입으로 설정하며 값이 반드시 존재해야 함
    age INT NOT NULL,
-- 사용자 나이를 정수형 데이터 타입으로 설정하며 값이 반드시 존재해야 함
    email VARCHAR(100) UNIQUE,
-- 사용자 이메일을 최대 100개의 문자를 저장할 수 있는 문자열 데이터 타입으로 설정하며 중복된 값은 허용되지 않음
    is_business BOOLEAN DEFAULT FALSE
-- 비즈니스 사용자 여부를 참/거짓으로 저장하며 기본값은 FALSE로 설정
);

-- 3. orders 테이블 생성
CREATE TABLE orders (   -- 테이블 이름과 주문 정보를 저장
    order_id INT AUTO_INCREMENT PRIMARY KEY,
-- 주문 고유 ID를 정수형 데이터 타입으로 설정하고 값을 자동으로 증가시키며 고유 식별자로 설정
    user_id INT,
-- 주문한 사용자의 ID를 저장
    order_date DATE,
-- 주문 날짜를 저장
    amount DECIMAL(10, 2),
-- 주문 금액을 소수점 이하 두 자리까지 표현 가능한 10자리 숫자로 저장
    FOREIGN KEY (user_id) REFERENCES users(user_id)
-- 사용자 테이블의 user_id와 연결하여 참조 관계를 설정
);

-- 4. inventory 테이블 생성
CREATE TABLE inventory (   -- 테이블 이름과 재고 정보를 저장
    item_id INT AUTO_INCREMENT PRIMARY KEY,
-- 재고 항목 고유 ID를 정수형 데이터 타입으로 설정하고 값을 자동으로 증가시키며 고유 식별자로 설정
    item_name VARCHAR(255) NOT NULL,
-- 재고 항목 이름을 최대 255개의 문자를 저장할 수 있는 문자열 데이터 타입으로 설정하며 값이 반드시 존재해야 함
    quantity INT NOT NULL
-- 재고 수량을 정수형 데이터 타입으로 설정하며 값이 반드시 존재해야 함
);

-- 5. sales 테이블 생성
CREATE TABLE sales (   -- 테이블 이름과 판매 정보를 저장
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
-- 판매 고유 ID를 정수형 데이터 타입으로 설정하고 값을 자동으로 증가시키며 고유 식별자로 설정
    order_id INT,
-- 주문 ID를 저장
    item_id INT,
-- 재고 항목 ID를 저장
    quantity_sold INT NOT NULL,
-- 판매된 수량을 정수형 데이터 타입으로 설정하며 값이 반드시 존재해야 함
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
-- 주문 테이블의 order_id와 연결하여 참조 관계를 설정
    FOREIGN KEY (item_id) REFERENCES inventory(item_id)
-- 재고 테이블의 item_id와 연결하여 참조 관계를 설정
);

-- 6. daily_sales 테이블 생성
CREATE TABLE daily_sales (   -- 테이블 이름과 일 매출 정보를 저장
    date DATE PRIMARY KEY,
-- 날짜를 저장하며 고유 식별자로 설정
    total_sales DECIMAL(10, 2) NOT NULL
-- 총 매출 금액을 소수점 이하 두 자리까지 표현 가능한 10자리 숫자로 저장하며 값이 반드시 존재해야 함
);
