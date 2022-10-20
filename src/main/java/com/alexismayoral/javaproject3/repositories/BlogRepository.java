package com.alexismayoral.javaproject3.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.alexismayoral.javaproject3.models.Blog;

@Repository
public interface BlogRepository extends CrudRepository<Blog, Long>{
	List<Blog> findAll(); 
}
