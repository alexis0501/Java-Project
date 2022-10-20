package com.alexismayoral.javaproject3.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.alexismayoral.javaproject3.models.Blog;
import com.alexismayoral.javaproject3.models.User;
import com.alexismayoral.javaproject3.services.MainService;
import com.alexismayoral.javaproject3.services.UserService;

@Controller
public class HomeController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	private UserService userService;
	
	// Home Page
	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		String username = userService.findUserById((Long)session.getAttribute("userId")).getUserName();
		
		model.addAttribute("blogs", mainService.allBlogs());
		model.addAttribute("username", username);
		return "home.jsp";
	}
	
	// Shows all the posts a user has sent (user of whoever is signed in)
	@GetMapping("/your/posts")
	public String yourPosts(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findUserById(userId);
		model.addAttribute("user", user);
		return "showUserPosts.jsp";
	}
	
	// Navigates to the create page
	@GetMapping("/posts/new")
	public String navigateToCreatePost(@ModelAttribute("blog") Blog blog, HttpSession session ) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		return "createPost.jsp";
	} 
	
	// Creates the post
	@PostMapping("/posts/new")
	public String processCreatePost(@Valid @ModelAttribute("blog")Blog blog,
			BindingResult result
			) {
		if(result.hasErrors()) {
			return "createPost.jsp";
		} else {
			mainService.createBlog(blog);
			return "redirect:/home";
		}
	}
	
	// Find a post of the user's choosing
	
	
	// Navigates to the update page 
	@GetMapping("/posts/{id}/edit")
	public String editPostForm(Model model, @PathVariable("id") Long id , HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		model.addAttribute("blog", mainService.findOneBlog(id));
		return ("editPost.jsp");
	}
	
	// Updates the post 
	@PutMapping("/posts/{id}/edit")
	public String processEditForm(@Valid @ModelAttribute("blog")Blog blog,
			BindingResult result) {
		if(result.hasErrors()) {
			return "editPost.jsp";
		}else {
			mainService.updateBlog(blog);
			return "redirect:/home";
		}
	}
	
	// Deletes a post
	@DeleteMapping("/posts/{id}/delete")
	public String deletePost( @PathVariable("id")Long id) {
		mainService.deleteBlog(id);
		return "redirect:/home";
	}
}
