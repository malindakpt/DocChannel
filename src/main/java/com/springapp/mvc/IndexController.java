package com.springapp.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class IndexController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		return "index";
	}
}

@Controller
@RequestMapping("/loadAds")
class LoadAdsController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("page2", "loadAds");
		return "index";
	}
}

@Controller
 @RequestMapping("/channelManager")
 class ChannelManagerController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("page2", "channelManager");
		return "index";
	}
}

@Controller
@RequestMapping("/createChannel")
class CreateChannelController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("page2", "createChannel");
		return "index";
	}
}

@Controller
@RequestMapping("/dashBoard")
class DashboardManagerController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("page2", "dashBoard");
		return "index";
	}
}

@Controller
@RequestMapping("/createDoctor")
class CreateDoctorController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("page2", "createDoctor");
		return "index";
	}
}

@Controller
@RequestMapping("/error")
class errorController {
	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("page2", "createDoctor");
		return "error";
	}
}