package com.yedam.erp.view;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.stocks.LookupCodesVO;
import com.yedam.erp.stocks.impl.HomeServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	HomeServiceImpl homeServiceImpl;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "/home";
	}

	@RequestMapping("getMostSoldItem.do")
	@ResponseBody
	public List<Map<String, String>> getMostSoldItem() {
		return homeServiceImpl.getMostSoldItem();
	}

	@RequestMapping("getMostBuyItem.do")
	@ResponseBody
	public List<Map<String, String>> getMostBuyItem() {
		return homeServiceImpl.getMostBuyItem();
	}

	@RequestMapping("getInOutQtyChart.do")
	@ResponseBody
	public List<Map<String, Object>> getInOutQtyChart() {
		return homeServiceImpl.getInOutQtyChart();
	}

	@RequestMapping("getInOutAmtChart.do")
	@ResponseBody
	public List<Map<String, Object>> getInOutAmtChart() {
		return homeServiceImpl.getInOutAmtChart();
	}

	@RequestMapping("getCharts")
	public String getCharts() {
		return "stocks/getCharts";
	}

	@RequestMapping("getLookups.do")
	@ResponseBody
	public List<Map<String, Object>> getLookupsDo(Model model, String str, LookupCodesVO vo) {
		// Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = homeServiceImpl.getLookups2(vo);
		// map.put("data", list);
		return list;
	}

	@RequestMapping("updateLookups.do")
	@ResponseBody
	public void updateLookupsDo(LookupCodesVO vo) {
		System.out.println("control====" + vo);
		homeServiceImpl.updateLookups(vo);
	}

	@RequestMapping("updateLookups2.do")
	@ResponseBody
	public void updateLookupsDo2(@RequestParam Map str) {
		System.out.println("control====" + str);
		homeServiceImpl.updateLookups2(str);
	}

	@RequestMapping("getLookups")
	public String getLookups(Model model) {
		List<Map<String, String>> list = homeServiceImpl.getLookValues();
		List<Map<String, String>> dlist = homeServiceImpl.selectLookups("DELIVERY");
		List<Map<String, String>> plist = homeServiceImpl.selectLookups("PAYMENT");
		List<Map<String, String>> slist = homeServiceImpl.selectLookups("SUBINVENTORY");
		model.addAttribute("dlist", dlist);
		model.addAttribute("plist", plist);
		model.addAttribute("slist", slist);

		model.addAttribute("lookupList", list);
		return "stocks/getLookups";
	}

}
