package com.dao;

import com.entity.QingjiapingtaiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.QingjiapingtaiVO;
import com.entity.view.QingjiapingtaiView;


/**
 * 请假平台
 * 
 * @author 
 * @email 
 * @date 2020-09-29 12:26:11
 */
public interface QingjiapingtaiDao extends BaseMapper<QingjiapingtaiEntity> {
	
	List<QingjiapingtaiVO> selectListVO(@Param("ew") Wrapper<QingjiapingtaiEntity> wrapper);
	
	QingjiapingtaiVO selectVO(@Param("ew") Wrapper<QingjiapingtaiEntity> wrapper);
	
	List<QingjiapingtaiView> selectListView(@Param("ew") Wrapper<QingjiapingtaiEntity> wrapper);

	List<QingjiapingtaiView> selectListView(Pagination page,@Param("ew") Wrapper<QingjiapingtaiEntity> wrapper);
	
	QingjiapingtaiView selectView(@Param("ew") Wrapper<QingjiapingtaiEntity> wrapper);
	
}
