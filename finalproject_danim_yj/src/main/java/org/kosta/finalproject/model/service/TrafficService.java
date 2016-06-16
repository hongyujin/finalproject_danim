package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.vo.AreaVO;
import org.kosta.finalproject.model.vo.BusVO;
import org.kosta.finalproject.model.vo.StationVO;
import org.kosta.finalproject.model.vo.TerminalVO;
import org.kosta.finalproject.model.vo.TrainVO;

public interface TrafficService
{
	public List<AreaVO> searchArea();

	public List<TerminalVO> searchTerminal(String area_name);

	public List<StationVO> searchStation(String area_name);

	public List<String> searchEndAreaByTer(String terminalName);

	public List<String> searchEndAreaBySta(String stationName);

	public List<BusVO> getBusList(BusVO busVO);

	public List<TrainVO> getTrainList(TrainVO trainVO);
}