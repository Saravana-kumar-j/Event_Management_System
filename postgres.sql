-- Commands for Postgres:

create table venue(
venueId int primary key,
venueName varchar(100),
capacity int
);

create table organisations(
organisationId int primary key,
organisationName varchar(100),
contactPerson varchar(100),
email varchar(50),
phone varchar(20)
);

create table events(
eventId int primary key,
eventName varchar(100),
startDate date,
endDate date,
venueId int,
organisationId int,
foreign key(venueId) references venue(venueId),
foreign key(organisationId) references organisations(organisationId)
);

create table staffs(
staffId int primary key,
staffName varchar(50),
email varchar(50),
phone varchar(20)
);

create table tasks(
taskId int primary key,
staffId int,
eventId int,
status varchar(50),
foreign key(eventId) references events(eventId),
foreign key(staffId) references staffs(staffId)
);

-- Values

INSERT INTO Venue (VenueId, VenueName, Capacity)
VALUES
(1, 'Grand Hall', 500),
(2, 'Conference Room A', 100),
(3, 'Exhibition Hall', 800),
(4, 'Meeting Room B', 50),
(5, 'Outdoor Garden', 200),
(6, 'Ballroom', 300),
(7, 'Boardroom', 20),
(8, 'Lecture Hall', 150),
(9, 'Sky Lounge', 50),
(10, 'Banquet Hall', 400);


INSERT INTO Organisations (OrganisationId, OrganisationName, ContactPerson, Email, Phone)
VALUES
(1, 'Tech Innovators', 'John Doe', 'tech@example.com', '123-456-7890'),
(2, 'Event Masters', 'Alice Smith', 'eventmasters@example.com', '987-654-3210'),
(3, 'Global Solutions', 'Mike Johnson', 'global@example.com', '555-123-4567'),
(4, 'Innovate Now', 'Sarah Lee', 'innovate@example.com', '555-987-6543'),
(5, 'Marketing Pros', 'Chris Davis', 'marketingpros@example.com', '888-555-1234'),
(6, 'Business Ventures', 'Emily White', 'business@example.com', '777-999-8888'),
(7, 'Tech Connect', 'Andrew Brown', 'techconnect@example.com', '666-333-2222'),
(8, 'Creative Minds', 'Olivia Turner', 'creative@example.com', '444-777-6666'),
(9, 'Digital Solutions', 'Daniel Miller', 'digital@example.com', '222-888-9999'),
(10, 'Innovation Hub', 'Sophia Adams', 'innovationhub@example.com', '111-444-3333');


INSERT INTO Events (EventId, EventName, StartDate, EndDate, VenueId, OrganisationId)
VALUES
(1, 'Tech Summit', '2024-05-15', '2024-05-17', 1, 1),
(2, 'Product Launch', '2024-06-01', '2024-06-02', 2, 2),
(3, 'Global Conference', '2024-07-10', '2024-07-12', 3, 3),
(4, 'Innovation Expo', '2024-08-05', '2024-08-07', 4, 4),
(5, 'Marketing Seminar', '2024-09-20', '2024-09-21', 5, 5),
(6, 'Business Symposium', '2024-10-15', '2024-10-17', 6, 6),
(7, 'Tech Connect Forum', '2024-11-01', '2024-11-02', 7, 7),
(8, 'Creative Workshop', '2024-12-10', '2024-12-12', 8, 8),
(9, 'Digital Solutions Summit', '2025-01-15', '2025-01-17', 9, 9),
(10, 'Innovation Showcase', '2025-02-28', '2025-03-02', 10, 10);


INSERT INTO Staffs (StaffId, StaffName, Email, Phone)
VALUES
(1, 'Alice Johnson', 'alice@example.com', '555-111-2222'),
(2, 'Bob Smith', 'bob@example.com', '555-333-4444'),
(3, 'Charlie Brown', 'charlie@example.com', '555-555-5555'),
(4, 'Diana Miller', 'diana@example.com', '555-777-8888'),
(5, 'Eva Turner', 'eva@example.com', '555-999-1111'),
(6, 'Frank Davis', 'frank@example.com', '555-444-6666'),
(7, 'Grace White', 'grace@example.com', '555-666-3333'),
(8, 'Henry Lee', 'henry@example.com', '555-888-2222'),
(9, 'Isaac Adams', 'isaac@example.com', '555-222-7777'),
(10, 'Julia Taylor', 'julia@example.com', '555-777-9999');


INSERT INTO Tasks (TaskId, StaffId, EventId, Status)
VALUES
(1, 1, 1, 'In Progress'),
(2, 2, 1, 'Pending'),
(3, 1, 2, 'Completed'),
(4, 3, 2, 'In Progress'),
(5, 4, 3, 'Pending'),
(6, 5, 3, 'Completed'),
(7, 6, 4, 'In Progress'),
(8, 7, 4, 'Pending'),
(9, 8, 5, 'Completed'),
(10, 9, 5, 'In Progress');

-- 1. Create view to project all the venues with capacity in ascending order.

create view_venue
as
select * from venue
orderby 
capacity asc;

-- 2. Trigger to check event conflict.

CREATE OR REPLACE FUNCTION check_event_conflict()
RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM events
    WHERE venueId = NEW.venueId
      AND startDate = NEW.startDate
  ) THEN
    RAISE EXCEPTION 'Event at this venue on the same date already exists.';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER event_conflict_trigger
BEFORE INSERT ON events
FOR EACH ROW
EXECUTE FUNCTION check_event_conflict();

-- Conflicting values to check the trigger

INSERT INTO events (eventId, eventName, startDate, endDate, venueId, organisationId)
VALUES
(11, 'Event1', '2024-03-18', '2024-03-20', 1, 1),
(12, 'Event2', '2024-03-18', '2024-03-20', 1, 2),
(13, 'Event3', '2024-03-21', '2024-03-23', 2, 3);

--------------------

-- 3. View to Display Events with Venue Details:

CREATE OR REPLACE VIEW view_event_venue AS
SELECT
  e.eventId,
  e.eventName,
  e.startDate,
  e.endDate,
  v.venueName,
  v.capacity
FROM events e
JOIN venue v ON e.venueId = v.venueId;

--------------------

-- 4. View to Display Event Tasks with Staff Details:

CREATE OR REPLACE VIEW view_event_tasks AS
SELECT
  t.taskId,
  e.eventName,
  s.staffName,
  t.status
FROM tasks t
JOIN events e ON t.eventId = e.eventId
JOIN staffs s ON t.staffId = s.staffId;

--------------------

-- 5. Delete Cascade trigger:

CREATE OR REPLACE FUNCTION delete_event_cascade()
RETURNS TRIGGER AS $$
BEGIN
  -- Set the foreign key in tasks table to NULL before deleting the event
  UPDATE tasks SET eventId = NULL WHERE eventId = OLD.eventId;
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_event_cascade_trigger
BEFORE DELETE ON events
FOR EACH ROW EXECUTE FUNCTION delete_event_cascade();

--------------------

-- 6. View to Display Available Venues:.

CREATE OR REPLACE VIEW view_available_venues AS
SELECT
  v.venueId,
  v.venueName,
  v.capacity
FROM venue v
LEFT JOIN events e ON v.venueId = e.venueId
WHERE e.eventId IS NULL;