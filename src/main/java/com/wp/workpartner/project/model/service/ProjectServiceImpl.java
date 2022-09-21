package com.wp.workpartner.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.Comment;
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
		// 프로젝트 회의 초대 가능 사원 팝업리스트 뽑을 때 사용할 것
		return null;
	}
	
	
	@Override
	public int insertProject(Project p) {
		return pDao.insertProject(sqlSession, p) * pDao.insertLeader(sqlSession, p);
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
	public ArrayList<ProjectMember> selectMyInvation(String empNo) {
		return pDao.selectMyInvation(sqlSession, empNo);
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
			case "업무" : pb.setPduty( pDao.selectDuty(sqlSession, pb) ); break;
			case "회의" : pb.setPmeet( pDao.selectMeeting(sqlSession, pb) ); break;
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


	@Override
	public ArrayList<ProjectBoard> selectDutyList(Project p) {
		// refType이 '업무'인 ProjectBoard에 한해서만 조회하고
		// ArrayList<ProjectBoard> 안에 각 필드로 ProjectDuty가 들어가야 함
		ArrayList<ProjectBoard> blist = pDao.selectDutyBoardList(sqlSession, p);
		for(ProjectBoard pb : blist) {
			pb.setPduty( pDao.selectDuty(sqlSession, pb) );
			pb.setFile( pDao.selectFile(sqlSession, pb) );
		}
		return blist;
	}


	@Override
	public ProjectBoard selectDuty(ProjectBoard pb) {
		pb = pDao.selectBoard(sqlSession, pb);
		pb.setPduty( pDao.selectDuty(sqlSession, pb) );
		pb.setFile( pDao.selectFile(sqlSession, pb) );
		return pb;
	}


	@Override
	public int updateDuty(ProjectBoard pb) {
		int result1 = pDao.updateProjectBoard(sqlSession, pb);
		int result2 = pDao.updateProjectDuty(sqlSession, pb.getPduty());
		return result1 * result2;
	}


	@Override
	public int insertFileWhenUpdate(File f) {
		return pDao.insertFileWhenUpdate(sqlSession, f);
	}


	@Override
	public int updateFile(File f) {
		return pDao.updateFile(sqlSession, f);
	}


	@Override
	public int deleteBoard(ProjectBoard pb) {
		int result1 = pDao.deleteBoard(sqlSession, pb);
		int result2 = 1 + pDao.deleteFile(sqlSession, pb); // 게시글에 파일이 없을 수도 있으니까
		System.out.println(result1);
		System.out.println(result2);
		return result1 + result2;
	}


	@Override
	public int insertComment(Comment c) {
		return pDao.insertComment(sqlSession, c);
	}


	@Override
	public ArrayList<Comment> selectCommentList(Comment c) {
		return pDao.selectCommentList(sqlSession, c);
	}


	@Override
	public int deleteComment(Comment c) {
		return pDao.deleteComment(sqlSession, c);
	}


	@Override
	public int validateInchargeMember(Project p) {
		return pDao.validateInchargeMember(sqlSession, p);
	}


	@Override
	public int answerInvitaion(ProjectMember m, String answer) {
		int result;
		if( answer.equals("참여") ) {
			// TB_PROJECT_MEM -> MEM_STATUS = '참여'
			result = pDao.answerYes(sqlSession, m);
		}else {
			// TB_PROJECT_MEM -> STATUS = 'NO'
			result = pDao.answerNo(sqlSession, m);
		}
		System.out.println(result);
		return result;
	}

	
	
	
	
	
	
	
	
	

}
