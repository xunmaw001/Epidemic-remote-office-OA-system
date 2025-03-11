package com.dao;

import com.entity.ShebeishenqingxinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ShebeishenqingxinxiVO;
import com.entity.view.ShebeishenqingxinxiView;


/**
 * 设备申请信息
 * 
 * @author 
 * @email 
 * @date 2020-09-29 12:26:12
 */
public interface ShebeishenqingxinxiDao extends BaseMapper<ShebeishenqingxinxiEntity> {
	
	List<ShebeishenqingxinxiVO> selectListVO(@Param("ew") Wrapper<ShebeishenqingxinxiEntity> wrapper);
	
	ShebeishenqingxinxiVO selectVO(@Param("ew") Wrapper<ShebeishenqingxinxiEntity> wrapper);
	
	List<ShebeishenqingxinxiView> selectListView(@Param("ew") Wrapper<ShebeishenqingxinxiEntity> wrapper);

	List<ShebeishenqingxinxiView> selectListView(Pagination page,@Param("ew") Wrapper<ShebeishenqingxinxiEntity> wrapper);
	
	ShebeishenqingxinxiView selectView(@Param("ew") Wrapper<ShebeishenqingxinxiEntity> wrapper);
	
}
