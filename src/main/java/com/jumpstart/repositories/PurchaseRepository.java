package com.jumpstart.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.jumpstart.entities.Purchase;
import com.jumpstart.entities.User;
import com.jumpstart.entities.Product;

@Repository
public interface PurchaseRepository extends JpaRepository<Purchase, Long> {

	@Query("SELECT p FROM Purchase p WHERE p.user = :user ORDER BY p.ordered DESC")
	Page<Purchase> getMostRecentPurchases(@Param("user") User user, Pageable pageable);
	
	List<Purchase> findByUserAndReceivedIsNotNullOrderByReceivedDesc(User user);
	
	List<Purchase> findByUser(User user);
	List<Purchase> findByProduct(Product product);
	
	@Query("SELECT p FROM Purchase p WHERE p.user = :user AND p.received IS NULL ORDER BY p.ordered DESC")
	List<Purchase> getUserOngoingPurchases(@Param("user") User user);
	
	List<Purchase> getByMethodAndReceivedIsNull(String method);
	
	@Query(value = "SELECT p FROM Purchase p WHERE p.method = :method AND p.received IS NULL AND p.user IS NOT NULL AND ("
	        + " p.reference LIKE '%' || :keyword || '%'"
	        + " OR p.user.fullname LIKE '%' || :keyword || '%'"
	        + " OR p.user.username LIKE '%' || :keyword || '%'"
	        + " OR p.user.mobile LIKE '%' || :keyword || '%'"
	        + " OR p.user.email LIKE '%' || :keyword || '%'"
	        + " OR p.product.name LIKE '%' || :keyword || '%')")
	List<Purchase> searchPurchases(@Param("keyword") String keyword, @Param("method") String method);

	@Query(value = "SELECT p FROM Purchase p WHERE p.user = :user AND p.received IS NOT NULL AND ("
			+ " p.method LIKE '%' || :keyword || '%'"
			+ " OR p.reference LIKE '%' || :keyword || '%'"
	        + " OR p.ordered LIKE '%' || :keyword || '%'"
	        + " OR p.received LIKE '%' || :keyword || '%'"
	        + " OR p.product.price LIKE '%' || :keyword || '%'"
	        + " OR p.product.description LIKE '%' || :keyword || '%'"
	        + " OR p.product.name LIKE '%' || :keyword || '%')"
	        + " ORDER BY p.received DESC")
	List<Purchase> searchUserCompletedPurchases(@Param("user") User user, @Param("keyword") String keyword);
}
