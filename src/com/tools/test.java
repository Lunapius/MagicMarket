package com.tools;

import java.io.UnsupportedEncodingException;

public class test {
	
	 public static void main(String[] args){
		   String aka = "我错了";
		   try {
			aka = new String(aka.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       System.out.println("ggsimida"+aka); 

	    }

	
}
