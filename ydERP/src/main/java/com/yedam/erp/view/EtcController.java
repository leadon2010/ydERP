package com.yedam.erp.view;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EtcController {
	@RequestMapping("calculator")
	public String calculator(Model model) {

		return "html/calculator";
	}
}
