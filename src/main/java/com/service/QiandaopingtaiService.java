package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.QiandaopingtaiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.QiandaopingtaiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.QiandaopingtaiView;


/**
 * 签到平台
 *
 * @author 
 * @email 
 * @date 2020-09-29 12:26:11
 */
public interface QiandaopingtaiService extends IService<QiandaopingtaiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<QiandaopingtaiVO> selectListVO(Wrapper<QiandaopingtaiEntity> wrapper);
   	
   	QiandaopingtaiVO selectVO(@Param("ew") Wrapper<QiandaopingtaiEntity> wrapper);
   	
   	List<QiandaopingtaiView> selectListView(Wrapper<QiandaopingtaiEntity> wrapper);
   	
   	QiandaopingtaiView selectView(@Param("ew") Wrapper<QiandaopingtaiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<QiandaopingtaiEntity> wrapper);
   	
}

