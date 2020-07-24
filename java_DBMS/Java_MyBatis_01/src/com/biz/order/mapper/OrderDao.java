package com.biz.order.mapper;

import java.util.List;

import com.biz.order.model.OrderVO;

public interface OrderDao {
	
	public List<OrderVO> selectAll();
	
	//Invalid bound statement (not found):
	// 		com.biz.order.mapper.orderDoa.findBySeq
	// Dao에는 method가 있는데 
	// mapper는 같은 이름을 갖는 TAG 속성을 찾을 수없다.
	
	public OrderVO findBySeq(long seq);
	public List<OrderVO> findByPcode(String pcode);
	public List<OrderVO> findByPname(String pname);
	
	public List<OrderVO> findByDateDistance(String start_date, String end_date);
	
	public int insert(OrderVO orderVO);
	public int update(OrderVO orderVO);
	public int delete(long seq);
	
	
}
