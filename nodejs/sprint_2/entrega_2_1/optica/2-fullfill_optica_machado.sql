USE optica_machado;


INSERT INTO address(address_street, address_num, address_floor,address_door, address_city, address_postal_code, address_country)
VALUES 
		('calle 1', 1, 1, 1, 'Barcelona', 0801, 'ESP'),
		('calle 2', 2, 2, 2, 'Barcelona', 0802, 'ESP'),
		('calle 3', 3, 3, 3, 'Barcelona', 0803, 'ESP'),
		('calle 4', 4, 4, 4, 'Barcelona', 0804, 'ESP'),
		('calle 5', 5, 5, 5, 'Barcelona', 0805, 'ESP'),
		('calle 6', 6, 6, 6, 'Barcelona', 0806, 'ESP'),
		('calle 7', 7, 7, 7, 'Barcelona', 0807, 'ESP'),
		('calle 8', 8, 8, 8, 'Barcelona', 0808, 'ESP'),
		('calle 9', 9, 9, 9, 'Barcelona', 0809, 'ESP'),
		('calle 10', 10, 10, 10, 'Barcelona', 08010, 'ESP'),
		('calle 11', 11, 11, 11, 'Barcelona', 08011, 'ESP'),
		('calle 12', 12, 12, 12, 'Barcelona', 08012, 'ESP'),
		('calle 13', 13, 13, 13, 'Barcelona', 08013, 'ESP'),
		('calle 14', 14, 14, 14, 'Barcelona', 08014, 'ESP'),
		('calle 15', 15, 15, 15, 'Barcelona', 08015, 'ESP'),
		('calle 16', 16, 16, 16, 'Barcelona', 08016, 'ESP'),
		('calle 17', 17, 17, 17, 'Barcelona', 08017, 'ESP'),
		('calle 18', 18, 18, 18, 'Barcelona', 08018, 'ESP'),
		('calle 19', 19, 19, 19, 'Barcelona', 08019, 'ESP'),
		('calle 20', 20, 20, 20, 'Barcelona', 08020, 'ESP'),
		('calle 21', 21, 21, 21, 'Barcelona', 08021, 'ESP'),
		('calle 22', 22, 22, 22, 'Barcelona', 08022, 'ESP'),
		('calle 23', 23, 23, 23, 'Barcelona', 08023, 'ESP'),
		('calle 24', 24, 24, 24, 'Barcelona', 08024, 'ESP'),
		('calle 25', 25, 25, 25, 'Barcelona', 08025, 'ESP'),
		('calle 26', 26, 26, 26, 'Barcelona', 08026, 'ESP'),
		('calle 27', 27, 27, 27, 'Barcelona', 08027, 'ESP'),
		('calle 28', 28, 28, 28, 'Barcelona', 08028, 'ESP'),
		('calle 29', 29, 29, 29, 'Barcelona', 08029, 'ESP'),
		('calle 30', 30, 30, 30, 'Barcelona', 08030, 'ESP');


INSERT INTO frame_type(frame_type)
VALUES
		('flotant'),
		('pasta'),
		('metalica');


INSERT INTO employee(employee_first_name, employee_last_name)
VALUES
		('Hugo', 'Hugo'), 
		('Martín', 'Martín'), 
		('Lucas', 'Lucas'), 
		('Mateo', 'Mateo'), 
		('Leo', 'Leo'), 
		('Daniel', 'Daniel'), 
		('Alejandro', 'Alejandro'), 
		('Pablo', 'Pablo'), 
		('Manuel', 'Manuel'),
		('Álvaro', 'Álvaro');


INSERT INTO provider(provider_name, provider_telephone, provider_fax, provider_nif, address_id)
VALUES
		('Provider 1', 000001, 111111, 222221, 1),
		('Provider 2', 000002, 111112, 222222, 2),
		('Provider 3', 000003, 111113, 222223, 3),
		('Provider 4', 000004, 111114, 222224, 4),
		('Provider 5', 000005, 111115, 222225, 5),
		('Provider 6', 000006, 111116, 222226, 6),
		('Provider 7', 000007, 111117, 222227, 7),
		('Provider 8', 000008, 111118, 222228, 8),
		('Provider 9', 000009, 111119, 222229, 9),
		('Provider 10', 0000010, 1111110, 2222210, 10);


INSERT INTO brand(brand_name, provider_id)
VALUES
		('Brand 1', 1),
		('Brand 2', 1),
		('Brand 3', 1),
		('Brand 4', 2),
		('Brand 5', 2),
		('Brand 6', 2),
		('Brand 7', 3),
		('Brand 8', 3),
		('Brand 9', 3),
		('Brand 10', 4),
		('Brand 11', 5),
		('Brand 12', 5),
		('Brand 13', 6),
		('Brand 14', 6),
		('Brand 15', 7),
		('Brand 16', 7),
		('Brand 17', 8),
		('Brand 18', 9),
		('Brand 19', 10),
		('Brand 20', 10);

