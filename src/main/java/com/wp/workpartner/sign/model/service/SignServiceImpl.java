package com.wp.workpartner.sign.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.wp.workpartner.common.model.vo.PageInfo;
import com.wp.workpartner.sign.model.vo.Cooperation;
import com.wp.workpartner.sign.model.vo.Dtpaper;
import com.wp.workpartner.sign.model.vo.Otwork;
import com.wp.workpartner.sign.model.vo.ReSign;
import com.wp.workpartner.sign.model.vo.SelectCooperation;
import com.wp.workpartner.sign.model.vo.SelectOtwork;
import com.wp.workpartner.sign.model.vo.SelectReSign;
import com.wp.workpartner.sign.model.vo.SelectVacation;
import com.wp.workpartner.sign.model.vo.Vacation;

@Service
public class SignServiceImpl implements SignService {

	@Override
	public int insertCooperation(Dtpaper d, Cooperation c) {
		return 0;
	}

	@Override
	public int insertVacation(Dtpaper d, Vacation v) {
		return 0;
	}

	@Override
	public int insertOtwork(Dtpaper d, Otwork o) {
		return 0;
	}

	@Override
	public int insertReSignEmp(Dtpaper d, ReSign r) {
		return 0;
	}

	@Override
	public int selectProgressListCount() {
		return 0;
	}

	@Override
	public ArrayList<Dtpaper> selectProgressList(PageInfo pi) {
		return null;
	}

	@Override
	public int selectSaveListCount() {
		return 0;
	}

	@Override
	public ArrayList<Dtpaper> selectSaveList(PageInfo pi) {
		return null;
	}

	@Override
	public int selectReSignListCount() {
		return 0;
	}

	@Override
	public ArrayList<Dtpaper> selectReSignList(PageInfo pi) {
		return null;
	}

	@Override
	public int selectCompletListCount() {
		return 0;
	}

	@Override
	public ArrayList<Dtpaper> selectCompletList(PageInfo pi) {
		return null;
	}

	@Override
	public int selectSignListCount() {
		return 0;
	}

	@Override
	public ArrayList<Dtpaper> selectSignList(PageInfo pi) {
		return null;
	}

	@Override
	public SelectCooperation selectSignCooperation(int dpNo, String empNo) {
		return null;
	}

	@Override
	public SelectReSign selectSignResign(int dpNo, String empNo) {
		return null;
	}

	@Override
	public SelectVacation selectSignVacation(int dpNo, String empNo) {
		return null;
	}

	@Override
	public SelectOtwork selectSignOtwork(int dpNo, String empNo) {
		return null;
	}

	@Override
	public int updateCooperation(Dtpaper d, Cooperation c) {
		return 0;
	}

	@Override
	public int updateVacation(Dtpaper d, Vacation v) {
		return 0;
	}

	@Override
	public int updateOtwork(Dtpaper d, Otwork o) {
		return 0;
	}

	@Override
	public int updateReSignEmp(Dtpaper d, ReSign r) {
		return 0;
	}

	@Override
	public int deleteCooperation(int dpNo) {
		return 0;
	}

	@Override
	public int deleteVacation(int dpNo) {
		return 0;
	}

	@Override
	public int deleteOtwork(int dpNo) {
		return 0;
	}

	@Override
	public int deleteReSignEmp(int dpNo) {
		return 0;
	}

	@Override
	public SelectCooperation selectCooperation(int dpNo) {
		return null;
	}

	@Override
	public SelectReSign selectResign(int dpNo) {
		return null;
	}

	@Override
	public SelectVacation selectVacation(int dpNo) {
		return null;
	}

	@Override
	public SelectOtwork selectOtwork(int dpNo) {
		return null;
	}

}
