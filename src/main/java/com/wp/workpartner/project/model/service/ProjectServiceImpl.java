package com.wp.workpartner.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.File;
import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.project.model.dao.ProjectDao;
import com.wp.workpartner.project.model.vo.Project;
import com.wp.workpartner.project.model.vo.ProjectBoard;
import com.wp.workpartner.project.model.vo.ProjectMember;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProjectDao pDao;

	// =================================================================================
	
	
	

	@Override
	public ArrayList<Employee> selectPopupList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	public int insertProject(Project p) {
		return pDao.insertProject(sqlSession, p);
	}


	@Override
	public ArrayList<Project> selectProjectList(String empNo) {
		ArrayList<Project> plist = pDao.selectProjectList(sqlSession, empNo);
		for(Project p : plist) {
			p.setMlist( pDao.selectMemberList(sqlSession, p) );
		}
		return plist;
	}

	
	@Override
	public int validateMember(Project p) {
		return pDao.validateMember(sqlSession, p);
	}


	@Override
	public Project selectProject(String projNo) {
		Project p = pDao.selectProject(sqlSession, projNo);
		p.setMlist( pDao.selectMemberList(sqlSession, p) );
		return p;
	}


	@Override
	public int updateProject(Project p) {
		return pDao.updateProject(sqlSession, p);
	}


	@Override
	public int deleteProject(String projNo) {
		return pDao.deleteProject(sqlSession, projNo);
	}


	@Override
	public ArrayList<ProjectMember> selectMemberList(Project p) {
		return pDao.selectMemberList(sqlSession, p);
	}
	

	@Override
	public ArrayList<ProjectMember> selectMemberList(ProjectMember m) {
		return pDao.selectMemberList(sqlSession, m);
	}


	@Override
	public int updateMember(ProjectMember m) {
		return pDao.updateMember(sqlSession, m);
	}


	@Override
	public int deleteMember(ProjectMember m) {
		return pDao.deleteMember(sqlSession, m);
	}


	@Override
	public int insertMember(ProjectMember m) {
		
		// 이미 멤버로 추가된 사원인지 검사하고 들어가자
		m.setMemNo( "(" + m.getMemNo() + ")" );
		if( pDao.validateNewMember(sqlSession, m) > 0) {
			return 0;
			
		}else {
			m.setMemNo( m.getMemNo().substring(1, m.getMemNo().length()-1) );
			String[] memNos = m.getMemNo().split(",");
			String[] memNames = m.getMemName().split(",");
			
			int result = 1;
			for(int i=0; i<memNos.length; i++) {
				ProjectMember pm = new ProjectMember();
				pm.setProjNo(m.getProjNo());
				pm.setMemNo(memNos[i]);
				pm.setMemName(memNames[i]);
				pm.setMemRole(m.getMemRole());
				
				result *= pDao.insertMember(sqlSession, pm);
			}
			return result;
		}
	}


	@Override
	public ArrayList<ProjectBoard> selectProjectBoardList(Project p) {
		ArrayList<ProjectBoard> blist = pDao.selectProjectBoardList(sqlSession, p);
		for(ProjectBoard pb : blist) {
			switch( pb.getRefType() ) {
			case "업무" : pb.setPduty( pDao.selectProjectDuty(sqlSession, pb) ); break;
			case "회의" : pb.setPmeet( pDao.selectProjectMeeting(sqlSession, pb) ); break;
			}
		}
		return blist;
	}


	@Override
	public int insertDuty(ProjectBoard pb) {
		// ProjectBoard pb에는 TB_PBOARD, TB_PDUTY에 대한 정보가 담겨있음
		int result1 = pDao.insertBoard(sqlSession, pb);
		int result2 = pDao.insertDuty(sqlSession, pb.getPduty());
		return result1 * result2;
	}


	@Override
	public int insertFile(File f) {
		return pDao.insertFile(sqlSession, f);
	}
	
	
	
	
	
	
	
	

}
