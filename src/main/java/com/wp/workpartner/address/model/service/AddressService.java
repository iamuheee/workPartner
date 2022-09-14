package com.wp.workpartner.address.model.service;

import java.util.ArrayList;

import com.wp.workpartner.address.model.vo.Department;
import com.wp.workpartner.address.model.vo.MyAddress;
import com.wp.workpartner.address.model.vo.MyGroup;
import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.employee.model.vo.Employee;

public interface AddressService {
	
	// 1. ajax 부서 리스트
	ArrayList<Department> selectDepList();
	
	// 2. ajax 내연락처 리스트
	ArrayList<MyGroup> selectGpList(String empNo);
			
	// 3. ajax 부서별 직원리스트 (페이징처리)	
	int selectEmpAdListCount(int depCd);
	ArrayList<Employee> selectEmpAdList(int depCd, PageInfo pi);
	
	// 4. ajax 연락처 그룹별 리스트 (그룹미지정은 그룹번호 null인 경우포함) 
	// 페이징처리 포함
	int selectMyAddCount(int groupNo);
	ArrayList<MyAddress> selectMyAddList(int groupNo, PageInfo pi);
	
	// 5. ajax 별표연락처 리스트 (페이징처리)
	int selectStarAdCount(String empNo);
	ArrayList<MyAddress> selectStarList(String empNo, PageInfo pi);
	
	// 6. 테이블 선택 시 회사 내 직원정보
	Employee selectDetailEmp(String empNo);
	
	// 7. 테이블 선택시 내 연락처 사람 정보
	MyAddress selectDetailmyAdd(int addressNo);
	
	// 8. 별클릭시 addStar 업데이트
	int updateAddStar(MyAddress myAd);
	
	// 9. 연락처 편집
	int updateAdd(MyAddress myAd);
	
	// 10. 새연락처 등록
	int insertAdd(MyAddress myAd);
	
	// 11. 내연락처 그룹 추가
	int insertGp(MyGroup myGp);
	
	// 12. 내연락처 그룹명 수정
	int updateGp(MyGroup myGp);
	
	// 13. 내연락처 그룹 삭제
	int deleteGp(int groupNo);
	
	// 14. 연락처 개별 삭제
	int deleteAddOne(int addressNo);
	
	// 15. 연락처 다중 삭제
	//int deleteAddOne
		
	
}
