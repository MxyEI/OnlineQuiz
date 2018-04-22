package com.shzu.m.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shzu.m.DatabaseConnectionFactory;
@WebServlet("/checkinsertQuestion")
public class InsertQuestionsController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public InsertQuestionsController(){
		super();
	}
	
		public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
			request.setCharacterEncoding("utf-8");
			String quiztype=request.getParameter("quiztype");
			String quizquestion=request.getParameter("quizquestion");
			String answer1=request.getParameter("answer1");
			String answer2=request.getParameter("answer2");
			String answer3=request.getParameter("answer3");
			String answer4=request.getParameter("answer4");
			int correct=Integer.parseInt(request.getParameter("correct"));
			
			Connection con=DatabaseConnectionFactory.createConnection();
			
			try
			{
			 Statement st=con.createStatement();
			 String sql = "INSERT INTO "+quiztype+" (quizquestion,answer1,answer2,answer3,answer4,correct) values ('"+quizquestion+"','"+answer1+"','"+answer2+"','"+answer3+"','"+answer4+"',"+correct+")";
			 		System.out.println(sql);
			 st.executeUpdate(sql);
			}catch(SQLException sqe){System.out.println("Error : While Inserting record in database");}
			try
			{
			 con.close();	
			}catch(SQLException se){System.out.println("Error : While Closing Connection");}
	        
			RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/jsps/home.jsp");
			dispatcher.forward(request, response);	
			
		}
		
public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
			doPost(request,response);
		}
}
