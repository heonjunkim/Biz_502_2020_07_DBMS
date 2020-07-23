package com.biz.dbms.service;

import java.sql.SQLException;
import java.util.List;

import com.biz.dbms.domain.OrderVO;

public interface OrderService {
	
	// java에서 DBMS와 관련된 App을 만들때 최소한으로 구현해야할 method
	public int insert(OrderVO orderVO)  throws SQLException; // OrderVO에 값을 담아서 전달받아 INSERT 수행
	
	public List<OrderVO> selectAll() throws SQLException; // 조건에 관계없이 모든 데이터를 추출하여 return
	public OrderVO findByseq(long seq) throws SQLException; // findById(), PK 칼럼을 기준으로 데이터를 SELECT
	
	public int update(OrderVO orderVO) throws SQLException;
	public int delete(long seq ) throws SQLException;

}
