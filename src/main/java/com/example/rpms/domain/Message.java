package com.example.rpms.domain;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@SuppressWarnings("serial")
public class Message<T extends Object> implements Serializable {

	private String message;
	private boolean isValid;
	private Serializable entity;
	private List<T> listentity;
	private T object;
	private Map<String, T> map;
	private List<T> table;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isValid() {
		return isValid;
	}

	public void setValid(boolean isValid) {
		this.isValid = isValid;
	}

	public Serializable getEntity() {
		return entity;
	}

	public void setEntity(Serializable entity) {
		this.entity = entity;
	}

	public List<T> getListentity() {
		return listentity;
	}

	public void setListentity(List<T> listentity) {
		this.listentity = listentity;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(T object) {
		this.object = object;
	}

	public Map<String, T> getMap() {
		return map;
	}

	public void setMap(Map<String, T> map) {
		this.map = map;
	}

	public List<T> getTable() {
		return table;
	}

	public void setTable(List<T> table) {
		this.table = table;
	}

}
