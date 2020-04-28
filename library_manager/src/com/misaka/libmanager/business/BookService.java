package com.misaka.libmanager.business;

import java.util.List;

import com.misaka.libmanager.dao.BookDao;
import com.misaka.libmanager.po.Book;

public class BookService {
	private BookDao bookDao = new BookDao();
	//ÃÌº”Õº È
	public boolean addbook(Book book) {
		if(book.getId()=="") return false;
		if(book.getName()=="") return false;
		boolean flag = bookDao.isExists(book.getId());
		if(!flag) bookDao.addBook(book.getId(), book.getName());
		return !flag;
	}

	public List<Book> allBooks() {
		return bookDao.allBooks();
	}
	public void delbook(String id) {
		bookDao.delBook(id);
		return;
	}
}
