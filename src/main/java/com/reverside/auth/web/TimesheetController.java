package com.reverside.auth.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TimesheetController {
	
	@RequestMapping(value="/timesheet")
	public String timesheet() {
		return "timesheet";
	}

}
