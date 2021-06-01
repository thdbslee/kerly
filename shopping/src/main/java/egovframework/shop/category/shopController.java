package egovframework.shop.category;

import java.io.File;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;


import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.shop.login.userVO;

@Controller
public class shopController {
	@Resource(name="shopService")
	private shopService shopService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** 카테고리  1 : 과일  2:채소  3 :정육/계란  4:수산/건어물
	 * @param request
	 * @param model
	 * @param sess
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/category/shop.do")
	public String shopMain(HttpServletRequest request,Model model,HttpSession sess,@ModelAttribute("vo")shopVO vo, @ModelAttribute("menuVO")menuVO menuVO)throws Exception{
		vo.setPageUnit(propertiesService.getInt("pageUnit")); //페이지 갯수 
		vo.setPageSize(propertiesService.getInt("pageSize")); //페이지 사이즈 
		//paging Setting
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex()); //현재페이지번호 
		paginationInfo.setRecordCountPerPage(6); //한페이지당개시되는게시물건수 
		paginationInfo.setPageSize(vo.getPageSize());//페이지리스트에게시되는페이지건수 
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		int totCnt = shopService.commenTotCnt(vo);
		paginationInfo.setTotalRecordCount(totCnt);
		List<shopVO> shopList = shopService.shopList(vo); //상품리스트
		List<menuVO> menuList = shopService.menuList(menuVO);
		model.addAttribute("shopList", shopList);
		model.addAttribute("menuList", menuList);
		model.addAttribute("paginationInfo", paginationInfo);
	
		return "/product/shop_main";
	}

	//상품등록
	@RequestMapping(value="/category/product_write.do")
	public String productInsertForm(HttpSession sess,HttpServletRequest request,Model model,@ModelAttribute("menuVO")menuVO menuVO)throws Exception{
		List<menuVO> menuList = shopService.menuList(menuVO);
		model.addAttribute("menuList", menuList);
		return "/product/productWrite";
	}
	@ResponseBody
	@Transactional
	@RequestMapping(value="/category/produce_write_ok.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String productInsert(@ModelAttribute("vo")shopVO vo,HttpSession sess,MultipartHttpServletRequest request,Model model)throws Exception{
		



		//파일업로드
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		Map<String,MultipartFile> files = multiRequest.getFileMap();
		System.out.println("files =>"+files);
		InputStream fis = null; //입력스트림
		Iterator itr = files.entrySet().iterator(); //Map전체값출력 entrySet -key,value모두 필요한경우
		while (true) {
			MultipartFile file;
			do {
				do {
					if (!itr.hasNext()) { //hasNext : iterator가 가리키는 데이터장소의 현재위치에서 이동할 항목이있는지체크
						//이동할항목이없으면 insert
						if(shopService.productInsert(vo)) {
							
							return "Y";
						}else {
							return "N";
						}
					}
					Entry<String, MultipartFile> entry = (Entry<String, MultipartFile>) itr.next();
					file = (MultipartFile) entry.getValue();
				} while ("".equals(file.getOriginalFilename()));
			} while (!file.getOriginalFilename().endsWith(".jpg") && !file.getOriginalFilename().endsWith(".JPG")
					&& !file.getOriginalFilename().endsWith(".png")
					&& !file.getOriginalFilename().endsWith(".PNG"));

			
			String filePath = request.getSession().getServletContext().getRealPath("/");
			String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(46));
			String destination = System.nanoTime() + ext;
			System.out.println("파일이름 ->"+ext);
			File saveFile = new File(filePath + "/upload/" + destination);
			
			
			file.transferTo(saveFile);
			vo.setIMG_1(destination);
			
		}
		
	}
	@RequestMapping(value="/category/product_Detail.do")
	public String productDetail(@ModelAttribute("vo")shopVO vo,HttpSession sess,HttpServletRequest request,Model model)throws Exception{
		System.out.println("상품DETAILLLLL");
		vo = shopService.productSelect(vo);
		model.addAttribute("vo", vo);

		return"/product/product_Detail";
				
	}
	@RequestMapping(value="/category/product_update.do")
	public String productUpdateForm(@ModelAttribute("vo")shopVO vo,HttpSession sess,HttpServletRequest request,Model model)throws Exception {
		
		vo = shopService.productSelect(vo);
    	model.addAttribute("shopvo",vo);
        
    	System.out.println("카테고리 ->"+vo.getCategory());
    	System.out.println("색상 - > "+vo.getColor());
    	System.out.println("크기  ->"+vo.getP_size());
		return "/product/product_Edit";
	}
	@ResponseBody
	@Transactional
	@RequestMapping(value="/category/produce_update_ok.do")
	public String productUpdateOKForm(@ModelAttribute("vo")shopVO vo,HttpSession sess,HttpServletRequest request,Model model)throws Exception{
		
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		Map<String,MultipartFile> files = multiRequest.getFileMap();
		InputStream fis = null; //입력스트림
		Iterator itr = files.entrySet().iterator(); //Map전체값출력 entrySet -key,value모두 필요한경우
		while (true) {
			MultipartFile file;
			do {
				do {
					if (!itr.hasNext()) { //hasNext : iterator가 가리키는 데이터장소의 현재위치에서 이동할 항목이있는지체크
						//이동할항목이없으면 insert
						if(shopService.productUpdate(vo)) {
							
							return "Y";
						}else {
							return "N";
						}
					}
					Entry<String, MultipartFile> entry = (Entry<String, MultipartFile>) itr.next();
					file = (MultipartFile) entry.getValue();
				} while ("".equals(file.getOriginalFilename()));
			} while (!file.getOriginalFilename().endsWith(".jpg") && !file.getOriginalFilename().endsWith(".JPG")
					&& !file.getOriginalFilename().endsWith(".png")
					&& !file.getOriginalFilename().endsWith(".PNG"));

			
			String filePath = request.getSession().getServletContext().getRealPath("/");
			String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(46));
			String destination = System.nanoTime() + ext;
			System.out.println("파일이름 ->"+ext);
			File saveFile = new File(filePath + "/upload/" + destination);
			
			
			file.transferTo(saveFile);
			vo.setIMG_1(destination);
			
		}
	}
	@ResponseBody
	@Transactional
	@RequestMapping(value="/category/product_delete.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String deleteForm(@ModelAttribute("vo")shopVO vo,HttpSession sess,HttpServletRequest request,Model model)throws Exception{
		vo.setINXS(request.getParameterValues("INX_CHK"));
		
		if(shopService.productDelete(vo)) {
			System.out.println("상품삭제");
			return "Y";
		}else {
			return "N";
		}
		
	}

}
	

