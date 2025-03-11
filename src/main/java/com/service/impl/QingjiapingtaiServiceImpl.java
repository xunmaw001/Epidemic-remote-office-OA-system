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


import com.dao.QingjiapingtaiDao;
import com.entity.QingjiapingtaiEntity;
import com.service.QingjiapingtaiService;
import com.entity.vo.QingjiapingtaiVO;
import com.entity.view.QingjiapingtaiView;

@Service("qingjiapingtaiService")
public class QingjiapingtaiServiceImpl extends ServiceImpl<QingjiapingtaiDao, QingjiapingtaiEntity> implements QingjiapingtaiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<QingjiapingtaiEntity> page = this.selectPage(
                new Query<QingjiapingtaiEntity>(params).getPage(),
                new EntityWrapper<QingjiapingtaiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<QingjiapingtaiEntity> wrapper) {
		  Page<QingjiapingtaiView> page =new Query<QingjiapingtaiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<QingjiapingtaiVO> selectListVO(Wrapper<QingjiapingtaiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public QingjiapingtaiVO selectVO(Wrapper<QingjiapingtaiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<QingjiapingtaiView> selectListView(Wrapper<QingjiapingtaiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public QingjiapingtaiView selectView(Wrapper<QingjiapingtaiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
