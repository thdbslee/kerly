package egovframework.shop.login;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import egovframework.shop.login.userVO;
import egovframework.shop.login.logService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
@Service("logService")
	public class logService  extends EgovAbstractServiceImpl{
		@Resource(name="logDAO")
		private logDAO logDAO;
	
		public int idCount(userVO vo) throws Exception{
			return logDAO.idCount(vo);
		}

		public boolean joinInsert(userVO vo) throws Exception {
			return logDAO.joinInsert(vo);
		}

		public userVO userLogin(userVO vo) throws Exception {
			// TODO Auto-generated method stub
			return logDAO.userLogin(vo);
		}

		public int userPassCount(userVO vo)throws Exception {
			// TODO Auto-generated method stub
			return logDAO.userPassCount(vo);
		}

		public boolean userInfoUpdate(userVO vo)throws Exception {
			// TODO Auto-generated method stub
			return logDAO.userInfoUpdate(vo);
		}

		public int idpwdCount(userVO loginvo)throws Exception{
			// TODO Auto-generated method stub
			return logDAO.idpwdCount(loginvo);
		}

		public List customerList(userVO vo)throws Exception {
			// TODO Auto-generated method stub
			System.out.println("고객정보Service");
			return logDAO.customerList(vo);
		}

		public int commenTotCnt(userVO vo)throws Exception {
			// TODO Auto-generated method stub
			return logDAO.commenTotCnt(vo);
		}

		public userVO customerEdit(userVO vo) throws Exception{
			// TODO Auto-generated method stub
			return logDAO.customerEdit(vo);
		}

		public boolean customerUpdate(userVO vo) throws Exception {
			// TODO Auto-generated method stub
			System.out.println("고객변경Service");
			return logDAO.customerUpdate(vo);
		}

		public boolean customerDelete(userVO vo) throws Exception {
			// TODO Auto-generated method stub
			System.out.println("고객삭제Service");
			return logDAO.customerDelete(vo);
		}


}
