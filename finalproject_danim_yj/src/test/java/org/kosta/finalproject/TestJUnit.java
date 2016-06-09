package org.kosta.finalproject;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.finalproject.model.service.CommunityService;
import org.kosta.finalproject.model.vo.CommLikeVO;
import org.kosta.finalproject.model.vo.CommListVO;
import org.kosta.finalproject.model.vo.CommunityVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestJUnit {
	@Resource
	CommunityService service;
	@Test
	public void test(){
		/*String text = "<!DOCTYPE html><head><meta charset='UTF-8'><title>Insert title here</title></head><h1>img html</h1><img src='img/Chrysanthemum.jpg'/><img src='img/Desert.jpg'/><img src='img/Hydrangeas.jpg'/>";
        Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
        Matcher matcher = pattern.matcher(text);
         
        while(matcher.find()){
            System.out.println(matcher.group(0));
        }*/
	}
}
