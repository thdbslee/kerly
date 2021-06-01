package egovframework.shop.login;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.shop.category.menuVO;
import egovframework.shop.category.shopVO;

@Controller
public class loginController {
	@Resource(name="logService")
	private logService logService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value="/login.do")
	public String loginForm(HttpSession sess,HttpServletRequest request,ModelMap model)throws Exception{
		
		return "/login/login";
	}
	@ResponseBody
	@Transactional
	@RequestMapping(value="/login_ok.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String loginConfirm(HttpSession sess,HttpServletRequest request,ModelMap model,@ModelAttribute("loginvo")userVO loginvo)throws Exception{
		int logCnt = logService.idpwdCount(loginvo);
		if(logCnt == 1) {
			loginvo = logService.userLogin(loginvo);
			if(loginvo!=null) {
				sess.setAttribute("login", loginvo);
				return "Y";
			}else {
				return "N";
			}
		}else {
			//로그인 실패시 로그인 실패카운트 증가(FAIL_CNT 
			// 로그인실패카운트 3번넘길시 잠금 처리 
			// LOCK_YN = > 기본값 N => Y 
		/*	logService.failUpdate(loginvo);
			int failCnt = logService.userFailCnt(loginvo);*/
			
			System.out.println("아 이 디 비 밀 번 호 일 치 하 지 않 음");
			return "fail";
		}
		
	}
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession sess,HttpServletRequest request,ModelMap model)throws Exception{
		sess.invalidate();
		return "redirect:/main.do";
	}
	@RequestMapping(value="/join.do")
	public String joinForm(HttpSession sess,HttpServletRequest request,ModelMap model)throws Exception{
		return "/login/join";
	}

	@RequestMapping(value="/idchk.do")
	public String idchkForm(HttpSession sess,HttpServletRequest request,ModelMap model)throws Exception{
		return "/login/idcheck";
	}
	@ResponseBody
	@Transactional
	@RequestMapping(value="/idchk_Confirm.do")
	public String idChk(HttpSession sess,HttpServletRequest request,ModelMap model,@ModelAttribute("vo")userVO vo)throws Exception{
		int idCount = logService.idCount(vo);
		if(idCount == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	@ResponseBody
	@Transactional
	@RequestMapping(value="/join_ok.do")
	public String join_ok(HttpSession sess,HttpServletRequest request,Model model,@ModelAttribute("vo")userVO vo)throws Exception{
		if(logService.joinInsert(vo)) {
			return "Y";
		}else {
			return "N";
		}
		
	}

	/**회원정보변경 
	 * @param sess
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/userInfoUpdate.do")
	public String userInfoForm(HttpSession sess,HttpServletRequest request,Model model,@ModelAttribute("vo")userVO vo)throws Exception{
		userVO loginvo = (userVO) request.getSession().getAttribute("login");
		System.out.println("이름 -> "+loginvo.getUSER_NAME());
		System.out.println("주소 1->"+loginvo.getADR());
		System.out.println("상세주소 ->"+loginvo.getDEADR());
		
		model.addAttribute("vo", vo);
		return"/main/userInfo";
	}
	/* */
	@ResponseBody
	@Transactional
	@RequestMapping(value="/userInfoUpdate_ok.do")
	public String userInfoUpdate(HttpSession sess,HttpServletRequest request,Model model,@ModelAttribute("vo")userVO vo)throws Exception{
		userVO loginvo = (userVO) request.getSession().getAttribute("login");
		
		int passcount =  logService.userPassCount(vo);
		if(passcount == 1) {
			if(logService.userInfoUpdate(vo)){

				loginvo.setUSER_NAME(vo.getUSER_NAME());
				loginvo.setUSER_ADDRESS(vo.getUSER_ADDRESS());
				loginvo.setADR(vo.getADR());
				loginvo.setDEADR(vo.getDEADR());
				loginvo.setUSER_PHONE(vo.getUSER_PHONE());
				sess.setAttribute("login",loginvo); //세션업데이트
				System.out.println("유저이름 -> "+loginvo.getUSER_NAME());
				System.out.println("유저주소 ->" +loginvo.getUSER_ADDRESS());
				return "true"; 
			}else {
				return "false";
			}
		}else {
			return "f";
		}
		
	}
	@RequestMapping(value="/customerInfo.do")
	public String customerInfo(HttpSession sess,HttpServletRequest request,Model model,@ModelAttribute("vo")userVO vo)throws Exception{
		vo.setPageUnit(propertiesService.getInt("pageUnit")); //페이지 갯수 
		vo.setPageSize(propertiesService.getInt("pageSize")); //페이지 사이즈 
		//paging Setting
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex()); //현재페이지번호 
		paginationInfo.setRecordCountPerPage(10); //한페이지당개시되는게시물건수 
		paginationInfo.setPageSize(vo.getPageSize());//페이지리스트에게시되는페이지건수 
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		int totCnt = logService.commenTotCnt(vo);
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("paginationInfo", paginationInfo);
		List cusList = logService.customerList(vo);
		model.addAttribute("cusList", cusList);
		
		return "/main/customerInfo";
	}
	@RequestMapping(value="/exportToExcel.do")
	public String toExcel(HttpSession sess,HttpServletRequest request,Model model,@ModelAttribute("vo")userVO vo)throws Exception{
		List cusList = logService.customerList(vo);
		model.addAttribute("cusList",cusList);
		
		Calendar now = new GregorianCalendar();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hour = now.get(Calendar.HOUR_OF_DAY);
		int minute = now.get(Calendar.MINUTE);
		int second = now.get(Calendar.SECOND);
		int MILLISECOND = now.get(Calendar.MILLISECOND);
		StringBuffer str = new StringBuffer();
		str.append( year ).append( month ).append( day ).append( hour ).append( minute ).append( second ).append( MILLISECOND );
		model.addAttribute("filename", str);

		return"/main/excel";

	}
	@RequestMapping(value="/customerInfoEdit.do")
	public String customerEdit(HttpSession sess, HttpServletRequest request,Model model,@ModelAttribute("vo")userVO vo)throws Exception{
		System.out.println("request인덱스 -> " + request.getParameter("INX"));
		System.out.println("vo인덱스 ->" + vo.getINX());
		vo = logService.customerEdit(vo);
		model.addAttribute("vo", vo);
		
		return "/main/customerEdit";
	}
	@ResponseBody
	@Transactional
	@RequestMapping(value="/customerInfoEdit_ok.do"  ,method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String customerEditOk(HttpSession sess,HttpServletRequest request,Model model,@ModelAttribute("vo")userVO vo)throws Exception{
		if(logService.customerUpdate(vo)) {
			return "true";
		}else {
			
			return "false";
		}
	}
	@ResponseBody
	@Transactional
	@RequestMapping(value="/customerDelete.do")
	public String customerDelete(HttpSession sess,HttpServletRequest request,Model model,@ModelAttribute("vo")userVO vo)throws Exception{
		vo.setINXS(request.getParameterValues("INX"));		
		System.out.println("INXS ->"+ vo.getINXS());
		if(logService.customerDelete(vo)) {
			System.out.println("고객삭제");
			return "true";
		}else {
			return "false";
		}
	}
}
