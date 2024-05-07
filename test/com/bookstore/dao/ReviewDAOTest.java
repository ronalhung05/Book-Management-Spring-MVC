package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewDAOTest {

    private static ReviewDAO reviewDao;

    @BeforeAll
    public static void setUpBeforeClass() throws Exception {
        reviewDao = new ReviewDAO();
    }

    @AfterAll
    public static void tearDownAfterClass() throws Exception {
        reviewDao.close();
    }

    @Test
    public void testCreateReview() {
        Review review = new Review();
        Book book = new Book();
        book.setBookId(35);

        Customer customer = new Customer();
        customer.setCustomerId(29);

        review.setBook(book);
        review.setCustomer(customer);

        review.setHeadline("Excellent book!");
        review.setRating(3);
        review.setComment("A comprehensive book about Spring framework.");

        Review savedReview = reviewDao.create(review);

        assertTrue(savedReview.getReviewId() > 0);
    }

    @Test
    public void testGet() {
        Integer reviewId = 1;
        Review review = reviewDao.get(reviewId);

        assertNotNull(review);
    }

    @Test
    public void testUpdateReview() {
        Integer reviewId = 1;
        Review review = reviewDao.get(reviewId);
        review.setHeadline("Excellent book");

        Review updatedReview = reviewDao.update(review);

        assertEquals(review.getHeadline(), updatedReview.getHeadline());

    }

    @Test
    public void testDeleteReview() {
        int reviewId = 2;
        reviewDao.delete(reviewId);

        Review review = reviewDao.get(reviewId);

        assertNull(review);

    }

    @Test
    public void testListAll() {
        List<Review> listReview = reviewDao.listAll();

        for (Review review : listReview) {
            System.out.println(review.getReviewId() + " - " + review.getBook().getTitle()
                    + " - " + review.getCustomer().getFullname()
                    + " - " + review.getHeadline() + " - " + review.getRating());
        }

        assertTrue(!listReview.isEmpty());
    }

    @Test
    public void testCount() {
        long totalReviews = reviewDao.count();
        System.out.println("Total Reviews: " + totalReviews);
        assertTrue(totalReviews > 0);
    }

    @Test
    public void testFindByCustomerAndBookNotFound() {
        Integer customerId = 100;
        Integer bookId = 99;

        Review result = reviewDao.findByCustomerAndBook(customerId, bookId);

        assertNull(result);
    }

    @Test
    public void testFindByCustomerAndBookFound() {
        Integer customerId = 1;
        Integer bookId = 34;

        Review result = reviewDao.findByCustomerAndBook(customerId, bookId);

        assertNotNull(result);
    }

    @Test
    public void testListMostRecent() {
        List<Review> recentReviews = reviewDao.listMostRecent();

        assertEquals(3, recentReviews.size());
    }

    @Test
    public void testListMostRecentReviews() {
        List<Review> recentReviews = reviewDao.listMostRecent();

        assertEquals(3, recentReviews.size());
    }

}
