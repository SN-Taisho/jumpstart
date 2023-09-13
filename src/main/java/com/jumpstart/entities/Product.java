package com.jumpstart.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
//	Product Details
	private String name;
	private String description;
	private String price;
	private int sales;
	private int stock;
	
	@Column(nullable = true, length = 64)
	private String photos;

	@Column(nullable = true, length = 64)
	private String photoImagePath;

	@ManyToMany
	@JoinTable(	name = "product_category", 
				joinColumns = @JoinColumn(name = "product_id"),
				inverseJoinColumns = @JoinColumn(name = "category_id"))
	private Set<Category> categories = new HashSet<>();


	
	
//	Constructors
	public Product() {
		
	}
	
public Product(Long id, String name, String description, String price, int sales, int stock, String photos,
			String photoImagePath, Set<Category> categories) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.sales = sales;
		this.stock = stock;
		this.photos = photos;
		this.photoImagePath = photoImagePath;
		this.categories = categories;
	}


	//	Getter Setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public String getPhotos() {
		return photos;
	}

	public void setPhotos(String photos) {
		this.photos = photos;
	}

	public String getPhotoImagePath() {
		return photoImagePath;
	}

	public void setPhotoImagePath(String photoImagePath) {
		this.photoImagePath = photoImagePath;
	}
	
	public Set<Category> getCategories() {
		return categories;
	}

	public void setCategories(Set<Category> categories) {
		this.categories = categories;
	}

	
//	To String
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + ", sales="
				+ sales + ", stock=" + stock + ", photos=" + photos + ", photoImagePath=" + photoImagePath
				+ ", categories=" + categories + "]";
	}
}
