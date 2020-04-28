package com.misaka.libmanager.business;

import java.util.List;

import com.misaka.libmanager.dao.NoticeDao;
import com.misaka.libmanager.po.Notice;

public class NoticeService {
	private NoticeDao noticeDao = new NoticeDao();
	public List<Notice> allNotices() {
		return noticeDao.allNotices();
	}
	public void delnotice(String id) {
		noticeDao.delNotice(id);
		return;
	}
	public boolean addnotice(Notice notice) {
		if(notice.getId()=="") return false;
//		if(book.getName()=="") return false;
		boolean flag = noticeDao.isExists(notice.getId());
		if(!flag) noticeDao.addNotice(notice);
		return !flag;
	}
}
