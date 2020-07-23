package com.biz.config;

public class Lines {
	public static String dLine = "";
	public static String sLine = "";
	
	static {
		String Line = String.format("%0100d", 0);
		dLine = Line.replace("0", "=");
		sLine = Line.replace("0", "-");
		
	}
	
	public static String getDLine(int length) {
		return String.format("%0" + length + "d",0).replace("0", "=");
	}
	public static String getSLine(int length) {
		return String.format("%0" + length + "d",0).replace("0", "-");
	}

}
