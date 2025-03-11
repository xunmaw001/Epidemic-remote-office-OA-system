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


import com.dao.QiandaopingtaiDao;
import com.entity.QiandaopingtaiEntity;
import com.service.QiandaopingtaiService;
import com.entity.vo.QiandaopingtaiVO;
import com.entity.view.QiandaopingtaiView;

@Service("qiandaopingtaiService")
public class QiandaopingtaiServiceImpl extends ServiceImpl<QiandaopingtaiDao, QiandaopingtaiEntity> implements QiandaopingtaiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<QiandaopingtaiEntity> page = this.selectPage(
                new Query<QiandaopingtaiEntity>(params).getPage(),
                new EntityWrapper<QiandaopingtaiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<QiandaopingtaiEntity> wrapper) {
		  Page<QiandaopingtaiView> page =new Query<QiandaopingtaiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<QiandaopingtaiVO> selectListVO(Wrapper<QiandaopingtaiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public QiandaopingtaiVO selectVO(Wrapper<QiandaopingtaiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<QiandaopingtaiView> selectListView(Wrapper<QiandaopingtaiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public QiandaopingtaiView selectView(Wrapper<QiandaopingtaiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
