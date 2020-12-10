package com.example.rpms.domain;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@Table(name = "authorities")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Authorities {
	private Users users;
	private String authority;
	private String username;

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getAuthority() {
		return authority;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "username")
	public Users getUsers() {
		return users;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Id
	public String getUsername() {
		return username;
	}

}