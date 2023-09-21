package com.jumpstart.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jumpstart.entities.ShippingFee;

@Repository
public interface ShippingFeeRepository extends JpaRepository<ShippingFee, Long> {

}
