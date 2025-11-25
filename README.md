📘 Online Health Consultation Platform

A Java-based web application that allows users to register, log in, book doctor appointments, view their appointments, update profiles, and contact support. Admins can add doctors and manage system data.

🚀 Features
👤 User Features

User Registration & Login

User Dashboard (Smart UI)

Book Appointment with doctor

View My Appointments

Edit Profile (Name, Email, Age, Gender, Password)

Support Page (Submit queries)

Logout

🩺 Admin Features

Admin Login

Add Doctor (Name, Specialization, Email, Phone)

Admin Dashboard

View Doctors

Manage Appointments (optional extension)

⚙️ Technical Features

Built with JSP + Servlets + JDBC + MySQL

Secure login using session management

Proper architecture with DAO, Model, Controller

Attractive UI using modern CSS

Tomcat 10 Compatible

MySQL Connector 9.4 integrated

🏗️ Project Structure
Online-Health-Consultation/
│
├── src/
│   ├── controller/
│   │   ├── LoginServlet.java
│   │   ├── RegisterServlet.java
│   │   ├── LogoutServlet.java
│   │   ├── BookAppointmentServlet.java
│   │   ├── MyAppointmentsServlet.java
│   │   ├── DoctorListServlet.java
│   │   ├── UpdateProfileServlet.java
│   │   └── SupportServlet.java
│   │
│   ├── dao/
│   │   ├── UserDAO.java
│   │   ├── AppointmentDAO.java
│   │   └── DoctorDAO.java
│   │
│   ├── model/
│   │   ├── User.java
│   │   ├── Doctor.java
│   │   └── Appointment.java
│   │
│   └── DBConnection.java
│
├── webapp/
│   ├── index.jsp
│   ├── register.jsp
│   ├── user_dashboard.jsp
│   ├── admin_dashboard.jsp
│   ├── book_appointment.jsp
│   ├── my_appointments.jsp
│   ├── doctor_list.jsp
│   ├── profile.jsp
│   └── support.jsp
│
├── WEB-INF/
│   └── web.xml
│
└── README.md

🗄️ Database Schema (MySQL)
Database Name: online_health
users table
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
email VARCHAR(100),
password VARCHAR(100),
role VARCHAR(20),
age INT,
gender VARCHAR(20)

doctors table
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
specialization VARCHAR(100),
email VARCHAR(100),
phone VARCHAR(20)

appointments table
id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
doctor_id INT,
appointment_date DATE,
symptoms VARCHAR(255),
status VARCHAR(50)

🛠️ Setup Instructions
1️⃣ Clone the Repository
git clone https://github.com/YourUsername/Online-Health-Consultation.git

2️⃣ Import in IntelliJ IDEA / Eclipse

Choose Import → Maven / Java Project

Configure SDK (Java 17 or 23)

3️⃣ Add Required Libraries

MySQL Connector (mysql-connector-j-9.4.jar)

servlet-api.jar (if needed for IDEA editor)

4️⃣ Create Database

Run below in MySQL Workbench:

CREATE DATABASE IF NOT EXISTS online_health;
USE online_health;


Import tables according to schema above.

5️⃣ Update MySQL Credentials

Edit inside DBConnection.java:

public static final String URL = "jdbc:mysql://localhost:3306/online_health";
public static final String USER = "root";
public static final String PASSWORD = "yourpassword";

6️⃣ Configure Tomcat

Add Tomcat 10.1.x

Add artifact: Web Application: Exploded

Application context:

/Online_Health

7️⃣ Run Application

Open browser:

http://localhost:8080/Online_Health/

🎨 UI Highlights

Modern glass-card login UI

Clean User Dashboard with card-based layout

Admin dashboard with CRUD options

Fully responsive (90% mobile friendly)

🔮 Future Enhancements

Doctor login

Appointment approval system

Email notifications

Payment integration

Chat with doctor

Dark mode
