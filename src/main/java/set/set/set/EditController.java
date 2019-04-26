package set.set.set;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EditController {
	
	@RequestMapping(value = "/createCategory", method = RequestMethod.POST)
	public ModelAndView CreateCategory(@RequestParam String name, @RequestParam String headerContent) throws Exception {
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		
		//Controller 단으로 옮겨져야되.
		BufferedWriter bufferWriter;
		BufferedReader bufferReader;
		
        try {
        	
        	String basicPath = this.getClass().getResource("").getPath();
			basicPath = basicPath.substring(1, basicPath.indexOf(".metadata"));
			String strRPath = basicPath+"\\settingProject\\src\\main\\webapp\\WEB-INF\\views\\index.jsp";
			String strWPath = basicPath+"\\settingProject\\src\\main\\webapp\\WEB-INF\\views\\header.jsp";
			String header = "<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>\n"
		    +URLDecoder.decode(headerContent,"UTF-8");
			
			bufferWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(strWPath), StandardCharsets.UTF_8));
			
			bufferWriter.write(header);
        	bufferWriter.flush();
        	bufferWriter.close();
        	
			bufferReader = new BufferedReader(new InputStreamReader(new FileInputStream(strRPath), StandardCharsets.UTF_8));
        	strWPath = basicPath+"\\settingProject\\src\\main\\webapp\\WEB-INF\\views\\"+name+".jsp";
        	
        	bufferWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(strWPath), StandardCharsets.UTF_8));
        	
        	// 새롭게 만든 jsp페이지를 작성한다.
        	String data;
        	while((data = bufferReader.readLine()) != null) {
        		bufferWriter.write(data);
        		bufferWriter.newLine();
        	}
        	
            bufferWriter.flush();
            bufferReader.close();
            bufferWriter.close();
            
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		return model;
	}
	
	@RequestMapping(value = "/deleteCategory", method = RequestMethod.POST)
	public ModelAndView DeleteCategory(@RequestParam String name, @RequestParam String headerContent) throws Exception {
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		
		BufferedWriter bufferWriter;
		
        try {
        	String basicPath = this.getClass().getResource("").getPath();
			basicPath = basicPath.substring(1, basicPath.indexOf(".metadata"));
			String strWPath = basicPath+"\\settingProject\\src\\main\\webapp\\WEB-INF\\views\\header.jsp";
			String strRPath = basicPath+"\\settingProject\\src\\main\\webapp\\WEB-INF\\views\\"+name+".jsp";
			String header = "<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>\n"
			+URLDecoder.decode(headerContent,"UTF-8");
			
			bufferWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(strWPath), StandardCharsets.UTF_8));
			
        	bufferWriter.write(header);
        	bufferWriter.flush();
        	bufferWriter.close();
			
        	// 드롭박스일 경우 전체삭제 로직을 만들어야한다.
			
    		File file = new File(strRPath);
    		
    		if(file.exists()) {
    			file.delete();
    		}
            
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		return model;
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView write(@RequestParam String header_contents, @RequestParam String middle_contents, @RequestParam String bottom_contents, @RequestParam String[] name, @RequestParam String page) throws Exception {
		ModelAndView model = new ModelAndView();
		model.setViewName(page);
		
		//Controller 단으로 옮겨져야되.
		BufferedWriter bufferWriter;
		BufferedReader bufferReader;
		 
        try {
        	
        	String basicPath = this.getClass().getResource("").getPath();
			basicPath = basicPath.substring(1, basicPath.indexOf(".metadata"));
			String strRPath = basicPath+"\\settingProject\\src\\main\\webapp\\WEB-INF\\views\\index.jsp";
			String strWPath = basicPath+"\\settingProject\\src\\main\\webapp\\WEB-INF\\views\\header.jsp";
			String header = "<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>\n"
        	+URLDecoder.decode(header_contents,"UTF-8");
        	
        	bufferReader = new BufferedReader(new FileReader(strRPath));
        	bufferWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(strWPath), StandardCharsets.UTF_8));
        	
        	bufferWriter.write(header);
        	bufferWriter.flush();
        	bufferWriter.close();
        	
        	for(int i = 0; i < name.length; i++) {
        		strWPath = basicPath+"\\settingProject\\src\\main\\webapp\\WEB-INF\\views\\"+name[i]+".jsp";
        		File file = new File(strWPath);
        		
        		if(!file.exists()) {
        			bufferWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(strWPath), StandardCharsets.UTF_8));
        			
        			String data;
                	while((data = bufferReader.readLine()) != null) {
                		bufferWriter.write(data);
                		bufferWriter.newLine();
                	}
                	
                	bufferWriter.flush();
                    bufferWriter.close();
        		}
        	}
        	
        	bufferReader.close();
        	
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		return model;
	}
	
	@RequestMapping(value = "/BFWrite", method = RequestMethod.POST)
	public ModelAndView BFWrite(@RequestParam String header_contents, @RequestParam String middle_contents, @RequestParam String bottom_contents, @RequestParam String name, @RequestParam String page) throws Exception {
		ModelAndView model = new ModelAndView();
		model.setViewName(page);
		
		//Controller 단으로 옮겨져야되.
		boolean isFind = false;
		BufferedWriter bufferWriter;
		BufferedReader bufferReader;
		 
        try {
        	String basicPath = this.getClass().getResource("").getPath();
			basicPath = basicPath.substring(1, basicPath.indexOf(".metadata"));
			String strRPath = basicPath+"\\settingProject\\src\\main\\webapp\\WEB-INF\\views\\index.jsp";
			String strWPath = basicPath+"\\settingProject\\src\\main\\webapp\\WEB-INF\\views\\파일럿.jsp";
			String middleContents = URLDecoder.decode(middle_contents,"UTF-8");
			middleContents = middleContents.replaceAll("foreach", "forEach");
			
			bufferReader = new BufferedReader(new InputStreamReader(new FileInputStream(strRPath), StandardCharsets.UTF_8));
        	bufferWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(strWPath), StandardCharsets.UTF_8));

        	String data;
        	while((data = bufferReader.readLine()) != null) {
        		if(data.contains("<div id = \"main_right_bottom\">")) {
        			isFind = false;

        			bufferWriter.write("\t\t<div id = \"main_right_middle\">");
        			bufferWriter.newLine();
        			bufferWriter.write("\t\t\t"+middleContents.trim());
        			bufferWriter.newLine();
        			bufferWriter.write("\t\t</div>");
        			bufferWriter.newLine();
        			bufferWriter.newLine();
        		}

        		if(isFind) {
        			continue;
        		}

        		if(data.contains("<div id = \"main_right_middle\">")) {
        			isFind = true;

        			continue;
        		}


        		bufferWriter.write(data);
        		bufferWriter.newLine();
        	}

        	bufferWriter.flush();
        	bufferWriter.close();



        	bufferReader.close();
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
    		
    		model.addObject("result", a);

        } catch (IOException e) {
        	e.printStackTrace();
        }

		return model;
	}
}
