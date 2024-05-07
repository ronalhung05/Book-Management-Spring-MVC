package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;

public class BookDAOTest {

	private static BookDAO bookDao;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		bookDao = new BookDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		bookDao.close();
	}

	@Test
	public void testBookDAO() {
		fail("Not yet implemented");
	}

	@Test
	public void testCreateBook() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateBook() {
		fail("Not yet implemented");
	}

	@Test
	public void testGet() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteObject() {
		fail("Not yet implemented");
	}

	@Test
	public void testListAll() {
		fail("Not yet implemented");
	}

	@Test
	public void testCount() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindByBookTitle() {
		fail("Not yet implemented");
	}

	@Test
	public void testListBooksByCategory() {
		fail("Not yet implemented");
	}

	@Test
	public void testSearch() {
		fail("Not yet implemented");
	}

	@Test
	public void testListNewBooks() {
		List<Book> topBestSellingBooks = bookDao.listAll();
		
		for(Book book : topBestSellingBooks) {
			System.out.println(book.getTitle());
		}
		
		assertNotNull(topBestSellingBooks);
	}

	@Test
	public void testCountByCategory() {
		fail("Not yet implemented");
	}

	@Test
	public void testListBestSellingBooks() {
		List<Book> topFavoredBooks = bookDao.listMostFavoredBooks();
		
		for(Book book : topFavoredBooks) {
			System.out.println(book.getTitle());
		}
		
		assertEquals(4,topFavoredBooks.size());
	}

}
