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

@Repository
public interface PurchaseRepository extends JpaRepository<Purchase, Long> {

	@Query("SELECT p FROM Purchase p WHERE p.user = :user ORDER BY p.ordered DESC")
	Page<Purchase> getMostRecentPurchases(@Param("user") User user, Pageable pageable);
	
	List<Purchase> findByUserAndReceivedIsNotNull(User user);
	
	@Query("SELECT p FROM Purchase p WHERE p.user = :user AND p.received IS null ORDER BY p.ordered ASC")
	List<Purchase> getUserOngoingPurchases(@Param("user") User user);
	
	List<Purchase> getByMethodAndReceivedIsNull(String method);
	
	@Query(value = "SELECT p FROM Purchase p WHERE p.method = :method AND p.received IS null AND ("
	        + " p.reference LIKE '%' || :keyword || '%'"
	        + " OR p.user.fullname LIKE '%' || :keyword || '%'"
	        + " OR p.user.username LIKE '%' || :keyword || '%'"
	        + " OR p.user.mobile LIKE '%' || :keyword || '%'"
	        + " OR p.user.email LIKE '%' || :keyword || '%'"
	        + " OR p.product.name LIKE '%' || :keyword || '%')")
	List<Purchase> searchPurchases(@Param("keyword") String keyword, @Param("method") String method);

	@Query(value = "SELECT p FROM Purchase p WHERE p.user = :user AND p.received IS NOT null AND ("
	        + " p.reference LIKE '%' || :keyword || '%'"
	        + " OR p.ordered LIKE '%' || :keyword || '%'"
	        + " OR p.received LIKE '%' || :keyword || '%'"
	        + " OR p.product.price LIKE '%' || :keyword || '%'"
	        + " OR p.product.description LIKE '%' || :keyword || '%'"
	        + " OR p.product.name LIKE '%' || :keyword || '%')")
	List<Purchase> searchUserCompletedPurchases(@Param("user") User user, @Param("keyword") String keyword);
}
