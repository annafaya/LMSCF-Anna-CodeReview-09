1
SELECT last_name
FROM sender WHERE first_name = 'Maria';

2
SELECT first_name , last_name
FROM employee
WHERE birth_date 
BETWEEN '1970-1-1' AND '1995-1-1'

3
SELECT * FROM receiver WHERE `last_name` LIKE '%s'

4
SELECT *
FROM package
WHERE weight < 3;

5
SELECT package.package_id , package.`date_sent` , sender.first_name, sender.last_name, package.weight, receiver.first_name, receiver.last_name
FROM package
INNER JOIN sender ON package.`fk_sender_id` = sender.sender_id
INNER JOIN receiver ON package.fk_receiver_id = receiver.receiver_id

6
SELECT  distribution_center.date_received, address.type , address.street , address.zip, package.package_id, package.date_sent
FROM distribution_center
INNER JOIN address ON distribution_center.`fk_address_id` = address.address_id
INNER JOIN package ON distribution_center.`fk_package_id` = package.package_id
