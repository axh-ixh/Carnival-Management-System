CREATE TRIGGER PreventStallDeletion
BEFORE DELETE ON Stalls
FOR EACH ROW
BEGIN
    DECLARE employee_count INT;
    SELECT COUNT(*) INTO employee_count
    FROM WorksIn
    WHERE stall_id = OLD.stall_Id;

    IF employee_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete stall with assigned employees';
    END IF;
END //

DELIMITER ;

-- UpdateEmployeeCount Trigger
DELIMITER //
CREATE TRIGGER UpdateEmployeeCount
AFTER INSERT ON WorksIn
FOR EACH ROW
BEGIN
    UPDATE Stalls
    SET employeecount = employeecount + 1
    WHERE stall_id = NEW.stall_id;
END //
DELIMITER ;