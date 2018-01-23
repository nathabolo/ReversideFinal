package com.reverside.auth.service;

import com.reverside.auth.model.Employee;
import com.reverside.auth.model.Timesheet;

public interface UserService {
    void save(Employee employee);
    void save(Timesheet timesheet);

    Employee findByUsername(String username, String email);
    Timesheet empNumber(int empNumber, String email);
}
