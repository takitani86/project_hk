package com.hk.one.dao;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.ProductDto;

	@Repository
	public class ProductDao implements IProductDao {
		
	private boolean flag=true;
	private String namespace="Product.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String UPLOAD_PATH = "C:\\DEV\\image\\product\\";

	@Override
	public String saveFile(MultipartFile file) {
		// 파일이름 변경
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
		// 저장할 파일 객체를 생성(껍데기 파일)
		File saveFile = new File(UPLOAD_PATH, saveName); // 저장할 폴더 이름, 저장할 파일 이름
				
			try {
				file.transferTo(saveFile); // 업로드파일에 saveFile이라는 껍데기를 입힌다
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
		return saveName;
	}
	
//	@Override
//	public List<ProductDto> getAllProductList() {
//		if(flag==true) {
//			flag=false;
//			System.out.println("falg상태=" +flag);
//			return sqlSession.selectList(namespace+"selectProductList");
//		}else {
//			flag=true;
//			System.out.println("falg상태=" +flag);
//			return sqlSession.selectList(namespace+"selectReverseProductList");
//		}
//		
//	}

	@Override
	public ProductDto getProduct(int dto) {
		return sqlSession.selectOne(namespace+"selectProductOne",dto);
	}

	@Override
	public boolean insertProduct(ProductDto dto) {
		 int count=sqlSession.insert(namespace+"insertProduct",dto);
		 return count>0?true:false;
	}

	@Override
	public boolean insertCategory(CategoryDto dto) {
		 int count=sqlSession.insert(namespace+"insertCategory",dto);
		 return count>0?true:false;
	}

	@Override
	public boolean updateProductImg(ProductDto dto) {
		 int count=sqlSession.update(namespace+"insertProductImg",dto);
		 return count>0?true:false;
	}

	@Override
	public boolean updateProduct(ProductDto dto) {
		 int count=sqlSession.update(namespace+"updateProduct",dto);
		 System.out.println(count);
		 return count>0?true:false;
	}


	@Override
	public boolean mulDelProduct(String[] seqs) {
		Map<String,String[]>map=new HashMap<String, String[]>();
		map.put("seqs", seqs);
		int count=sqlSession.update(namespace+"muldelProduct",map);
		return count>0?true:false;
	}
	
	@Override
	public int countProductPage() {
		int countProductPage=0;
		countProductPage=sqlSession.selectOne(namespace+"countProductPage");
		return countProductPage;
	
	}

	@Override
	public List<ProductDto> getAllProductList(String countProductPage) {
		List<ProductDto> list=new ArrayList<ProductDto>();
		if(flag==true) {
			System.out.println("flag상태ㅔ" +flag);
			flag=false;
			list=sqlSession.selectList(namespace+"selectProductList",countProductPage);
			return list;
		}else {
			System.out.println("flag상태ㅔ" +flag);
			flag=true;
			list=sqlSession.selectList(namespace+"selectReverseProductList",countProductPage);
			return list;
		}
		
	}
	
	@Override
	public boolean sortProduct(String pro_sort) {
		int count=sqlSession.update(namespace+"sortProduct",pro_sort);
		return count>0?true:false;
	}
}
