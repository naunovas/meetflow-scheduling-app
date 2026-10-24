CREATE TABLE IF NOT EXISTS slots (
 id BIGSERIAL PRIMARY KEY,
 day DATE NOT NULL,
 start_time TIME NOT NULL,
 duration_minutes INTEGER NOT NULL CHECK(duration_minutes IN (15,30,45,60,90,120)),
 booked_by TEXT,
 booked_email TEXT,
 UNIQUE(day,start_time),
 CHECK ((booked_by IS NULL AND booked_email IS NULL) OR (booked_by IS NOT NULL AND booked_email IS NOT NULL))
);
