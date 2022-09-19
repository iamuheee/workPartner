package com.wp.workpartner.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.employee.model.vo.Employee;
import com.wp.workpartner.project.model.dao.ProjectDao;
import com.wp.workpartner.project.model.vo.Project;
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
		ArrayList<ProjectMember> mlist;
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
