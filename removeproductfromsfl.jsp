<%-- 
    Document   : removeproductfromsfl
    Created on : 4 Dec, 2020, 3:04:09 PM
    Author     : tusha
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int cid=Integer.parseInt(request.getParameter("pid"));
            final String JDBC_DRIVER="com.mysql.jdbc.Driver";
            final String DB_URL="jdbc:mysql://localhost/tmart";

            final String USER="root";
            final String PASS="tushar";

            Connection conn=null;
            PreparedStatement stmt=null;
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");

                conn=DriverManager.getConnection(DB_URL,USER,PASS);
                //out.print(request.getParameter("subcatid"));
                String sql="delete from saveforlater where pid=?";
                //String email=request.getParameter("username");
                //String password=request.getParameter("password");

                stmt=conn.prepareStatement(sql);
                stmt.setInt(1, cid);
               // stmt.setString(2, password);

                stmt.executeUpdate();
                response.sendRedirect("show_cart.jsp");
                
            }
            
            catch(Exception e)
            {
                    out.print("failed"+e);    
            }
        %>
    </body>
</html>
