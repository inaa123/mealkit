package com.my.mealkit.dao;

import java.util.List;

import com.my.mealkit.domain.Notice;

public interface NoticeDao {
	List<Notice> selectNotices();
	List<Notice> selectSearchNotices(String keyword);
	Notice selectNotice(int noticeNum);
	Notice selectDetailNotice(int noticeNum);
	void insertAdminNotice(Notice notice);
	void updateAdminNotice(Notice notice);
	void deleteAdminNotice(int noticeNum);
	Object selectMaxNum();
}
