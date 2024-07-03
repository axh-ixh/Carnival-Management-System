CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUser`(
  IN p_userId INT,
  IN p_username VARCHAR(255),
  IN p_age INT,
  IN p_password VARCHAR(255),
  IN p_name VARCHAR(255)
)
BEGIN
  INSERT INTO User (userId, username, age, u_password, name)
  VALUES (p_userId, p_username, p_age, p_password, p_name);
END //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignEmployeeToStall`(
  IN p_stall_id INT,
  IN p_employee_id INT
)
BEGIN
  INSERT INTO WorksIn (stall_id, employee_id)
  VALUES (p_stall_id, p_employee_id);
END //

CREATE DEFINER=`root`@`localhost` PROCEDURE `PrintEvents`()
BEGIN
    
    DECLARE event_id_var INT;
    DECLARE type_id_var INT;
    DECLARE event_name_var VARCHAR(255);
    
    
    DECLARE events_cursor CURSOR FOR
        SELECT event_id, type_id, event_name FROM Events;
    
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET @finished = 1;

    
    SET @finished = 0;
    
    
    OPEN events_cursor;
    
    
    print_rows: LOOP
        
        FETCH events_cursor INTO event_id_var, type_id_var, event_name_var;
        
        
        IF @finished = 1 THEN
            LEAVE print_rows;
        END IF;
        
        
        SELECT CONCAT('Event ID: ', event_id_var, ', Type ID: ', type_id_var, ', Event Name: ', event_name_var) AS Event_Info;
    END LOOP;
    
    
    CLOSE events_cursor;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `PrintTicketCount`()
BEGIN
    -- Declare variable to store ticket count
    DECLARE ticket_count INT;
    
    -- Get the count of tickets
    SELECT COUNT(*) INTO ticket_count FROM Tickets;
    
    -- Print the ticket count
    SELECT CONCAT('Total number of tickets: ', ticket_count) AS Ticket_Count;
END

DELIMITER //