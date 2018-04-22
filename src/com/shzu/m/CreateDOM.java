package com.shzu.m;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;


public class CreateDOM {
	
	
	
	public static Document getDOM(String test) throws SAXException,ParserConfigurationException,IOException, URISyntaxException
	{
		/*
		String css="css";
		String java="java";
		String javascript="javascript";
		String php="php";
		String mongoquiz="mongodb";
		String sqlquiz="sql";
		String pythonquiz="python";
		String linuxquiz="linux";*/
		
		SQLtoXML sx=new SQLtoXML();
		sx.SelectData(test);
		
		//开始读取xml题库文件
		    Document dom=null;
		    File quizFile=null;
		    
	        quizFile=new File("/Users/mac/Desktop/quizzes/"+test+"-quiz.xml");
	        System.out.println("题库全路径： "+quizFile.getAbsolutePath());
	         
	   DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
	   DocumentBuilder db=dbf.newDocumentBuilder();
	   try{
	        dom=db.parse(quizFile);
	   }catch(FileNotFoundException fileNotFound){
		   System.out.println("文件未找到 "+fileNotFound);
	   }
	   dom.getDocumentElement().normalize();
	   return dom;
	}
	
	
}
