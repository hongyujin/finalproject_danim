package org.kosta.finalproject;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.finalproject.model.dao.CommunityDAO;
import org.kosta.finalproject.model.service.CommunityService;
import org.kosta.finalproject.model.vo.CommentVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestJUnit {
	@Resource
	CommunityService service;
	@Resource
	CommunityDAO dao;
	@Test
	public void test(){
		/*String text = "<!DOCTYPE html><head><meta charset='UTF-8'><title>Insert title here</title></head><h1>img html</h1><img src='img/Chrysanthemum.jpg'/><img src='img/Desert.jpg'/><img src='img/Hydrangeas.jpg'/>";
        Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
        Matcher matcher = pattern.matcher(text);
         
        while(matcher.find()){
            System.out.println(matcher.group(0));
        }*/
//		System.out.println(dao.findCommByNo(13));
		List<CommentVO> list = service.getCommentList(27);
		for (CommentVO clvo : list) {
			clvo.setReplyList(dao.getReplyList(clvo.getComment_no()));
		}
	}
}
