package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.QingjiapingtaiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.QingjiapingtaiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.QingjiapingtaiView;


/**
 * 请假平台
 *
 * @author 
 * @email 
 * @date 2020-09-29 12:26:11
 */
public interface QingjiapingtaiService extends IService<QingjiapingtaiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<QingjiapingtaiVO> selectListVO(Wrapper<QingjiapingtaiEntity> wrapper);
   	
   	QingjiapingtaiVO selectVO(@Param("ew") Wrapper<QingjiapingtaiEntity> wrapper);
   	
   	List<QingjiapingtaiView> selectListView(Wrapper<QingjiapingtaiEntity> wrapper);
   	
   	QingjiapingtaiView selectView(@Param("ew") Wrapper<QingjiapingtaiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<QingjiapingtaiEntity> wrapper);
   	
}

