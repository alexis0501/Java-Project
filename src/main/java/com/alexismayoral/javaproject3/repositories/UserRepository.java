package com.alexismayoral.javaproject3.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.alexismayoral.javaproject3.models.User;


public interface UserRepository extends CrudRepository <User, Long> {
	Optional<User> findByEmail(String email);
}
