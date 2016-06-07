package org.kosta.finalproject.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.AreaVO;
import org.kosta.finalproject.model.vo.BusVO;
import org.kosta.finalproject.model.vo.StationVO;
import org.kosta.finalproject.model.vo.TerminalVO;
import org.kosta.finalproject.model.vo.TrainVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TrafficDAOImpl implements TrafficDAO 
{
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<AreaVO> searchArea() 
	{
		return template.selectList("area.searchArea");
	}

	@Override
	public List<TerminalVO> searchTerminal(String area_name) 
	{
		// TODO Auto-generated method stub
		return template.selectList("terminal.searchTerminal",area_name);
	}

	@Override
	public List<StationVO> searchStation(String area_name) 
	{
		// TODO Auto-generated method stub
		return template.selectList("station.searchStation",area_name);
	}

	@Override
	public List<String> searchEndAreaByTer(String terminalName) 
	{
		// TODO Auto-generated method stub
		return template.selectList("bus.searchEndAreaByTer",terminalName);
	}

	@Override
	public List<String> searchEndAreaBySta(String stationName) 
	{
		// TODO Auto-generated method stub
		return template.selectList("train.searchEndAreaBySta",stationName);
	}

	@Override
	public List<BusVO> getBusList(BusVO busVO) 
	{
		// TODO Auto-generated method stub
		return template.selectList("bus.getBusList",busVO);
	}

	@Override
	public List<TrainVO> getTrainList(TrainVO trainVO)
	{
		// TODO Auto-generated method stub
		return template.selectList("train.getTrainList",trainVO);
	}
}
