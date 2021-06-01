package egovframework.shop.cart;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;
import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.shop.category.shopVO;
import egovframework.shop.category.menuVO;
import egovframework.shop.category.shopService;
import egovframework.shop.login.userVO;

@Controller
public class cartController {
	@Resource(name="cartService")
	private cartService cartService;
	@Resource(name="shopService")
	private shopService shopService;
	
	@RequestMapping(value="/cart.do")
	public String cartForm(@ModelAttribute("cartVO")cartVO cartVO,@ModelAttribute("menuVO")menuVO menuVO,@ModelAttribute("shVO")shopVO shVO,HttpServletRequest request,Model model)throws Exception{
		userVO loginvo = (userVO) request.getSession().getAttribute("login");
		if(loginvo != null) {
		
			cartVO.setUSER_ID(loginvo.getUSER_ID());
			
		}
		
		List<cartVO> cartList = cartService.cartList(cartVO); //장바구니정보
		List<menuVO> menuList = shopService.menuList(menuVO); //메뉴리스트 
		
		int totalPrice = cartService.cartTotalPrice(cartVO); //장바구니 총금액
		int fee = totalPrice > 100000 ? 0 : 2500;
		int total = fee + totalPrice ; 
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("fee", fee);//배송비
		model.addAttribute("total",total); //배송비 + 총금액
		model.addAttribute("list", cartList);
		model.addAttribute("size",cartList.size());
		return "/cart/cart";
	}

	@ResponseBody
	@Transactional
	@RequestMapping(value="/cart_purchase.do")
	public String cartPurchase(@ModelAttribute("cartVO")cartVO cartVO,HttpServletRequest request,HttpSession sess, Model model)throws Exception{

		return "Y";
	}
	
	
	@RequestMapping(value="/cart_purchaseForm.do")
	public String purchaseForm(@ModelAttribute("cartVO")cartVO cartVO,@ModelAttribute("menuVO")menuVO menuVO,HttpServletRequest request,HttpSession sess,Model model) throws Exception {
		/*userVO loginvo = (userVO) request.getSession().getAttribute("login");
		
		if(loginvo != null) {
			cartVO.setUSER_ID(loginvo.getUSER_ID());	
		}
		List<cartVO> cartList = cartService.cartList(cartVO); //장바구니정보
		
		
		int totalPrice = cartService.cartTotalPrice(cartVO); //장바구니 총금액
		int fee = totalPrice > 100000 ? 0 : 2500;
		int total = fee + totalPrice ; 
		
		model.addAttribute("fee", fee);//배송비
		model.addAttribute("total",total); //배송비 + 총금액
		
		model.addAttribute("size",cartList.size());
		model.addAttribute("cartList", cartList);*/
	
/*		String[] INX_CHK = request.getParameterValues("INX_CHK");
			for(int i=0; i<INX_CHK.length;i++) {
				System.out.println("인덱스 ->" + INX_CHK[i]);
			}*/
		userVO loginvo = (userVO) request.getSession().getAttribute("login");
		if(loginvo !=null) {
			cartVO.setUSER_ID(loginvo.getUSER_ID());
		}
		/*List<cartVO> cartList = cartService.cartList(cartVO);*/
		
		int totalPrice = cartService.cartTotalPrice(cartVO);
		int fee = totalPrice > 100000 ?  0 : 2500 ;
		int total = fee + totalPrice;
		cartVO.setC_INXS(request.getParameterValues("INX_CHK"));
		List<cartVO> payList = cartService.payList(cartVO);
		System.out.println("INX_CHK" + cartVO.getC_INXS());
		model.addAttribute("payList", payList);
		model.addAttribute("fee", fee);
		model.addAttribute("total",total);
		return"/purchase/product_purchase";
	}
	@ResponseBody
	@Transactional
	@RequestMapping(value="/cart_insert.do")
	public String cartInsert(@ModelAttribute("cartVO")cartVO cartVO,HttpServletRequest request,HttpSession sess,Model model)throws Exception{
		int count = cartService.cartCount(cartVO);
		if(count == 0) {
			if(cartService.cartInsert(cartVO)) {
				return "Y";
			}else {
				return "N";
			}
		}else {
			if(cartService.cartUpdate(cartVO)) {
				return"U";
			}else {
				return "T";
			}
		}
		
	}
	/** 장바구니 수량증가
	 * @param cartVO
	 * @param request
	 * @param sess
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@Transactional
	@RequestMapping(value="/cart_amount_plus.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String amount_plus(@ModelAttribute("vo")cartVO cartVO,HttpServletRequest request,HttpSession sess,Model model)throws Exception{
		if(cartService.cartPlus(cartVO)) {
			return "Y";
		}else {
			return "N";
		}
	}
	/** 장바구니 수량감소 
	 * @param cartVO
	 * @param request
	 * @param sess
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@Transactional
	@RequestMapping(value="/cart_amount_minus.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String amount_minus(@ModelAttribute("vo")cartVO cartVO,HttpServletRequest request,HttpSession sess,Model model)throws Exception{
		if(cartService.cartMinus(cartVO)) {
			System.out.println("수량감소");
			return "Y";
		}else {
			return "N";
		}
	}
	@ResponseBody
	@Transactional
	@RequestMapping(value="/cart_amount_update.do")
	public String amount_update(@ModelAttribute("cartVO")cartVO cartVO,HttpServletRequest request,HttpSession sess,Model model)throws Exception{
		if(cartService.cartAmountUpdate(cartVO)) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	
	@ResponseBody
	@Transactional 
	@RequestMapping(value="/cart_delete.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String cart_deleteForm(@ModelAttribute("cartVO")cartVO cartVO,HttpServletRequest request,HttpSession sess,Model model)throws Exception{
		
		cartVO.setC_INXS(request.getParameterValues("INX_CHK"));
		cartService.cartDelete(cartVO);
		
		return "Y";
	}
	
}
