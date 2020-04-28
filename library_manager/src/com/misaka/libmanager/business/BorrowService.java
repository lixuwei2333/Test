package com.misaka.libmanager.business;

import java.util.List;

import com.misaka.libmanager.dao.BookDao;
import com.misaka.libmanager.dao.BorrowDao;
import com.misaka.libmanager.po.Borrow;
public class BorrowService {
		private BorrowDao borrowDao = new BorrowDao();
		private BookDao bookDao = new BookDao();
		public List<Borrow> allBorrows() {
			return borrowDao.allBorrows();
		}
		public boolean rebook(Borrow borrow) {
			if(borrow.getId()=="") return false;
			if(borrow.getAccount()=="") return false;
			bookDao.setflag(borrow.getId(), 1);
			borrowDao.delBorrow(borrow);
			return true;
		}
		public boolean borrow(Borrow borrow) {
			if(borrow.getId()=="") return false;
			if(borrow.getAccount()=="") return false;
			if(bookDao.qFlag(borrow.getId())==1) {
				bookDao.setflag(borrow.getId(), 0);
				borrowDao.addBorrow(borrow);
			}
			else {
				rebook(borrow);
			}
			return true;
		}
}
