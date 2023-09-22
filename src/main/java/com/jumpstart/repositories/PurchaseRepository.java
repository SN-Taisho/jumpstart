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

	@Query("SELECT p FROM Purchase p WHERE p.user = :user AND p.received = null ORDER BY p.ordered ASC")
	List<Purchase> getUserOngoingPurchases(@Param("user") User user);

}
