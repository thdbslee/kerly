package egovframework.shop.category;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
@Service("shopService")
public class shopService extends EgovAbstractServiceImpl {
	@Resource(name="shopDAO")
	private shopDAO shopDAO;

	public boolean productInsert(shopVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("상품insertService");
		return shopDAO.productInsert(vo);
	}

	public List<shopVO> shopList(shopVO vo)throws Exception {
		// TODO Auto-generated method stub
		return shopDAO.shopList(vo);
	}

	public shopVO productSelect(shopVO vo) throws Exception{
		// TODO Auto-generated method stub
		return shopDAO.productSelect(vo);
	}

	public int commenTotCnt(shopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return shopDAO.commenTotCnt(vo);
	}

	public boolean productDelete(shopVO vo) throws Exception {
		// TODO Auto-generated method stub
		return shopDAO.productDelete(vo);
	}

	public List<menuVO> menuList(menuVO menuVO) throws Exception {
		// TODO Auto-generated method stub
		return shopDAO.menuList(menuVO);
	}

	public boolean productUpdate(shopVO vo)throws Exception {
		// TODO Auto-generated method stub
		System.out.println("상품UPDATE 서비스");
		return shopDAO.productUpdate(vo);
	}

	
	
}
