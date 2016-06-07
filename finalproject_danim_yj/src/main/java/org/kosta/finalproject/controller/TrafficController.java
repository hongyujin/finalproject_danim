package org.kosta.finalproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.service.TrafficService;
import org.kosta.finalproject.model.vo.AreaVO;
import org.kosta.finalproject.model.vo.BusVO;
import org.kosta.finalproject.model.vo.StationVO;
import org.kosta.finalproject.model.vo.TerminalVO;
import org.kosta.finalproject.model.vo.TrafficVO;
import org.kosta.finalproject.model.vo.TrainVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TrafficController 
{
	@Resource
	private TrafficService trafficService;
	
	@RequestMapping("searchArea.do")
	@ResponseBody
	public ArrayList<AreaVO> searchArea()
	{
		ArrayList<AreaVO> areaList = (ArrayList<AreaVO>) trafficService.searchArea();
		return areaList;
	}
	
	@RequestMapping("searchTerminal.do")
	@ResponseBody
	public ArrayList<TerminalVO> searchTerminal(String area_name)
	{
		ArrayList<TerminalVO> terminalList = (ArrayList<TerminalVO>) trafficService.searchTerminal(area_name);
		return terminalList;
	}
	
	@RequestMapping("searchStation.do")
	@ResponseBody
	public ArrayList<StationVO> searchStation(String area_name)
	{
		ArrayList<StationVO> stationList = (ArrayList<StationVO>) trafficService.searchStation(area_name);
		return stationList;
	}
	
	@RequestMapping("searchEndAreaByTer.do")
	@ResponseBody
	public ArrayList<String> searchEndAreaByTer(String terminalName)
	{
		ArrayList<String> endAreaList = (ArrayList<String>) trafficService.searchEndAreaByTer(terminalName);
		return endAreaList;
	}
	
	@RequestMapping("searchEndAreaBySta.do")
	@ResponseBody
	public ArrayList<String> searchEndAreaBySta(String stationName)
	{
		ArrayList<String> endAreaList = (ArrayList<String>) trafficService.searchEndAreaBySta(stationName);
		return endAreaList;
	}
	
	@RequestMapping("searchTraffic.do")
	public ModelAndView searchTraffic(String kind,TerminalVO terminalVO,StationVO stationVO,BusVO busVO,TrainVO trainVO)
	{
		TrafficVO trafficVO = new TrafficVO();
		if(kind.equals("버스"))
		{
			busVO.setTerminalVO(terminalVO);
			ArrayList<BusVO> busList = (ArrayList<BusVO>) trafficService.getBusList(busVO);
			trafficVO.setBusList(busList);
		}
		else if(kind.equals("기차"))
		{
			trainVO.setStationVO(stationVO);
			ArrayList<TrainVO> trainList = (ArrayList<TrainVO>) trafficService.getTrainList(trainVO);
			trafficVO.setTrainList(trainList);
		}
		
		return new ModelAndView("traffic_search_result","trafficVO",trafficVO);
	}
}
