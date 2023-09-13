package com.jumpstart.repositories;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.jumpstart.entities.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

	@Query( "select c from Category c where c.name in :category" )
	Set<Category> findBySpecificCateogry(@Param("category") String category);
	
}
