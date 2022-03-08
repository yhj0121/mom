package com.mom.momhome.cscenter;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*
 * @inject는 Bean을 Class Type으로 검색한다.
 * @Autowired은 @inject와 동일하 Bean을 Class Type으로 검색한다.
 * @Autowired와 @inject의 차이점은  @Autowired은 Spring에서 제공하고 @inject은 Java에서 제공한다.
 * @Resource는 Java에서 제공하며 Bean을 Class Name으로 검색한다..
 * Spring 프로젝트이기 때문에 @Autowired를 사용하면 된다.
 * 
 * Bean : Spring IoC 컨테이너가 관리하는 자바 객체
 * 제어의 역전 (IOC, Inversion Of Control) : 객체의 생성을 특별한 관리 위임 주체에게 맡긴다.
 * 사용자는 객체를 직접 생성하지 않고, 객체의 생명주기를 컨트롤하는 주체는 다른 주체가 된다.
 * 즉, 사용자의 제어권을 다른 주체에게 넘기는 것을 IOC(제어의 역전)라고 한다.
*/


@Repository("csCenterDao") 
// 화면에 보여주기 위해 Service에서 불러오기 위한 태그?
// Service에서 여기에서 구현한 인터페이스를 가져올 때, 사용한다.
public class CSCenterDaoImp implements CSCenterDao{
		@Autowired
		SqlSessionTemplate sm; 
		// sm은 root-context.xml의 bean의 id이다.
		
		@Override
		public List<CSCenterDto> getList() {
			return sm.selectList("csList"); // selectList, selectOne
		}

		@Override
		public void writeData(CSCenterDto dto) {
			sm.insert("csInsert", dto);
		}
}
