# CourseConnect

Application Summary:
As a student I always faced issue in planning my semester, the current process is to identify the course know the professor try to contact him, and now you need to wait for his available time to get details about the course.
To solve that issue of students and professor, by an efficient tool which can assist students in getting to know more about courses and also can view what are comments from other students on the courses. He will also have the option to post a comment and also view video comments posted by other users.
Currently the admin will have options to manager creating users / professor accounts. He will generate the user ID’s and assign the appropriate roles to those users (Professors / Students). Admin will have access to the entire courses database where he can change the details of the existing courses. 
Professors are currently restricted on a condition that they can have only one class as of now, for which they can update the details.
As a complete website, this is the best application that can connect the gaps between students and professors to get more details about courses. (CourseConnect)

	 	User/Role management for at least 2 roles	 
 	 	1.Admin
 	 	2.Professor
 	 	3.Student
 	 	 

Role Descriptions:	
CourseConnect has 3 kinds of users.
-	Admin: He will have access to change any course, create new users.
Sample Accounts: 
	Username:  admin
	Password: admin1!
-	Student: Once the admin creates the student ID, the student can login view the courses and also post the comments and manage their previous comments.
Username: student1
Password: student1!
-	Professor: The professor will all the rights as the student, adding to those roles the professor can also view the course that he is registered for and then if required can update this course details.
Username: professor 
Password: professor1!
 		 
Databases:		 
 	ASPNETDB	This is the default database that is used in validating the user logging, authentication .Managing the roles.
 	CourseConnect	This the SQL database that hosts all the tables (Schools, Departments, Degree, Courses etc...) This also hosts all the required stored procedures which are called from genericdataaccess.cs to update / delete from the database.

 	 	PostCommnets.aspx
 	 	Utilized the SQL databases to display all the hirerachies in colleges and then instert the new comment added by the user
 	 	Also provided option to edit & Delete his comments 
 	 	
	Preservation of state (may include cookies, session state, application state, cross-page posting, or querystring)	When the user selects the course in the list and moves to the course details passed the data in query string.
 	 	Used cookie to pass the information about the courses from details view to the post comment page

 Navigation control	SiteMapPath1 (  SiteMap control that assists in easy travese back in the applications)

