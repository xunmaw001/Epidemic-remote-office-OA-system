package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.BangongshebeiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.BangongshebeiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.BangongshebeiView;


/**
 * 办公设备
 *
 * @author 
 * @email 
 * @date 2020-09-29 12:26:11
 */
public interface BangongshebeiService extends IService<BangongshebeiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<BangongshebeiVO> selectListVO(Wrapper<BangongshebeiEntity> wrapper);
   	
   	BangongshebeiVO selectVO(@Param("ew") Wrapper<BangongshebeiEntity> wrapper);
   	
   	List<BangongshebeiView> selectListView(Wrapper<BangongshebeiEntity> wrapper);
   	
   	BangongshebeiView selectView(@Param("ew") Wrapper<BangongshebeiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<BangongshebeiEntity> wrapper);
   	
}

