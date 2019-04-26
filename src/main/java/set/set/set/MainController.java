package set.set.set;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView model = new ModelAndView();
		HashMap<String, Object> a1 = new HashMap<String, Object>();
		HashMap<String, Object> a2 = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> a = new ArrayList<HashMap<String, Object>>();
		
		a1.put("id", "ggrkdehrud");
		a1.put("title", "good");
		a1.put("content", "nice to meet you");
		a1.put("phone", "010-7333-2369");
		a1.put("etc", "nice to meet you");
		
		a2.put("id", "ggrkdehrud");
		a2.put("title", "good");
		a2.put("content", "nice to meet you");
		a2.put("phone", "010-7333-2369");
		a2.put("etc", "nice to meet you");
		
		a.add(a1);
		a.add(a2);
		
		model.setViewName("index");
		model.addObject("result", a);
		
		return model;
	}
	
	@RequestMapping(value = "/go", method = RequestMethod.POST)
	public ModelAndView go(@RequestParam String nowPage) {
		ModelAndView model = new ModelAndView();
		HashMap<String, Object> a1 = new HashMap<String, Object>();
		HashMap<String, Object> a2 = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> a = new ArrayList<HashMap<String, Object>>();
		
		a1.put("id", "ggrkdehrud");
		a1.put("title", "good");
		a1.put("content", "nice to meet you");
		a1.put("phone", "010-7333-2369");
		a1.put("etc", "nice to meet you");
		
		a2.put("id", "ggrkdehrud");
		a2.put("title", "good");
		a2.put("content", "nice to meet you");
		a2.put("phone", "010-7333-2369");
		a2.put("etc", "nice to meet you");
		
		a.add(a1);
		a.add(a2);
		
		model.setViewName(nowPage);
		model.addObject("result", a);
		//model.addObject("result", a1);
		
		return model;
	}
	
	@RequestMapping(value = "/writeServerFile", method = RequestMethod.POST)
	public ModelAndView writeServerFile() {
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		
		return model;
	}
	
	@RequestMapping(value = "/writeFrontFile", method = RequestMethod.POST)
	public ModelAndView writeFrontFile() {
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		
		return model;
	}
	
	
	
	
	
	
	
	
	
	
	
}
