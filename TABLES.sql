CREATE TABLE User (
  userId INTEGER PRIMARY KEY,
  username VARCHAR(30) NOT NULL,
  age INTEGER,
  u_password VARCHAR(30) NOT NULL,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE Employee (
  employee_id INTEGER PRIMARY KEY,
  employee_name VARCHAR(30) NOT NULL
);

CREATE TABLE Manager (
  M_ID INTEGER PRIMARY KEY,
  EID INTEGER NOT NULL,
  FOREIGN KEY (EID) REFERENCES Employee(employee_id)
);

CREATE TABLE Stalls (
  stall_Id INTEGER PRIMARY KEY,
  stall_name VARCHAR(30) NOT NULL,
  loc VARCHAR(30) NOT NULL
);

CREATE TABLE Events (
  event_id INTEGER PRIMARY KEY,
  type_id INTEGER NOT NULL,
  event_name VARCHAR(20) NOT NULL,
  INDEX idx_type_id (type_id) -- Adding index on type_id column
);

CREATE TABLE Tickets (
  type_id INTEGER NOT NULL,
  Ticket_id INTEGER PRIMARY KEY,
  type_name VARCHAR(20) NOT NULL,
  FOREIGN KEY (type_id) REFERENCES Events(type_id)
);

CREATE TABLE Rides (
  RID INTEGER,
  Ticket_id INTEGER,
  PRIMARY KEY (RID),
  FOREIGN KEY (Ticket_id) REFERENCES Tickets(Ticket_id)
);

CREATE TABLE Shows (
  SID INTEGER,
  Ticket_id INTEGER,
  PRIMARY KEY (SID),
  FOREIGN KEY (Ticket_id) REFERENCES Tickets(Ticket_id)
);

CREATE TABLE Games (
  GID INTEGER,
  Ticket_id INTEGER,
  PRIMARY KEY (GID),
  FOREIGN KEY (Ticket_id) REFERENCES Tickets(Ticket_id)
);

CREATE TABLE WorksIn (
  stall_id INTEGER,
  employee_id INTEGER NOT NULL,
  PRIMARY KEY (stall_id, employee_id),
  FOREIGN KEY (stall_id) REFERENCES Stalls(stall_Id),
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE Attendee (
  attendee_Id INTEGER,
  Ticket_id INTEGER PRIMARY KEY,
  FOREIGN KEY (attendee_Id) REFERENCES User(userId)
);

CREATE TABLE Admin (
  admin_id INTEGER PRIMARY KEY,
  admin_name VARCHAR(30) NOT NULL
);
CREATE TABLE AdminLog (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  admin_id INT NOT NULL,
  action VARCHAR(255) NOT NULL,
  action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserting dummy data into the User table
INSERT INTO User (userId, username, age, u_password, name) VALUES
(1, 'john_doe', 25, 'password123', 'John Doe'),
(2, 'jane_smith', 30, 'pass123', 'Jane Smith'),
(3, 'bob_jones', 35, 'bob123', 'Bob Jones');

-- Inserting dummy data into the Employee table
INSERT INTO Employee (employee_id, employee_name) VALUES
(101, 'Alice'),
(102, 'Bob'),
(103, 'Charlie');

-- Inserting dummy data into the Manager table
INSERT INTO Manager (M_ID, EID) VALUES
(1, 101),
(2, 102),
(3, 103);

-- Inserting dummy data into the Stalls table
INSERT INTO Stalls (stall_Id, stall_name, loc) VALUES
(1, 'Food Stall', 'Central Area'),
(2, 'Game Stall', 'North Area'),
(3, 'Gift Stall', 'South Area');

-- Inserting dummy data into the Events table
INSERT INTO Events (event_id, type_id, event_name) VALUES
(1, 101, 'Concert'),
(2, 102, 'Magic Show'),
(3, 103, 'Carnival');

-- Inserting dummy data into the Tickets table
INSERT INTO Tickets (type_id, Ticket_id, type_name) VALUES
(101, 1001, 'Concert Ticket'),
(102, 1002, 'Magic Show Ticket'),
(103, 1003, 'Carnival Ticket');

-- Inserting dummy data into the Rides table
INSERT INTO Rides (RID, Ticket_id) VALUES
(1, 1003),
(2, 1003),
(3, 1003);

-- Inserting dummy data into the Shows table
INSERT INTO Shows (SID, Ticket_id) VALUES
(1, 1001),
(2, 1001),
(3, 1002);

-- Inserting dummy data into the Games table
INSERT INTO Games (GID, Ticket_id) VALUES
(1, 1003),
(2, 1003),
(3, 1003);

-- Inserting dummy data into the WorksIn table
INSERT INTO WorksIn (stall_id, employee_id) VALUES
(1, 101),
(2, 102),
(3, 103);

-- Inserting dummy data into the Attendee table
INSERT INTO Attendee (attendee_Id, Ticket_id) VALUES
(1, 1001),
(2, 1002),
(3, 1003);

-- Inserting dummy data into the Admin table
INSERT INTO Admin (admin_id, admin_name) VALUES
(1, 'Admin1'),
(2, 'Admin2'),
(3, 'Admin3');

DELIMITER //