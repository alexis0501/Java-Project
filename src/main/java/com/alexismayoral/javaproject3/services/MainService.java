package com.alexismayoral.javaproject3.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alexismayoral.javaproject3.models.Blog;
import com.alexismayoral.javaproject3.repositories.BlogRepository;

@Service
public class MainService {
	
	@Autowired
	private BlogRepository blogRepo;
	
	// Find All posts
	// Aka the function that is going to display all the posts on the home page
	public List<Blog> allBlogs(){
		return blogRepo.findAll();
	}
		
	//Find one posts
	//aka when someone clicks the link of a posts it takes them to another page to show the postoly
	public Blog findOneBlog(Long id) {
		Optional<Blog> optionalBlog = blogRepo.findById(id);
		if(optionalBlog.isPresent()) {
			return optionalBlog.get();
		}else{
			return null;
		}
	}
	
	//Create a posts
	public Blog createBlog(Blog blog) {
		return blogRepo.save(blog);
	}
	
	//Update a posts
	public Blog updateBlog(Blog blog) {
		return blogRepo.save(blog);
	} 
	
	//delete a post
	public void deleteBlog(Long id) {
		blogRepo.deleteById(id);
	}
}
