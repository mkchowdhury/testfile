login.html

<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Login Form</title> 
    </head> 
    <body  bgcolor="#D8CEF6"> 
        <h1>Login Page</h1> 
        <fieldset >
           <center>
      <legend><h2>Sign in Details</h2> </legend>
        <form action="http://localhost:8080/FTF/LoginCheck.jsp" method="post"> 

            <br/><strong>UserName:</strong><input type="text" name="username"/> 
		<br/>
            <br/><strong>Password:</strong><input type="text" name="password"/> 
            <br/>
                <td>
            <br/><input type="submit" value="Submit" name="bt"/> 
                </td>
            </tr>
        </form> 
    </center> 
                </fieldset>
        </body> 
        </html>

LoginCheck.jsp

LoginCheck.jsp


<%@page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.io.*"%>
    <html> 
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login Check</title> 
        </head> 
<body> 
        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String driver = "oracle.jdbc.driver.OracleDriver";
        String dbURL = "jdbc:oracle:thin:@localhost:1522:litonorcl";
        String dbuser = "liton";
        String dbpassword = "liton";
        Connection theConnection = null;
        PreparedStatement theStatement = null;

     try{  
         Class.forName(driver);
         theConnection=DriverManager.getConnection(dbURL,dbuser,dbpassword);  
         theStatement = theConnection.prepareStatement("select * from USERTBL1 where usrname=? and pasword=?");
	 theStatement.setString(1,request.getParameter("username"));
         theStatement.setString(2,request.getParameter("password"));

    ResultSet theResult = theStatement.executeQuery();

      if(theResult.next())
//         out.println("Success");

	response.sendRedirect("Home.jsp");
         else
//         out.println("Failed");
	response.sendRedirect("Error.jsp");
          }catch(Exception e){
           out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
         }  

        %>
</body>





Home.jsp

<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>FTF Home Page</title> 
</head> 
<body style="background-color:DodgerBlue;"> 
<br/> 
<center>

<h2>
<% 
//String a = session.getAttribute("username").toString();
out.println("!!!!!Welcome to FutureTech!!!!!"); 
out.println(" Login successful ");
%> 
</h2>
<br/> 
</center> 
<a style=color-font:black href="Logout.jsp">Logout</a> 
</body> 
</html>


Error.jsp

<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Login Error</title> 

</head> 

<body> 

<h1>Some Error has occured,Please try again...</h1> 
<h2>Please entre correct UserName and Email<h2>
<centre><a href="login.html">Login</a></centre>
</body>

</html>


Logout.jsp

<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Logout</title> 
</head> 
<body> 
<br/>
<h3>Logout successful</h3>
<br/>
<a href="login.html">Login</a>
 </body> 
</html>