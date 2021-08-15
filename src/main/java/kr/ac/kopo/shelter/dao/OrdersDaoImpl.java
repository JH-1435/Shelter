package kr.ac.kopo.shelter.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.shelter.model.OrdersVo;

@Repository
public class OrdersDaoImpl implements OrdersDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(OrdersVo orders) {
		sql.insert("orders.add", orders);

	}

}
