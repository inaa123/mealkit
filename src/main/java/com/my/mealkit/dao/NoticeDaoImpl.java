package com.my.mealkit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.mealkit.dao.map.NoticeMap;
import com.my.mealkit.domain.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired private NoticeMap noticeMap;
	
	@Override
	public Notice selectNotice(int noticeNum) {
		return noticeMap.selectNotice(noticeNum);
	}
	
	@Override
	public List<Notice> selectSearchNotices(String keyword) {
		return noticeMap.selectSearchNotices(keyword);
	}
	
	@Override
	public List<Notice> selectNotices() {
		return noticeMap.selectNotices();
	}
	
	@Override
	public Notice selectDetailNotice(int noticeNum) {
		return noticeMap.selectDetailNotice(noticeNum);
	}
	
	@Override
	public void insertAdminNotice(Notice notice) {
		noticeMap.insertAdminNotice(notice);
	}
	
	@Override
	public void updateAdminNotice(Notice notice) {
		noticeMap.updateAdminNotice(notice);
	}
	
	@Override
	public void deleteAdminNotice(int noticeNum) {
		noticeMap.deleteAdminNotice(noticeNum);
	}
	
	@Override
	public Object selectMaxNum() {
		return noticeMap.selectMaxNum();
	}
}
