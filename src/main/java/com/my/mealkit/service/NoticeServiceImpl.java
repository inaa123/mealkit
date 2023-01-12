package com.my.mealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.mealkit.dao.NoticeDao;
import com.my.mealkit.domain.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired private NoticeDao noticeDao;
	
	@Override
	public Notice getNotice(int noticeNum) {
		return noticeDao.selectNotice(noticeNum);
	}
	
	@Override
	public List<Notice> getNotices() {
		return noticeDao.selectNotices();
	}
	
	@Override
	public List<Notice> getSearchNotices(String keyword) {
		return noticeDao.selectSearchNotices(keyword);
	}
	
	@Override
	public Notice getDetailNotice(int noticeNum) {
		return noticeDao.selectDetailNotice(noticeNum);
	}
	
	@Override
	public void addAdminNotice(Notice notice) {
		noticeDao.insertAdminNotice(notice);
	}
	
	@Override
	public void fixAdminNotice(Notice notice) {
		noticeDao.updateAdminNotice(notice);
	}
	
	@Override
	public void delAdminNotice(int noticeNum) {
		noticeDao.deleteAdminNotice(noticeNum);
	}
	
	@Override
	public Object getMaxNum() {
		return noticeDao.selectMaxNum();
	}
}