INSERT INTO glasses(glasses_grad_left, glasses_grad_right, glasses_frame_color, glasses_glass_color, glasses_price, frame_type_id, brand_id)
VALUES
		(4, 4, 'blue', 'green', 1.99, 3,  12 ),
		(4, 4, 'red', 'blue', 2.99, 2,  11 ),
		(2, 2, 'green', 'blue', 3.99, 2,  17 ),
		(3, 2, 'blue', 'blue', 4.99, 1,  1 ), 
		(4, 2, 'blue', 'green', 5.99, 2,  6 ), 
		(3, 3, 'red', 'blue', 6.99, 2,  20 ),
		(5, 2, 'blue', 'red', 7.99, 2,  8 ), 
		(3, 2, 'green', 'blue', 8.99, 1,  1 ), 
		(5, 2, 'red', 'blue', 9.99, 3,  8 ), 
		(1, 2, 'blue', 'green', 10.99, 1,  9 );


INSERT INTO clients(client_telephone, client_email, client_recommended_by, address_id)
VALUES
		(000001, '1@gmail.com', 1, 10),
		(000002, '2@gmail.com', 1, 11),
		(000003, '3@gmail.com', NULL, 12),
		(000004, '4@gmail.com', 2, 13),
		(000005, '5@gmail.com', 2, 14),
		(000006, '6@gmail.com', NULL, 15),
		(000007, '7@gmail.com', 6, 16),
		(000008, '8@gmail.com', 2, 17),
		(000009, '9@gmail.com', 3, 18),
		(0000010, '10@gmail.com', NULL, 19),
		(0000011, '11@gmail.com', 10, 20),
		(0000012, '12@gmail.com', 8, 21),
		(0000013, '13@gmail.com', 5, 22),
		(0000014, '14@gmail.com', 5, 23),
		(0000015, '15@gmail.com', NULL, 24),
		(0000016, '16@gmail.com', 16, 25),
		(0000017, '17@gmail.com', 13, 26),
		(0000018, '18@gmail.com', NULL, 27),
		(0000019, '19@gmail.com', 2, 28),
		(0000020, '20@gmail.com', 17, 29);


INSERT INTO sale(sale_date, sale_price, client_id, glasses_id, employee_id)
VALUES
		('2022-6-26', 10.99, 10, 8, 3), 
		('2021-10-24', 3.99, 2, 2, 7),
		('2022-2-23', 5.99, 3, 8, 2),
		('2021-5-26', 7.99, 13, 5, 2),
		('2022-9-24', 10.99, 18, 1, 5),
		('2021-11-20', 3.99, 6, 8, 1),
		('2021-4-9', 1.99, 18, 10, 8),
		('2022-9-20', 3.99, 11, 2, 1),
		('2021-8-19', 1.99, 8, 4, 9),
		('2021-7-3', 9.99, 7, 5, 8),
		('2022-5-17', 3.99, 11, 3, 1),
		('2021-4-18', 5.99, 16, 7, 6),
		('2022-3-25', 1.99, 13, 5, 8),
		('2022-8-7', 8.99, 10, 7, 6),
		('2021-2-11', 3.99, 6, 7, 2),
		('2022-11-3', 1.99, 17, 10, 9),
		('2021-3-6', 3.99, 11, 8, 1),
		('2022-7-26', 7.99, 14, 2, 1),
		('2022-4-4', 6.99, 11, 10, 4),
		('2021-8-13', 3.99, 15, 3, 9),
		('2022-11-12', 9.99, 15, 6, 4),
		('2021-11-28', 6.99, 18, 2, 10),
		('2022-9-22', 6.99, 20, 3, 4),
		('2021-7-15', 3.99, 7, 10, 8),
		('2022-11-6', 3.99, 1, 4, 6),
		('2021-7-11', 6.99, 18, 9, 8),
		('2022-10-7', 10.99, 15, 9, 8),
		('2022-5-4', 7.99, 2, 10, 10),
		('2022-6-19', 6.99, 17, 10, 5),
		('2021-5-3', 10.99, 7, 6, 3),
		('2022-12-20', 2.99, 16, 3, 4),
		('2021-3-3', 9.99, 4, 4, 4),
		('2021-11-20', 3.99, 16, 10, 5),
		('2022-6-27', 1.99, 1, 4, 4),
		('2022-1-14', 8.99, 19, 2, 4),
		('2021-4-28', 5.99, 4, 9, 10),
		('2021-9-18', 2.99, 11, 3, 9),
		('2022-1-4', 5.99, 9, 2, 9),
		('2022-12-5', 2.99, 12, 10, 9),
		('2022-7-16', 7.99, 19, 6, 10),
		('2021-3-23', 4.99, 5, 8, 3),
		('2022-7-23', 1.99, 14, 9, 8),
		('2021-11-11', 3.99, 8, 9, 8),
		('2021-11-12', 8.99, 14, 4, 9),
		('2021-11-13', 6.99, 2, 8, 6),
		('2022-2-26', 5.99, 15, 3, 1),
		('2022-2-20', 1.99, 13, 7, 5),
		('2021-12-6', 4.99, 14, 4, 9),
		('2022-7-4', 7.99, 20, 9, 8),
		('2021-12-18', 10.99, 15, 3, 3);