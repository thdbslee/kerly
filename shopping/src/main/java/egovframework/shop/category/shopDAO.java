package egovframework.shop.category;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("shopDAO")
public class shopDAO extends EgovAbstractDAO{

	public boolean productInsert(shopVO vo)throws Exception {
		boolean bol = false;
		bol = update("shopDAO.productInsert",vo) > 0 ? true : false;
		System.out.println("상품insert->"+bol);
		return bol;
	}

	public List<shopVO> shopList(shopVO vo) throws Exception{
		// TODO Auto-generated method stub

		return (List<shopVO>) list("shopDAO.shopList",vo);
	}

	public shopVO productSelect(shopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (shopVO) select("shopDAO.productSelect",vo);
	}

	public int commenTotCnt(shopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (int) select("shopDAO.commenTotCnt",vo);
	}

	public boolean productDelete(shopVO vo)throws Exception {
		// TODO Auto-generated method stub
		boolean bol = false;
		bol = update("shopDAO.productDelete",vo) > 0 ? true : false;
		return bol;
	}

	public List<menuVO> menuList(menuVO menuVO) throws Exception {
		// TODO Auto-generated method stub
		return (List<menuVO>) list("shopDAO.menuList",menuVO);
	}

	public boolean productUpdate(shopVO vo)throws Exception {
		// TODO Auto-generated method stub
		boolean bol = false;
		bol = update("shopDAO.productUpdate",vo) > 0 ? true : false;
		System.out.println("상품수정bol->"+bol);
		return bol;
	}


}
