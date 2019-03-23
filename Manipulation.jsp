<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,com.niit.hiber.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HQL DML Operations</title>
</head>
<body>

<% 
	Configuration cfg = new Configuration();
	cfg.configure("Hibernate.cfg.xml");
	SessionFactory sf = cfg.buildSessionFactory();
	Session sess = sf.openSession();	
	Transaction t=sess.beginTransaction();
	
	String hql = "Update User set password=:password where id=:id";
	Query query = sess.createQuery(hql);
	query.setParameter("password","testing123");
	query.setParameter("id", 1);
	int rowsAffected = query.executeUpdate();
	if(rowsAffected > 0)
	{
		out.println("Updated: " + rowsAffected + " rows.");
	}
	

	String hql1 = "Delete from User where id=:id";
	query = sess.createQuery(hql1);
	query.setParameter("id", new Integer(3));
	rowsAffected = query.executeUpdate();
	if(rowsAffected > 0)
	{
		out.println("Deleted: " + rowsAffected + " rows.");
	}
	
	t.commit();
	sess.close();
	sf.close();
%>
</body>
</html>