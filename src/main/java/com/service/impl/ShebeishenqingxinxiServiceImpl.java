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


import com.dao.ShebeishenqingxinxiDao;
import com.entity.ShebeishenqingxinxiEntity;
import com.service.ShebeishenqingxinxiService;
import com.entity.vo.ShebeishenqingxinxiVO;
import com.entity.view.ShebeishenqingxinxiView;

@Service("shebeishenqingxinxiService")
public class ShebeishenqingxinxiServiceImpl extends ServiceImpl<ShebeishenqingxinxiDao, ShebeishenqingxinxiEntity> implements ShebeishenqingxinxiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ShebeishenqingxinxiEntity> page = this.selectPage(
                new Query<ShebeishenqingxinxiEntity>(params).getPage(),
                new EntityWrapper<ShebeishenqingxinxiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ShebeishenqingxinxiEntity> wrapper) {
		  Page<ShebeishenqingxinxiView> page =new Query<ShebeishenqingxinxiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<ShebeishenqingxinxiVO> selectListVO(Wrapper<ShebeishenqingxinxiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ShebeishenqingxinxiVO selectVO(Wrapper<ShebeishenqingxinxiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ShebeishenqingxinxiView> selectListView(Wrapper<ShebeishenqingxinxiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ShebeishenqingxinxiView selectView(Wrapper<ShebeishenqingxinxiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
