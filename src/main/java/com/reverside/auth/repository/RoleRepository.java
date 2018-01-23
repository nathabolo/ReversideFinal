package com.reverside.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.reverside.auth.model.Timesheet;

public interface RoleRepository extends JpaRepository<Timesheet, Long>{
}
