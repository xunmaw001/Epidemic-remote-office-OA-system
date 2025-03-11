package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.BangongshebeiDao;
import com.entity.BangongshebeiEntity;
import com.service.BangongshebeiService;
import com.entity.vo.BangongshebeiVO;
import com.entity.view.BangongshebeiView;

@Service("bangongshebeiService")
public class BangongshebeiServiceImpl extends ServiceImpl<BangongshebeiDao, BangongshebeiEntity> implements BangongshebeiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BangongshebeiEntity> page = this.selectPage(
                new Query<BangongshebeiEntity>(params).getPage(),
                new EntityWrapper<BangongshebeiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<BangongshebeiEntity> wrapper) {
		  Page<BangongshebeiView> page =new Query<BangongshebeiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<BangongshebeiVO> selectListVO(Wrapper<BangongshebeiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public BangongshebeiVO selectVO(Wrapper<BangongshebeiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<BangongshebeiView> selectListView(Wrapper<BangongshebeiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public BangongshebeiView selectView(Wrapper<BangongshebeiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
