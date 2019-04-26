package set.set.set;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import set.set.set.bean.BasicBoardBean;
import set.set.set.bean.BasicBoardListBean;
import set.set.set.bean.BoardBean;
import set.set.set.bean.HomeBean;
import set.set.set.service.HomeService;


/**
 * Handles requests for the application home page.
 */

@Api(description = "�����Խ��� ��Ʈ�ѷ�", tags = {"photoBoard Controller"})
@RestController
@RequestMapping(value = "/photo", produces = "application/json")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Resource(name="HomeService")
	private HomeService homeService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}*/
	
	@ApiOperation(value = "�ʱ� ������", notes = "�ʱ� ������")
    @ApiResponses(value = {
            @ApiResponse(code = 200, message = "Success"),
            @ApiResponse(code = 404, message = "Not Found")
    })
    @CrossOrigin
    @GetMapping("/getFirst")
    public ResponseEntity<BasicBoardListBean> getFirstData() throws Exception{
        
		BasicBoardListBean bblb = new BasicBoardListBean();
		
		BasicBoardBean bbb1 = new BasicBoardBean();
		BasicBoardBean bbb2 = new BasicBoardBean();
		BasicBoardBean bbb3 = new BasicBoardBean();
		BasicBoardBean bbb4 = new BasicBoardBean();
		BasicBoardBean bbb5 = new BasicBoardBean();
		BasicBoardBean bbb6 = new BasicBoardBean();
		
		bbb1.set_id("2018.04.02");
		bbb1.setId("��âȣ");
		bbb1.setTitle("�ܱ�");
		bbb1.setCntView("1");
		bbb1.setCmtIds("�ȳ�ȳ�");
		bbb1.setActions("�ݰ���");
		
		bbb2.set_id("2018.04.02");
		bbb2.setId("��âȣ");
		bbb2.setTitle("�ܱ�");
		bbb2.setCntView("1");
		bbb2.setCmtIds("�ȳ�ȳ�");
		bbb2.setActions("�ݰ���");
		
		bbb3.set_id("2018.04.02");
		bbb3.setId("��âȣ");
		bbb3.setTitle("�ܱ�");
		bbb3.setCntView("1");
		bbb3.setCmtIds("�ȳ�ȳ�");
		bbb3.setActions("�ݰ���");
		
		bbb4.set_id("2018.04.02");
		bbb4.setId("��âȣ");
		bbb4.setTitle("�ܱ�");
		bbb4.setCntView("1");
		bbb4.setCmtIds("�ȳ�ȳ�");
		bbb4.setActions("�ݰ���");
		
		bbb5.set_id("2018.04.02");
		bbb5.setId("��âȣ");
		bbb5.setTitle("�ܱ�");
		bbb5.setCntView("1");
		bbb5.setCmtIds("�ȳ�ȳ�");
		bbb5.setActions("�ݰ���");
		
		bbb6.set_id("2018.04.02");
		bbb6.setId("��âȣ");
		bbb6.setTitle("�ܱ�");
		bbb6.setCntView("1");
		bbb6.setCmtIds("�ȳ�ȳ�");
		bbb6.setActions("�ݰ���");
		
		bblb.setDs(new ArrayList<BasicBoardBean>());
		bblb.getDs().add(bbb1);
		bblb.getDs().add(bbb2);
		bblb.getDs().add(bbb3);
		bblb.getDs().add(bbb4);
		bblb.getDs().add(bbb5);
		//bblb.getDs().add(bbb6);
		bblb.setCnt(6);
		
		ResponseEntity<BasicBoardListBean> rs = new ResponseEntity<BasicBoardListBean>(bblb, HttpStatus.OK);
		
        return rs;
    }
	
	@ApiOperation(value = "����", notes = "����")
    @ApiResponses(value = {
            @ApiResponse(code = 200, message = "Success"),
            @ApiResponse(code = 404, message = "Not Found")
    })
    @CrossOrigin
    @GetMapping("/get")
    public ResponseEntity<HashMap<String, String>> getPhoto() throws Exception{
        
		HomeBean homeBean = new HomeBean();
		
		homeBean.setId("ggrkdehrud");
		homeBean.setTitle("title");
		homeBean.setContent("content");
		
		homeService.readAllData();
		
		
		
		HashMap<String, String> a1 = new HashMap<String, String>();
		a1.put("id", "ggrkdehrud");
		a1.put("title", "good");
		a1.put("title", "nice to meet you");
		
		ResponseEntity<HashMap<String, String>> rs = new ResponseEntity<HashMap<String, String>>(a1, HttpStatus.OK);
		
        return rs;
    }
	
	@ApiOperation(value = "���", notes = "���")
    @ApiResponses(value = {
            @ApiResponse(code = 200, message = "Success"),
            @ApiResponse(code = 404, message = "Not Found")
    })
    @CrossOrigin
    @PostMapping("/enroll")
    public ResponseEntity enrollPhoto(@RequestBody BoardBean boardBean) throws Exception{
        /*System.out.println(path);
        
        String path1 = this.getClass().getResource("").getPath();
		path1 = path1.substring(1, path1.indexOf(".metadata"));
		System.out.println(path1);*/
    	//managementService.modifyFilebeatConf(path);
        
		//System.out.println(boardBean.get_id());
		System.out.println(boardBean.getTitle());
		
		return new ResponseEntity(HttpStatus.OK);
    }
	
	@ApiOperation(value = "����", notes = "����")
    @ApiResponses(value = {
            @ApiResponse(code = 200, message = "Success"),
            @ApiResponse(code = 404, message = "Not Found")
    })
    @CrossOrigin
    @PutMapping("/modify")
    public ResponseEntity modifyPhoto(@RequestParam(value = "path", required = true) String path) throws Exception{
        System.out.println(path);
    	//managementService.modifyFilebeatConf(path);
        return new ResponseEntity(HttpStatus.OK);
    }
	
	@ApiOperation(value = "����", notes = "����")
    @ApiResponses(value = {
            @ApiResponse(code = 200, message = "Success"),
            @ApiResponse(code = 404, message = "Not Found")
    })
    @CrossOrigin
    @DeleteMapping("/delete")
    public ResponseEntity deletePhoto(@RequestParam(value = "path", required = true) String path) throws Exception{
        System.out.println(path);
    	//managementService.modifyFilebeatConf(path);
        return new ResponseEntity(HttpStatus.OK);
    }
	
}
