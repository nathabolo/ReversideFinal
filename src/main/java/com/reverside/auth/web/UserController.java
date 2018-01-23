package com.reverside.auth.web;

import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.reverside.auth.model.Employee;
import com.reverside.auth.model.Timesheet;
import com.reverside.auth.service.NotificationService;
import com.reverside.auth.service.SecurityService;
import com.reverside.auth.service.UserService;
import com.reverside.auth.validator.UserValidator;

@Controller
public class UserController {

	@Autowired
	private NotificationService notificationService;

	@Autowired
	private UserService userService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;

	private Response response;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("userForm", new Employee());

		return "registration";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("userForm") Employee userForm, BindingResult bindingResult,
			Model model) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}

		userService.save(userForm);

		securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

		return "redirect:/welcome";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@RequestMapping(value = "/timesheet", method = RequestMethod.GET)
	public String timesheet(Model model) {
		model.addAttribute("userForm", new Employee());

		return "registration";
	}

	// @RequestMapping(value = "/FormProcessingServlet")
	// public String FormProcessingServlet() {
	// return "FormProcessingServlet";
	// }

	@RequestMapping(value = "/welcome", method = RequestMethod.POST)
	public String welcome(@ModelAttribute("userForm") Timesheet userForm, BindingResult bindingResult, Model model) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}

		userService.save(userForm);

		return "redirect:/timesheet";
	}

	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String welcome(Model model) {

		// Create a user
		Employee employee = new Employee();
		employee.setUsername("Mpho Kobola");
		employee.setEmail("nathabolo@gmail.com");
		employee.getEmail();
		employee.getUsername();

		Request request = new Request();
		request.setResponse(response);

		// send a notification
		try {

			notificationService.sendNotification(employee);

		} catch (MailException e) {

		}

		return "welcome";
	}
}
