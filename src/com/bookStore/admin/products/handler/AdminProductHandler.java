package com.bookStore.admin.products.handler;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookStore.admin.products.service.IAdminProductService;
import com.bookStore.common.beans.Product;
import com.bookStore.utils.IdUtils;

/**
 * @
 * @author chenshuai
 * @version 1.0.0
 */
@Controller
@RequestMapping("/admin/products")
public class AdminProductHandler {
	
	@Autowired
	private IAdminProductService adminProductService;

	@RequestMapping("/listProduct.do")
	public String listProduct(Model model) {
		List<Product> products = adminProductService.findAllProducts();
		model.addAttribute("products", products);
		return "/admin/products/list.jsp";
		
	}
	@RequestMapping("/findProductByManyCondition.do")
	public String findProductByManyCondition(Product product,String minprice,String maxprice,Model model) {
		List<Product> products = adminProductService.findProductByManyCondition(product,minprice,maxprice);
		model.addAttribute("product", product);
		model.addAttribute("products", products);
		model.addAttribute("minprice", minprice);
		model.addAttribute("maxprice", maxprice);
		return "/admin/products/list.jsp";
		
	}
	
	@RequestMapping("/findProductById.do")
	public String findProductById(String id, Model model) {
		Product product = adminProductService.findProductById(id);
		model.addAttribute("p", product);
		return "/admin/products/edit.jsp";
		
	}
	
	/**
	 * @param session
	 * @param product
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value="/addProduct.do",method = RequestMethod .POST)
	public String addProduct(HttpSession session,Product product) 
			throws IllegalStateException, IOException {
		product.setId(IdUtils.getUUID().toString());
		if(!product.getFile().isEmpty()) {
		
		String realPath = session.getServletContext().getRealPath("/bookimage/");
		File file = new File(realPath);
		  //如果该文件是不存在的
		  if(!file.exists()) {
			  file.mkdirs();   //创建
		  }
		//文件的名称
		String filename = product.getFile().getOriginalFilename();
		//把文件放在硬盘里
		//already exists and could not be deleted
		product.getFile().transferTo(new File(realPath + File.separator + filename));
		
		//保存文件的路径放在数据库里
		product.setImgurl("/bookimage/" + filename);
		}
		
		int rows = adminProductService.addProduct(product);
		
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	/**
	 * @param session
	 * @param product
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value="/editProduct.do")
	public String editProduct(HttpSession session,Product product) 
			throws IllegalStateException, IOException {
		String filename =null;
		Product target = adminProductService.findProductById(product.getId());
		if(product.getImgurl() == null || (" ").equals(product.getImgurl())) {
			product.setImgurl(target.getImgurl());
		}
		//如果没有编辑图片，就获取原来的图片保持原来的图片信息，sql保持原样，服务器里也不能删除
		if(!product.getFile().isEmpty()) {
		String realPath = session.getServletContext().getRealPath("/bookimage/");
		
		File targetFile = new File(session.getServletContext().getRealPath("/")+target.getImgurl());
		//如果该文件是存在的
		if(targetFile.exists()&&product.getImgurl()!= null && !product.getImgurl().equals(" ")) {
			targetFile.delete();   //删除
		}
		
		//文件的名称
		 filename = product.getFile().getOriginalFilename();
		
		//把文件放在硬盘里
		product.getFile().transferTo(new File(realPath + File.separator + filename));
		
		//保存文件的路径放在数据库里商品的url不为空，且 商品url不为null
		product.setImgurl("/bookimage/" + filename);
		}
		
		
		int rows = adminProductService.editProduct(product);
		
		if (rows > 0) {
			//System.out.println("product:"+product);
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteProduct.do")
	public String deleteProduct(HttpSession session,String id) 
			throws IllegalStateException, IOException {
		
		//String realPath = session.getServletContext().getRealPath("/xxx/");
		
		Product target = adminProductService.findProductById(id);
		
		File targetFile = new File(session.getServletContext().getRealPath("/")+target.getImgurl());
		//如果该文件是存在的
		if(targetFile.exists()) {
			targetFile.delete();   //删除
		}
		System.out.println("targetFile:"+targetFile);
		System.out.println("targetFile-toString:"+targetFile.toString());
		System.out.println("getImgurl:"+target.getImgurl());
		int rows = adminProductService.deleteProduct(id);
		
		if (rows > 0) {
			//System.out.println("product:"+product);
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
