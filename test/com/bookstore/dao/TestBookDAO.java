package com.bookstore.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

class BookDAOTest{

	private static BookDAO bookDAO;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		bookDAO = new BookDAO();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		// Close EntityManagerFactory
		bookDAO.close();
		
	}

	@Test
	public void testCreate() throws ParseException, IOException {
		Book existBook = new Book();

		Category newCat = new Category("Java Core");
		newCat.setCategoryId(21);
		existBook.setCategory(newCat);

		existBook.setTitle("Effective Java (3rd Edition)");
		existBook.setAuthor("Joshua Bloch");
		existBook.setDescription(
				"Are you looking for a deeper understanding of the Java™ programming language so that you can write code that is clearer, more correct, more robust, and more reusable?");
		existBook.setIsbn("0321356683");
		existBook.setPrice(38.87f);

		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");

		existBook.setPublishDate(publishDate);

		String imagePath = "D:\\IMAGE\\ooks\\Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));

		existBook.setImage(imageBytes);

		Book resultBook = bookDAO.create(existBook);

//  	Assertions.assertThrows(PersistenceException.class, () -> {
//  		bookDAO.create(newBook);
//	});

		assertTrue(resultBook.getBookId() > 0);

	}

	@Test
	public void testUpdate() throws ParseException, IOException {
		Book newBook = new Book();
		newBook.setBookId(32);

		Category newCat = new Category("Data Science");
		newCat.setCategoryId(20);
		newBook.setCategory(newCat);

		newBook.setTitle("Effective Java (3rd Edition)");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription(
				"Are you looking for a deeper understanding of the Java™ programming language so that you can write code that is clearer, more correct, more robust, and more reusable?");
		newBook.setIsbn("0321356683");
		newBook.setPrice(40.87f);

		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");

		newBook.setPublishDate(publishDate);

		String imagePath = "C:\\Users\\Hp\\Documents\\my_Servlet&Jsp_training\\E-Commerce BookStore Website\\Domain\\book\\books\\Effective Java.JPG";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));

		newBook.setImage(imageBytes);

		Book resultBook = bookDAO.update(newBook);

		assertEquals(resultBook.getTitle(), "Effective Java (3rd Edition)");

	}

	@Test
	public void testGet() {
		Integer bookId = 32;
		Book book = bookDAO.get(bookId);
		assertNotNull(book);
	}
	
	
	@Test
	public void testFindByBookTitle() {
		String bookTitle = "Effective Java (3rd Edition)";
		Book book = bookDAO.findByBookTitle(bookTitle);
		assertNotNull(book);
	}

	@Test
	public void testDeleteBookFail() {
		Integer bookId = 100; // book doesn't exist

		Assertions.assertThrows(EntityNotFoundException.class, () -> {
			bookDAO.delete(bookId);
			;
		});

	}

	@Test
	public void testListAll() {
		List<Book> books = bookDAO.listAll();

		assertTrue(books.size() > 0);
	}

	@Test
	public void testCount() {
		long totalBooks = bookDAO.count();
		long expected = 1;

		assertEquals(expected, totalBooks);
	}
	
	@Test
	public void testListByCategory() {
		
		int  categoryId = 20;
		List<Book> listBooks = bookDAO.listBooksByCategory(categoryId);
		
		assertTrue(listBooks.size() > 0);
	}
	
	@Test
	public void testListNewBooks() {
		List<Book> listBooks = bookDAO.listNewBooks();
		
		for(Book aBook : listBooks) {
			System.out.println(aBook.getTitle()+ "-" + aBook.getPublishDate());
		}
		
		assertEquals(4,listBooks.size());
	}
	
	@Test
	public void testSearchBookInTitle() {
		String keyword = "Java";
		List<Book> searchResult = bookDAO.search(keyword);
		
		assertEquals(6,searchResult.size());
	}
	
	@Test
	public void testSearchBookInAuthor() {
		String authorName = "Joshua";
		List<Book> searchResult = bookDAO.search(authorName);
		
		assertTrue(searchResult.size() > 0);
	}
	
	@Test
	public void testSearchBookInDescription() {
		String description = "programming";
		List<Book> searchResult = bookDAO.search(description);
		
		assertTrue(searchResult.size() > 1);
	}
	
	@Test
	public void testCountByCategory() {
	int cateoryId = 11;
	long numOfBooks = bookDAO.countByCategory(cateoryId);
	assertTrue(numOfBooks == 7);
	
	}

}
