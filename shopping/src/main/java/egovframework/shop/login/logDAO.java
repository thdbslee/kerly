package egovframework.shop.login;

import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.shop.login.userVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
@Repository("logDAO")
public class logDAO extends EgovAbstractDAO {
	
	public userVO userLogin(userVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (userVO) select("logDAO.userLogin",vo);
	}

	public int idCount(userVO vo) throws Exception{
		return (int) select("logDAO.idCount",vo);
	}

	public boolean joinInsert(userVO vo) throws Exception{
		boolean bol = false;
		bol = update("logDAO.joinInsert",vo) > 0 ? true : false;
		return bol;
		
	}

	public int userPassCount(userVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (int) select("logDAO.userPassCount",vo) ;
	}

	public boolean userInfoUpdate(userVO vo)throws Exception {
		// TODO Auto-generated method stub
		boolean bol = false;
		bol = update("logDAO.userInfoUpdate",vo) > 0 ? true : false;
		return bol;
	}

	public int idpwdCount(userVO loginvo)throws Exception{
		// TODO Auto-generated method stub
		return (int) select("logDAO.idpwdCount",loginvo);
	}

	public List customerList(userVO vo) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("고객정보DAO");
		return (List<userVO>) list("logDAO.customerList",vo);
	}

	public int commenTotCnt(userVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (int) select("logDAO.commenTotCnt",vo);
	}

	public userVO customerEdit(userVO vo)throws Exception {
		// TODO Auto-generated method stub
		return (userVO)select("logDAO.customerEdit",vo);
	}

	public boolean customerUpdate(userVO vo)throws Exception {
		// TODO Auto-generated method stub
		boolean bol = false;
		bol = update("logDAO.customerUpdate",vo) > 0 ? true : false;
		System.out.println("bol ->" +bol);
		return bol;
	}

	public boolean customerDelete(userVO vo)throws Exception {
		// TODO Auto-generated method stub
		boolean bol = false;
		bol = update("logDAO.customerDelete",vo) > 0 ? true : false;
		System.out.println("DAO ->"+bol);
		return bol;
	}

}
