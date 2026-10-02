-- AutoServe - Database Schema
-- DDL: Table Creation

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name       VARCHAR(100) NOT NULL,
    Phone      VARCHAR(15)  NOT NULL,
    Email      VARCHAR(100),
    Address    VARCHAR(200)
);

CREATE TABLE Vehicle (
    VehicleID  INT PRIMARY KEY,
    RegNo      VARCHAR(15) NOT NULL UNIQUE,
    Make       VARCHAR(50) NOT NULL,
    Model      VARCHAR(50) NOT NULL,
    MfgYear    INT CHECK (MfgYear >= 1980),
    CustomerID INT NOT NULL REFERENCES Customer(CustomerID)
);

CREATE TABLE Mechanic (
    MechanicID     INT PRIMARY KEY,
    Name           VARCHAR(100) NOT NULL,
    Phone          VARCHAR(15) NOT NULL,
    Specialization VARCHAR(50)
);

CREATE TABLE ServiceJob (
    JobID        INT PRIMARY KEY,
    VehicleID    INT NOT NULL REFERENCES Vehicle(VehicleID),
    MechanicID   INT NOT NULL REFERENCES Mechanic(MechanicID),
    JobDate      DATE NOT NULL,
    LabourCharge NUMERIC(10,2) NOT NULL CHECK (LabourCharge >= 0),
    Status       VARCHAR(20) NOT NULL DEFAULT 'Pending'
                 CHECK (Status IN ('Pending', 'In Progress', 'Completed'))
);

CREATE TABLE SparePart (
    PartID    INT PRIMARY KEY,
    PartName  VARCHAR(100) NOT NULL,
    UnitPrice NUMERIC(10,2) NOT NULL CHECK (UnitPrice > 0),
    StockQty  INT NOT NULL DEFAULT 0 CHECK (StockQty >= 0)
);

CREATE TABLE JobParts (
    JobID    INT NOT NULL REFERENCES ServiceJob(JobID),
    PartID   INT NOT NULL REFERENCES SparePart(PartID),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (JobID, PartID)
);