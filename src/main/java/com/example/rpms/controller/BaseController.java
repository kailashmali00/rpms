package com.example.rpms.controller;

import java.util.Collection;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.rpms.domain.Users;
import com.example.rpms.service.UsersServices;

public class BaseController {

	Logger logger = Logger.getLogger(BaseController.class);

	@Resource(name = "authenticationManager")
	private AuthenticationManager authenticationManager;

	@Autowired
	private UsersServices usersService;

	@ModelAttribute("authz")
	protected Authentication getPrincipal() {
		Object authentication = SecurityContextHolder.getContext()
				.getAuthentication();
		logger.debug(authentication);
		if (authentication instanceof Authentication) {
			return (Authentication) authentication;
		} else
			return null;
	}

	@ModelAttribute("username")
	protected String getPrincipleUsername() {

		try {
			SecurityContext context = SecurityContextHolder.getContext();
			if (context == null) {
				return "";
			}
			Object authentication = context.getAuthentication();
			if (authentication == null) {
				return "";
			}
			String username = null;
			Object principle = getPrincipal().getPrincipal();
			if (principle instanceof UserDetails) {
				UserDetails user = ((UserDetails) principle);
				username = user.getUsername();
			}
			return username;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}

	protected String getUserName() {

		Authentication authentication = SecurityContextHolder.getContext()
				.getAuthentication();
		Object principle = authentication.getPrincipal();

		if (principle instanceof UserDetails) {
			UserDetails user = ((UserDetails) principle);
			String username = user.getUsername();

			return username;
		}
		return null;
	}

	protected Users getUniqueID(String username) {
		if (username != null) {

			return usersService.getUserByUsername(username);
		}

		return null;
	}

	@ModelAttribute("authorities")
	protected String getAuthorities() {
		String role = "";
		try {
			SecurityContext context = SecurityContextHolder.getContext();
			if (context == null) {
				return "";
			}
			Object authentication = context.getAuthentication();
			if (authentication == null) {
				return "";
			}
			// String username = null;
			Object principle = getPrincipal().getPrincipal();
			if (principle instanceof UserDetails) {
				UserDetails user = ((UserDetails) principle);
				// username = user.getUsername();
				Collection<? extends GrantedAuthority> list = user
						.getAuthorities();
				for (@SuppressWarnings("rawtypes")
				Iterator iterator = list.iterator(); iterator.hasNext();) {
					GrantedAuthority grantedAuthority = (GrantedAuthority) iterator
							.next();
					role = grantedAuthority.getAuthority();
				}
			}
			return role;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	protected void doAutoLogin() {

		try {
			// Must be called from request filtered by Spring Security,
			// otherwise SecurityContextHolder is not updated
			UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(
					"abc", "123");
			System.out.println(token);
			// / token.setDetails(new WebAuthenticationDetails(request));
			Authentication authentication = authenticationManager
					.authenticate(token);
			logger.info("Logging in with [{}]" + authentication.getPrincipal());
			/*
			 * SecurityContextHolder.getContext()
			 * .setAuthentication(authentication);
			 */
		} catch (Exception e) {
			SecurityContextHolder.getContext().setAuthentication(null);
			logger.error("Failure in autoLogin", e);
		}

	}
	
	@RequestMapping(value="/")
	public String home(){
         //String returnUrl = null;
		 //returnUrl = View.INDEX;
		
	    return "redirect:index";
	}
	
	@RequestMapping(value = "/index")
	public String index() {
	//	System.out.println("in index controller");
		return "index";
	}

}
