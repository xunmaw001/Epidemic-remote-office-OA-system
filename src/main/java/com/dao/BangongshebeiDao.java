package com.dao;

import com.entity.BangongshebeiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.BangongshebeiVO;
import com.entity.view.BangongshebeiView;


/**
 * 办公设备
 * 
 * @author 
 * @email 
 * @date 2020-09-29 12:26:11
 */
public interface BangongshebeiDao extends BaseMapper<BangongshebeiEntity> {
	
	List<BangongshebeiVO> selectListVO(@Param("ew") Wrapper<BangongshebeiEntity> wrapper);
	
	BangongshebeiVO selectVO(@Param("ew") Wrapper<BangongshebeiEntity> wrapper);
	
	List<BangongshebeiView> selectListView(@Param("ew") Wrapper<BangongshebeiEntity> wrapper);

	List<BangongshebeiView> selectListView(Pagination page,@Param("ew") Wrapper<BangongshebeiEntity> wrapper);
	
	BangongshebeiView selectView(@Param("ew") Wrapper<BangongshebeiEntity> wrapper);
	
}
