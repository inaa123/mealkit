package com.my.mealkit.service;

import java.util.List;

import com.my.mealkit.domain.Notice;

public interface NoticeService {
	Notice getNotice(int noticeNum);
	List<Notice> getNotices();
	List<Notice> getSearchNotices(String keyword);
	Notice getDetailNotice(int noticeNum);
	void addAdminNotice(Notice notice);
	void fixAdminNotice(Notice notice);
	void delAdminNotice(int noticeNum);
	Object getMaxNum();
}
