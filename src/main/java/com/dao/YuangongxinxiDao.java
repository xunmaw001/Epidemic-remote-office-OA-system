package com.dao;

import com.entity.YuangongxinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.YuangongxinxiVO;
import com.entity.view.YuangongxinxiView;


/**
 * 员工信息
 * 
 * @author 
 * @email 
 * @date 2020-09-29 12:26:11
 */
public interface YuangongxinxiDao extends BaseMapper<YuangongxinxiEntity> {
	
	List<YuangongxinxiVO> selectListVO(@Param("ew") Wrapper<YuangongxinxiEntity> wrapper);
	
	YuangongxinxiVO selectVO(@Param("ew") Wrapper<YuangongxinxiEntity> wrapper);
	
	List<YuangongxinxiView> selectListView(@Param("ew") Wrapper<YuangongxinxiEntity> wrapper);

	List<YuangongxinxiView> selectListView(Pagination page,@Param("ew") Wrapper<YuangongxinxiEntity> wrapper);
	
	YuangongxinxiView selectView(@Param("ew") Wrapper<YuangongxinxiEntity> wrapper);
	
}
