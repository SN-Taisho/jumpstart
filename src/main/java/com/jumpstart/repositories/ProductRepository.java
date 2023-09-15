package com.jumpstart.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.jumpstart.entities.Category;
import com.jumpstart.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

	@Query("SELECT p FROM Product p WHERE p.category = :selected")
	List<Product> getByCategory(@Param("selected") Category selectedCategory);

	@Query(value = "SELECT p FROM Product p WHERE p.name LIKE '%' || :keyword || '%'"
			+ " OR p.description LIKE '%' || :keyword || '%'" + " OR p.price LIKE '%' || :keyword || '%'"
			+ " OR p.category.name LIKE '%' || :keyword || '%'")
	List<Product> searchAllProducts(@Param("keyword")String keyword);

	@Query(value = "SELECT p FROM Product p WHERE p.category = :selectedCategory AND p.name LIKE '%' || :keyword || '%'"
			+ " OR p.category = :selectedCategory AND p.description LIKE '%' || :keyword || '%'" 
			+ " OR p.category = :selectedCategory AND p.price LIKE '%' || :keyword || '%'"
			+ " OR p.category = :selectedCategory AND p.category.name LIKE '%' || :keyword || '%'")
	List<Product> filteredSearch(@Param("keyword") String keyword, @Param("selectedCategory") Category selectedCategory);
}
