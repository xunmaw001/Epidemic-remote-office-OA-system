package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.QingjiapingtaiEntity;
import com.entity.view.QingjiapingtaiView;

import com.service.QingjiapingtaiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 请假平台
 * 后端接口
 * @author 
 * @email 
 * @date 2020-09-29 12:26:11
 */
@RestController
@RequestMapping("/qingjiapingtai")
public class QingjiapingtaiController {
    @Autowired
    private QingjiapingtaiService qingjiapingtaiService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,QingjiapingtaiEntity qingjiapingtai, HttpServletRequest request){

        EntityWrapper<QingjiapingtaiEntity> ew = new EntityWrapper<QingjiapingtaiEntity>();
    	PageUtils page = qingjiapingtaiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, qingjiapingtai), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,QingjiapingtaiEntity qingjiapingtai, HttpServletRequest request){
        EntityWrapper<QingjiapingtaiEntity> ew = new EntityWrapper<QingjiapingtaiEntity>();
    	PageUtils page = qingjiapingtaiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, qingjiapingtai), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( QingjiapingtaiEntity qingjiapingtai){
       	EntityWrapper<QingjiapingtaiEntity> ew = new EntityWrapper<QingjiapingtaiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( qingjiapingtai, "qingjiapingtai")); 
        return R.ok().put("data", qingjiapingtaiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(QingjiapingtaiEntity qingjiapingtai){
        EntityWrapper< QingjiapingtaiEntity> ew = new EntityWrapper< QingjiapingtaiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( qingjiapingtai, "qingjiapingtai")); 
		QingjiapingtaiView qingjiapingtaiView =  qingjiapingtaiService.selectView(ew);
		return R.ok("查询请假平台成功").put("data", qingjiapingtaiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        QingjiapingtaiEntity qingjiapingtai = qingjiapingtaiService.selectById(id);
        return R.ok().put("data", qingjiapingtai);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        QingjiapingtaiEntity qingjiapingtai = qingjiapingtaiService.selectById(id);
        return R.ok().put("data", qingjiapingtai);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody QingjiapingtaiEntity qingjiapingtai, HttpServletRequest request){
    	qingjiapingtai.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(qingjiapingtai);

        qingjiapingtaiService.insert(qingjiapingtai);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody QingjiapingtaiEntity qingjiapingtai, HttpServletRequest request){
    	qingjiapingtai.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(qingjiapingtai);

        qingjiapingtaiService.insert(qingjiapingtai);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody QingjiapingtaiEntity qingjiapingtai, HttpServletRequest request){
        //ValidatorUtils.validateEntity(qingjiapingtai);
        qingjiapingtaiService.updateById(qingjiapingtai);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        qingjiapingtaiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<QingjiapingtaiEntity> wrapper = new EntityWrapper<QingjiapingtaiEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = qingjiapingtaiService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
