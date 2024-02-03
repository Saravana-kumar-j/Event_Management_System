-- Create table and Insert commands for oracle

create table venue(
venueId number primary key,
venueName varchar(100),
capacity number
);

create table organisations(
organisationId number primary key,
organisationName varchar(100),
contactPerson varchar(100),
email varchar(50),
phone varchar(20)
);

CREATE TABLE events (
eventId NUMBER PRIMARY KEY,
eventName VARCHAR(100),
startDate DATE,
endDate DATE,
venueId NUMBER,
organisationId NUMBER,
FOREIGN KEY (venueId) REFERENCES venue(venueId),
FOREIGN KEY (organisationId) REFERENCES organisations(organisationId)
);

create table Staffs(
staffId number primary key,
staffName varchar(50),
email varchar(50),
phone varchar(20)
);

create table tasks(
taskId number primary key,
staffId number,
eventId number,
status varchar(50),
foreign key(eventId) references events(eventId),
foreign key(staffId) references staffs(staffId)
);

-- Inserting Values:

INSERT ALL
INTO venue (venueId, venueName, capacity) VALUES (1, 'Grand Hall', 500)
INTO venue (venueId, venueName, capacity) VALUES (2, 'Conference Room A', 100)
INTO venue (venueId, venueName, capacity) VALUES (3, 'Exhibition Hall', 800)
INTO venue (venueId, venueName, capacity) VALUES (4, 'Meeting Room B', 50)
INTO venue (venueId, venueName, capacity) VALUES (5, 'Outdoor Garden', 200)
INTO venue (venueId, venueName, capacity) VALUES (6, 'Ballroom', 300)
INTO venue (venueId, venueName, capacity) VALUES (7, 'Boardroom', 20)
INTO venue (venueId, venueName, capacity) VALUES (8, 'Lecture Hall', 150)
INTO venue (venueId, venueName, capacity) VALUES (9, 'Sky Lounge', 50)
INTO venue (venueId, venueName, capacity) VALUES (10, 'Banquet Hall', 400)
SELECT * FROM dual;


INSERT ALL
INTO organisations (organisationId, organisationName, contactPerson, email, phone) VALUES (1, 'Tech Innovators', 'John Doe', 'tech@example.com', '123-456-7890')
INTO organisations (organisationId, organisationName, contactPerson, email, phone) VALUES (2, 'Event Masters', 'Alice Smith', 'eventmasters@example.com', '987-654-3210')
INTO organisations (organisationId, organisationName, contactPerson, email, phone) VALUES (3, 'Global Solutions', 'Mike Johnson', 'global@example.com', '555-123-4567')
INTO organisations (organisationId, organisationName, contactPerson, email, phone) VALUES (4, 'Innovate Now', 'Sarah Lee', 'innovate@example.com', '555-987-6543')
INTO organisations (organisationId, organisationName, contactPerson, email, phone) VALUES (5, 'Marketing Pros', 'Chris Davis', 'marketingpros@example.com', '888-555-1234')
INTO organisations (organisationId, organisationName, contactPerson, email, phone) VALUES (6, 'Business Ventures', 'Emily White', 'business@example.com', '777-999-8888')
INTO organisations (organisationId, organisationName, contactPerson, email, phone) VALUES (7, 'Tech Connect', 'Andrew Brown', 'techconnect@example.com', '666-333-2222')
INTO organisations (organisationId, organisationName, contactPerson, email, phone) VALUES (8, 'Creative Minds', 'Olivia Turner', 'creative@example.com', '444-777-6666')
INTO organisations (organisationId, organisationName, contactPerson, email, phone) VALUES (9, 'Digital Solutions', 'Daniel Miller', 'digital@example.com', '222-888-9999')
INTO organisations (organisationId, organisationName, contactPerson, email, phone) VALUES (10, 'Innovation Hub', 'Sophia Adams', 'innovationhub@example.com', '111-444-3333')
SELECT * FROM dual;

