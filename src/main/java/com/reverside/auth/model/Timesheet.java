package com.reverside.auth.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "timesheet")
public class Timesheet {
    private Long id;
    private String name;
    private String surname;
    private String email;
    private int empNumber;
    private String description;
    private String clientName;
    private String startDate;
    private int totalHours;
    public Timesheet(int empNumber, String description, String clientName, String startDate, int totalHours) {
		super();
		this.empNumber = empNumber;
		this.description = description;
		this.clientName = clientName;
		this.startDate = startDate;
		this.totalHours = totalHours;
	}

	public int getEmpNumber() {
		return empNumber;
	}

	public void setEmpNumber(int empNumber) {
		this.empNumber = empNumber;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public int getTotalHours() {
		return totalHours;
	}

	public void setTotalHours(int totalHours) {
		this.totalHours = totalHours;
	}

	public Timesheet(String surname, String email) {
		super();
		this.surname = surname;
		this.email = email;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private Set<Employee> employees;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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

    @ManyToMany(mappedBy = "roles")
    public Set<Employee> getUsers() {
        return employees;
    }

    public void setUsers(Set<Employee> employees) {
        this.employees = employees;
    }
}
