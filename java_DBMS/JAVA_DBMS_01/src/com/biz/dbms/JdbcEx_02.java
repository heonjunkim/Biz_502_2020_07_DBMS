package com.biz.dbms;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.biz.config.DBConnection;
import com.biz.config.DBContract;
import com.biz.dbms.domain.OrderVO;

public class JdbcEx_02 {
	
	public static void main(String[] args) {
		
		
		Connection dbConn = DBConnection.getDBConnection();
		String order_select = DBContract.ORDER_SELECT;
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		
		// 인터페이스를 이용해서 객체 선언만
		PreparedStatement pSt = null;
		
		// dbConn 객체의 prepareStatement() method 에게 SQL 명령문 코드를 전달하면
		// PreparedStatement type 의 객체를 생성하여 return
		
			try {
				pSt = dbConn.prepareStatement(order_select);
			ResultSet result = pSt.executeQuery();
			while(result.next()) {
				
				OrderVO orderVO = new OrderVO();
				
				String o_num = result.getNString(DBContract.ORDER.POS_O_NUM_STR);
				orderVO.setO_num(o_num);
				
				String o_date = result.getNString(DBContract.ORDER.POS_O_DATE_STR);
				orderVO.setO_num(o_date);
				
				String o_cnum = result.getNString(DBContract.ORDER.POS_O_CNUM_STR);
				orderVO.setO_num(o_cnum);
				
				String o_pname = result.getNString(DBContract.ORDER.POS_O_PNAME_STR);
				orderVO.setO_num(o_pname);
				
				String o_qty = result.getNString(DBContract.ORDER.POS_O_QTY_INT);
				orderVO.setO_num(o_qty);
				
				String o_price = result.getNString(DBContract.ORDER.POS_O_PRICE_INT);
				orderVO.setO_num(o_price);
				orderList.add(orderVO);
			}
			pSt.close();
			dbConn.close();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		System.out.println("===================================");
		System.out.println("주문내역서");
		System.out.println("===================================");
		System.out.println("주문번호\t주문일자\t고객\t상품\t수량\t가격\t합계");
		System.out.println("--------------------------------------------------");
		for(OrderVO vo : orderList) {
			System.out.println(vo.getO_num() + "\t");
			System.out.println(vo.getPo_date() + "\t");
			System.out.println(vo.getO_cnum() + "\t");
			System.out.println(vo.getO_pcode()+ "\t");
			System.out.println(vo.getO_qty()+ "\t");
			System.out.println(vo.getO_price()+ "\t");
			System.out.println(vo.getO_total()+ "\n");
		}
		
		
		
		
		
	}

}
