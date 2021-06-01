package egovframework.shop.cart;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
@Service("cartService")
public class cartService extends EgovAbstractServiceImpl {
	@Resource(name="cartDAO")
	private cartDAO cartDAO;

	public boolean cartInsert(cartVO cartVO)throws Exception {
		// TODO Auto-generated method stub
		System.out.println("장바구니담기isnert");
		return cartDAO.cartInsert(cartVO);
	}

	public List<cartVO> cartList(cartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return cartDAO.cartList(cartVO);
	}

	public int cartCount(cartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return cartDAO.cartCount(cartVO);
	}

	public boolean cartUpdate(cartVO cartVO)throws Exception{
		// TODO Auto-generated method stub
		return cartDAO.cartUpdate(cartVO);
	}

	public int cartTotalPrice(cartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return cartDAO.cartTotalPrice(cartVO);
	}

	public boolean cartPlus(cartVO cartVO)throws Exception{
		// TODO Auto-generated method stub
		return cartDAO.cartPlus(cartVO);
	}

	public boolean cartMinus(cartVO cartVO)throws Exception {
		// TODO Auto-generated method stub
		System.out.println("수량감소 Service");
		return cartDAO.cartMinus(cartVO);
	}

	
	public void cartDelete(cartVO cartVO)throws Exception {
		// TODO Auto-generated method stub
		System.out.println("장바구니 삭제");	
		 cartDAO.cartDelete(cartVO);
	}

	public boolean cartAmountUpdate(cartVO cartVO)throws Exception {
		// TODO Auto-generated method stub
		return cartDAO.cartAmountUpdate(cartVO);
	}

	public List<cartVO> payList(cartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return cartDAO.payList(cartVO);
	}


	
	
}