INSERT INTO events (eventId, eventName, startDate, endDate, venueId, organisationId)
VALUES (1, 'Tech Summit', TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2024-05-17', 'YYYY-MM-DD'), 1, 1);

INSERT INTO events (eventId, eventName, startDate, endDate, venueId, organisationId)
VALUES (2, 'Product Launch', TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-02', 'YYYY-MM-DD'), 2, 2);

INSERT INTO events (eventId, eventName, startDate, endDate, venueId, organisationId)
VALUES (3, 'Global Conference', TO_DATE('2024-07-10', 'YYYY-MM-DD'), TO_DATE('2024-07-12', 'YYYY-MM-DD'), 3, 3);

INSERT INTO events (eventId, eventName, startDate, endDate, venueId, organisationId)
VALUES (4, 'Innovation Expo', TO_DATE('2024-08-05', 'YYYY-MM-DD'), TO_DATE('2024-08-07', 'YYYY-MM-DD'), 4, 4);

INSERT INTO events (eventId, eventName, startDate, endDate, venueId, organisationId)
VALUES (5, 'Marketing Seminar', TO_DATE('2024-09-20', 'YYYY-MM-DD'), TO_DATE('2024-09-21', 'YYYY-MM-DD'), 5, 5);

INSERT INTO events (eventId, eventName, startDate, endDate, venueId, organisationId)
VALUES (6, 'Business Symposium', TO_DATE('2024-10-15', 'YYYY-MM-DD'), TO_DATE('2024-10-17', 'YYYY-MM-DD'), 6, 6);

INSERT INTO events (eventId, eventName, startDate, endDate, venueId, organisationId)
VALUES (7, 'Tech Connect Forum', TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_DATE('2024-11-02', 'YYYY-MM-DD'), 7, 7);

INSERT INTO events (eventId, eventName, startDate, endDate, venueId, organisationId)
VALUES (8, 'Creative Workshop', TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_DATE('2024-12-12', 'YYYY-MM-DD'), 8, 8);

INSERT INTO events (eventId, eventName, startDate, endDate, venueId, organisationId)
VALUES (9, 'Digital Solutions Summit', TO_DATE('2025-01-15', 'YYYY-MM-DD'), TO_DATE('2025-01-17', 'YYYY-MM-DD'), 9, 9);

INSERT INTO events (eventId, eventName, startDate, endDate, venueId, organisationId)
VALUES (10, 'Innovation Showcase', TO_DATE('2025-02-28', 'YYYY-MM-DD'), TO_DATE('2025-03-02', 'YYYY-MM-DD'), 10, 10);




INSERT INTO staffs (staffId, staffName, email, phone)
VALUES
(1, 'Alice Johnson', 'alice@example.com', '555-111-2222');

INSERT INTO staffs (staffId, staffName, email, phone)
VALUES
(2, 'Bob Smith', 'bob@example.com', '555-333-4444');

INSERT INTO staffs (staffId, staffName, email, phone)
VALUES
(3, 'Charlie Brown', 'charlie@example.com', '555-555-5555');

INSERT INTO staffs (staffId, staffName, email, phone)
VALUES
(4, 'Diana Miller', 'diana@example.com', '555-777-8888');

INSERT INTO staffs (staffId, staffName, email, phone)
VALUES
(5, 'Eva Turner', 'eva@example.com', '555-999-1111');

INSERT INTO staffs (staffId, staffName, email, phone)
VALUES
(6, 'Frank Davis', 'frank@example.com', '555-444-6666');

INSERT INTO staffs (staffId, staffName, email, phone)
VALUES
(7, 'Grace White', 'grace@example.com', '555-666-3333');

INSERT INTO staffs (staffId, staffName, email, phone)
VALUES
(8, 'Henry Lee', 'henry@example.com', '555-888-2222');

INSERT INTO staffs (staffId, staffName, email, phone)
VALUES
(9, 'Isaac Adams', 'isaac@example.com', '555-222-7777');

INSERT INTO staffs (staffId, staffName, email, phone)
VALUES
(10, 'Julia Taylor', 'julia@example.com', '555-777-9999');



INSERT INTO tasks (taskId, staffId, eventId, status)
VALUES
(1, 1, 1, 'In Progress');

INSERT INTO tasks (taskId, staffId, eventId, status)
VALUES
(2, 2, 1, 'Pending');

INSERT INTO tasks (taskId, staffId, eventId, status)
VALUES
(3, 1, 2, 'Completed');

INSERT INTO tasks (taskId, staffId, eventId, status)
VALUES
(4, 3, 2, 'In Progress');

INSERT INTO tasks (taskId, staffId, eventId, status)
VALUES
(5, 4, 3, 'Pending');

INSERT INTO tasks (taskId, staffId, eventId, status)
VALUES
(6, 5, 3, 'Completed');

INSERT INTO tasks (taskId, staffId, eventId, status)
VALUES
(7, 6, 4, 'In Progress');

INSERT INTO tasks (taskId, staffId, eventId, status)
VALUES
(8, 7, 4, 'Pending');

INSERT INTO tasks (taskId, staffId, eventId, status)
VALUES
(9, 8, 5, 'Completed');

INSERT INTO tasks (taskId, staffId, eventId, status)
VALUES
(10, 9, 5, 'In Progress');