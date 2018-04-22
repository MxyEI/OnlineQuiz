package com.shzu.m;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.*;
import java.util.Iterator;
import java.util.List;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.dom4j.Attribute;  
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentFactory;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
public class SQLtoXML {
	private static String dbURL="jdbc:mysql://localhost/quiz";
	private static String dbUser="root";
	private static String dbPassword="mxy123";
	
 public  void SelectData(String quiztype)  {
  // TODO Auto-generated method stub
	 //int num=Math.round(Math.random()*10+1);
  String sql = "select * from "+quiztype+" Order by rand() Limit 10";//从数据库中随机获取10条数据
  Connection conn=null;  
     PreparedStatement pstmt=null;  
     //声明结果集接受对象
     ResultSet ret = null;  
     
        try {
         Class.forName("com.mysql.jdbc.Driver");
   conn=DriverManager.getConnection( 
         dbURL,dbUser,dbPassword);
   pstmt=conn.prepareStatement(sql); 
   ret=pstmt.executeQuery();
   //创建一个DocumentFactory对象
   System.out.println("将数据库的内容写入xml文档：");
   DocumentFactory factory = new DocumentFactory();
   //通过factory对象创建一个doc文件对象
   Document doc = factory.createDocument();
   doc.addProcessingInstruction("mxy", "website=\"http://bbs.btorg.org\"");
   //加入根元素
   Element quiz = doc.addElement("quiz");//总节点
   Element title=quiz.addElement("title");
   title.addText("quiz");
   Element totalQuizQuestions=quiz.addElement("totalQuizQuestions");
   totalQuizQuestions.addText("10");
   Element quizDuration=quiz.addElement("quizDuration");
   quizDuration.addText("4");
   
   ResultSetMetaData rmd2=ret.getMetaData();//获取结果集的元数据
   System.out.println("正在写入xml文档数据！\n");
    while (ret.next()) {
    	
                 Element question =quiz.addElement("question");
                 Element quizquestion=question.addElement("quizquestion");
                 quizquestion.addText(ret.getString(2));
                 Element answer1=question.addElement("answer");
                 answer1.addText(ret.getString(3));
                 Element answer2=question.addElement("answer");
                 answer2.addText(ret.getString(4));
                 Element answer3=question.addElement("answer");
                 answer3.addText(ret.getString(5));
                 Element answer4=question.addElement("answer");
                 answer4.addText(ret.getString(6));
                 Element correct=question.addElement("correct");
                 correct.addText(ret.getString(7));
                 
                 /*for(int i=1;i<=rmd2.getColumnCount();i++){
               //获取列名
					String columnName=rmd2.getColumnName(i);
					//获取列值
					Object columnValue=ret.getObject(columnName);
					root.addElement(columnName).setText(columnValue.toString());
                 }
                */
              
             }
    		//显示数据  
    		OutputXml(doc,quiztype);  
          ret.close();  
    conn.close();  
     
  } 
        catch ( ClassNotFoundException cnfex ) {
            System.err.println(  
            "装载 JDBC/ODBC 驱动程序失败。" );  
            cnfex.printStackTrace();   
        }   
        //捕获连接数据库异常  
        catch ( SQLException sqlex ) {
            System.err.println( "无法连接数据库" );  
            sqlex.printStackTrace();   
        }  catch (Exception e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
  }
        //准备执行sql语句
    
 }
private static void OutputXml(Document doc,String quiztype) {
 // TODO Auto-generated method stub
  XMLWriter writer = null;  
  //定义一种输出格式
   OutputFormat format = OutputFormat.createPrettyPrint();
   format.setEncoding("UTF-8");// 设置XML文件的编码格式,如果有中文可设置为GBK或UTF-8  
   File file = new File("/Users/mac/Desktop/quizzes/"+quiztype+"-quiz"+".xml");  
   
     
   // 如果上面设置的xml编码类型为GBK，或设为UTF-8但其中有中文则应当用FileWriter来构建xml文件（使用以下代码），否则会出现中文乱码问题  
    FileOutputStream fos = null;  
    try {
    fos = new FileOutputStream(file);  
    } catch (FileNotFoundException e) {
    e.printStackTrace();  
    }  
    try {
    writer = new XMLWriter(new OutputStreamWriter(fos,"utf-8"), format);  
    } catch (UnsupportedEncodingException e) {
    e.printStackTrace();  
    }  
   try {
    writer.write(doc);  
    writer.close();  
   } catch (IOException e) {
    e.printStackTrace();  
   }  
   
}
}