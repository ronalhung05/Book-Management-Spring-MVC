package com.bookstore.dao;

import java.util.Date;
import java.util.List;

import com.bookstore.entity.Book;

public class BookDAO extends JpaDAO<Book> implements GenericDAO<Book> {

	public BookDAO() {
	}
	
	@Override
	public Book create(Book book) {
		book.setLastUpdateTime(new Date());
		return super.create(book);
	}
	
	@Override
	public Book update(Book book) {
		book.setLastUpdateTime(new Date());
		return super.update(book);
	}

	@Override
	public Book get(Object bookId) {
		return super.find(Book.class, bookId);
	}
	

	@Override
	public void delete(Object bookId) {
		super.delete(Book.class, bookId);
		
	}

	@Override
	public List<Book> listAll() {
		return super.findWithNamedQuery("Book.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Book.countAll");
	}
	
	public Book findByBookTitle(String bookTitle) {
		List<Book> listBook = super.findWithNamedQuery("Book.findByTitle", "title", bookTitle);
		
		if (listBook != null && listBook.size() > 0) {
			return listBook.get(0);
		}

		return null;
	}
	
	public List<Book> listBooksByCategory(Object categoryId ){
		List<Book> listBook = super.findWithNamedQuery("Book.findByCategory", "catId", categoryId);
		
		return listBook;
	}
	
	public List<Book> search(String keyword) {
		return super.findWithNamedQuery("Book.search","keyword",keyword);
	}
	
	public List<Book> listNewBooks(){
		return super.findWithNamedQuery("Book.listNew", 0, 4);
	}
	
	public long countByCategory(int categoryId) {
		return super.countWithNamedQuery("Book.countByCategory", "catId", categoryId);
	}

}
