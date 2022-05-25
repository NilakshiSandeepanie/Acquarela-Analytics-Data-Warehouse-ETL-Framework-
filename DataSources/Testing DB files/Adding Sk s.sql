ALTER TABLE [Appointment_Mng_DW].[dbo].[DimPhysicians]
ADD DoctorNumber_sk INT IDENTITY(1,1) primary key


ALTER TABLE [Appointment_Mng_DW].[dbo].[DimAllocatedRooms]
ADD RoomNumber_sk INT IDENTITY(1,1) primary key

/*ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);*/

ALTER TABLE [Appointment_Mng_DW].[dbo].[DimPhysicians]
ADD FOREIGN KEY (RoomNumber_sk) REFERENCES [Appointment_Mng_DW].[dbo].[DimAllocatedRooms](RoomNumber_sk)


ALTER TABLE [Appointment_Mng_DW].[dbo].[DimPhysicians]
ADD FOREIGN KEY (RoomNo) REFERENCES [Appointment_Mng_DW].[dbo].[DimAllocatedRooms](RoomNumber_sk)


ALTER TABLE [Appointment_Mng_DW].[dbo].[Load FactAppointmentsUpdated]
ADD FOREIGN KEY (DoctorNumber_sk) REFERENCES [Appointment_Mng_DW].[dbo].[DimPhysicians](DoctorNumber_sk)


ALTER TABLE [Appointment_Mng_DW].[dbo].[Load FactAppointmentsUpdated]
ADD FOREIGN KEY (PatientNumber_sk) REFERENCES [Appointment_Mng_DW].[dbo].[DimPatientsInfo](PatientNumber_sk)

ALTER TABLE [Appointment_Mng_DW].[dbo].[Load FactAppointmentsUpdated]
ADD FOREIGN KEY (ReviewNumber_sk) REFERENCES [Appointment_Mng_DW].[dbo].[DimRatingsandReviews](ReviewNumber_sk)


ALTER TABLE [Appointment_Mng_DW].[dbo].[Load FactAppointmentsUpdated]
ADD FOREIGN KEY (AppointmentDateKey) REFERENCES [Appointment_Mng_DW].[dbo].[DimDate](DateKey)



ALTER TABLE [Appointment_Mng_DW].[dbo].[DimPatientsInfo]
ADD PatientNumber_sk INT IDENTITY(1,1) primary key


ALTER TABLE [Appointment_Mng_DW].[dbo].[DimDate]
ADD Number_sk INT IDENTITY(1,1) primary key

ALTER TABLE [Appointment_Mng_DW].[dbo].[FactAppointments]
ADD PRIMARY KEY (AppointmentID);


ALTER TABLE [Appointment_Mng_DW].[dbo].[DimRatingsandReviews]
ADD ReviewNumber_sk INT IDENTITY(1,1) primary key

ALTER TABLE [Appointment_Mng_DW].[dbo].[DimPhysicians]
ADD DoctorNo INT UNIQUE 


ALTER TABLE [Appointments_Mng_Staging].[dbo].StgAllocatedRoomsInfo
ADD PRIMARY KEY (RoomNo);

ALTER TABLE [DWBI_Medical_DW].[dbo].[DimAllocatedRoomsInfo]
ADD RoomNumber_sk INT IDENTITY(1,1) primary key

ALTER TABLE [DWBI_Medical_DW].[dbo].[DimPatientsInfo]
ADD PatientNumber_sk INT IDENTITY(1,1) primary key

ALTER TABLE [Appointment_Mng_DW].[dbo].[DimPhysiciansInfo]
ADD DoctorNumber_sk INT IDENTITY(1,1) primary key


ALTER TABLE [DWBI_Medical_DW].[dbo].[DimRatings and Reviews]
ADD ReviewNumber_sk INT IDENTITY(1,1) primary key

ALTER TABLE [DWBI_Medical_DW].[dbo].[FactAppointmentsInfo]
ADD ReviewNumber_sk INT IDENTITY(1,1)

ALTER TABLE [DWBI_Medical_DW].[dbo].[FactAppointmentsInfo]
ADD PatientNumber_sk INT IDENTITY(1,1) 

ALTER TABLE [DWBI_Medical_DW].[dbo].[FactAppointmentsInfo]
ADD DoctorNumber_sk INT IDENTITY(1,1) 

ALTER TABLE [DWBI_Medical_DW].[dbo].[FactAppointmentsInfo]
ADD ReviewNumber_sk INT IDENTITY(1,1) primary key

ALTER TABLE [DWBI_Medical_DW].[dbo].[DimPhysiciansInfo]
ADD FOREIGN KEY (RoomNumber_sk) REFERENCES [Appointment_Mng_DW].[dbo].[DimAllocatedRoomsInfo](RoomNumber_sk)