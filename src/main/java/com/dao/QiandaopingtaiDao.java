package com.dao;

import com.entity.QiandaopingtaiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.QiandaopingtaiVO;
import com.entity.view.QiandaopingtaiView;


/**
 * 签到平台
 * 
 * @author 
 * @email 
 * @date 2020-09-29 12:26:11
 */
public interface QiandaopingtaiDao extends BaseMapper<QiandaopingtaiEntity> {
	
	List<QiandaopingtaiVO> selectListVO(@Param("ew") Wrapper<QiandaopingtaiEntity> wrapper);
	
	QiandaopingtaiVO selectVO(@Param("ew") Wrapper<QiandaopingtaiEntity> wrapper);
	
	List<QiandaopingtaiView> selectListView(@Param("ew") Wrapper<QiandaopingtaiEntity> wrapper);

	List<QiandaopingtaiView> selectListView(Pagination page,@Param("ew") Wrapper<QiandaopingtaiEntity> wrapper);
	
	QiandaopingtaiView selectView(@Param("ew") Wrapper<QiandaopingtaiEntity> wrapper);
	
}
