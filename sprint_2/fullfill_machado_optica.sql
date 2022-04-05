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