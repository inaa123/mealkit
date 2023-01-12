package com.my.mealkit.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.mealkit.domain.Notice;

public interface NoticeMap {
	List<Notice> selectNotices();
	List<Notice> selectSearchNotices(@Param("keyword") String keyword);
	Notice selectNotice(@Param("noticeNum") int noticeNum);
	Notice selectDetailNotice(@Param("noticeNum") int noticeNum);
	void insertAdminNotice(Notice notice);
	void updateAdminNotice(Notice notice);
	void deleteAdminNotice(@Param("noticeNum") int noticeNum);
	Object selectMaxNum();
}
