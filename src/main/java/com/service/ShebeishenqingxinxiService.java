package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ShebeishenqingxinxiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.ShebeishenqingxinxiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.ShebeishenqingxinxiView;


/**
 * 设备申请信息
 *
 * @author 
 * @email 
 * @date 2020-09-29 12:26:12
 */
public interface ShebeishenqingxinxiService extends IService<ShebeishenqingxinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ShebeishenqingxinxiVO> selectListVO(Wrapper<ShebeishenqingxinxiEntity> wrapper);
   	
   	ShebeishenqingxinxiVO selectVO(@Param("ew") Wrapper<ShebeishenqingxinxiEntity> wrapper);
   	
   	List<ShebeishenqingxinxiView> selectListView(Wrapper<ShebeishenqingxinxiEntity> wrapper);
   	
   	ShebeishenqingxinxiView selectView(@Param("ew") Wrapper<ShebeishenqingxinxiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ShebeishenqingxinxiEntity> wrapper);
   	
}

