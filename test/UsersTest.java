import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.bookstore.entity.*;
public class UsersTest {

	public static void main(String[] args) {
		Users user1 = new Users();
		user1.setEmail("hung@gmail.com");
		user1.setFullName("Phi Hung");
		user1.setPassword("helloworld");
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite"); 
		EntityManager entityManager = entityManagerFactory.createEntityManager(); 	
		
		entityManager.getTransaction().begin();
		
		entityManager.persist(user1);
		
		entityManager.getTransaction().commit();
		
		entityManager.close();
		entityManagerFactory.close();
		
		System.out.println("A Users Object was persisted");
	}

}
