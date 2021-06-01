package egovframework.shop.cart;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
@Repository("cartDAO")
public class cartDAO extends EgovAbstractDAO {

	public boolean cartInsert(cartVO cartVO) throws Exception {
		boolean bol = false;
		bol = update("cartDAO.cartInsert",cartVO) >0 ? true : false;
		System.out.println("bol ->"+bol);
		return bol;
	}

	public List<cartVO> cartList(cartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return (List<cartVO>) list ("cartDAO.cartList",cartVO);
	}

	public int cartCount(cartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		return (int) select("cartDAO.cartCount",cartVO);
	}

	public boolean cartUpdate(cartVO cartVO)throws Exception{
		// TODO Auto-generated method stub
		boolean bol = false;
		bol = update("cartDAO.cartUpdate",cartVO) > 0 ? true : false;
		return bol;
	}

	public int cartTotalPrice(cartVO cartVO)throws Exception{
		// TODO Auto-generated method stub
		return (int) select("cartDAO.cartTotalPrice",cartVO);
	}

	public boolean cartPlus(cartVO cartVO)throws Exception {
		// TODO Auto-generated method stub
		boolean bol = false;
		bol = update("cartDAO.cartPlus",cartVO) > 0 ? true : false; 
		return bol;
	}

	public boolean cartMinus(cartVO cartVO)throws Exception {
		// TODO Auto-generated method stub
		boolean bol = false;
		bol = update("cartDAO.cartMinus",cartVO) > 0 ? true : false;
		System.out.println("bol->"+bol);
		return bol;
	}

	

	public void cartDelete(cartVO cartVO) throws Exception{
		// TODO Auto-generated method stub
		 System.out.println("DAO");
		 delete("cartDAO.cartDelete",cartVO);
	}

	public boolean cartAmountUpdate(cartVO cartVO)throws Exception {
		// TODO Auto-generated method stub
		boolean bol = false;
		bol = update("cartDAO.cartAmountUpdate",cartVO) > 0 ? true : false;
		return bol;
	}

	public List<cartVO> payList(cartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		
		return (List<cartVO>) list("cartDAO.payList" , cartVO);
	}

	
}
