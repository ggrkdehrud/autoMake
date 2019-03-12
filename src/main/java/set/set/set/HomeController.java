package set.set.set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;


/**
 * Handles requests for the application home page.
 */

@Api(description = "사진게시판 컨트롤러", tags = {"photoBoard Controller"})
@RestController
@RequestMapping(value = "/photo", produces = "application/json")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	@ApiOperation(value = "등록", notes = "등록")
    @ApiResponses(value = {
            @ApiResponse(code = 200, message = "Success"),
            @ApiResponse(code = 404, message = "Not Found")
    })
    @CrossOrigin
    @PostMapping("/enroll")
    public ResponseEntity enrollPhoto(@RequestParam(value = "path", required = true) String path) throws Exception{
        System.out.println(path);
    	//managementService.modifyFilebeatConf(path);
        return new ResponseEntity(HttpStatus.OK);
    }
	
	@ApiOperation(value = "수정", notes = "수정")
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
	
	@ApiOperation(value = "삭제", notes = "삭제")
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
