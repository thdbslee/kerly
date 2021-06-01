package egovframework.shop.main;

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
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.shop.category.menuVO;
import egovframework.shop.category.shopService;
import egovframework.shop.category.shopVO;
import egovframework.shop.login.userVO;

@Controller
public class mainController {
	
	@Resource(name="shopService")
	private shopService shopService;
	
		@RequestMapping(value="/main.do")
		public String loginForm(HttpSession sess, HttpServletRequest request,ModelMap model,@ModelAttribute("vo")shopVO vo,@ModelAttribute("menuVO") menuVO menuVO)throws Exception{
			/*userVO loginvo = (userVO) request.getSession().getAttribute("login");
			model.addAttribute("loginvo", loginvo);*/
			List<menuVO> menuList = shopService.menuList(menuVO);
			List<shopVO> shopList = shopService.shopList(vo); //상품리스트
			model.addAttribute("menuList", menuList);
			model.addAttribute("shopList", shopList);
			return "/main/main";
		}
	
}
