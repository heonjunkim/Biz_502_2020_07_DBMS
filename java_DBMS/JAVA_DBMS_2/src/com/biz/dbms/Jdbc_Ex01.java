package com.biz.dbms;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.biz.config.DBContract;
import com.biz.config.Lines;
import com.biz.dbms.domain.OrderVO;
import com.biz.dbms.service.OrderService;
import com.biz.dbms.service.OrderServiceImplV1;

public class Jdbc_Ex01 {
	public static void main(String[] args) {
		
		OrderService orderService = new OrderServiceImplV1();
		
		OrderVO orderVO = new OrderVO();
		
		orderVO.setO_num("O00055");
		orderVO.setPo_date("2020-07-23");
		orderVO.setO_cnum("C0012");
		orderVO.setO_pcode("P0001");
		orderVO.setO_price(3000);
		orderVO.setO_qty(10);
		
		int ret = 0;
		try {
			
			ret = orderService.insert(orderVO);
			if(ret >0 ) {
				System.out.println("데이터 추가가 정상적으로 수행!!");
			} else {
				// SQL 등에는 아무런 문제가 없는데 
				// INSERT가 수행되고도 데이터가 추가되지 않았을때
				System.out.println("데이터 추가할수 없음");
			}
		} catch (SQLException e) {
			
			// Oracle DBMS에서 오류를 보내왔을때
			// TODO Auto-generated catch block
			System.out.println("SQL 전달과정에서 오류 발생");
			e.printStackTrace();
		}
		
		
		
	}

}
