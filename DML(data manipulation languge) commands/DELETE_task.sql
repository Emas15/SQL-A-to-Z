--task : delete all data from the table persons ( not the table itself)


DELETE FROM persons
-- BEST TO use : TRUNCATE -> it is way FASTERR, because in large table the DELETE command is going to be really slow for the logs and protocols behind the scene

TRUNCATE TABLE persons --Delete everything and make table empty


SELECT * 
FROM persons