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

import com.entity.BangongshebeiEntity;
import com.entity.view.BangongshebeiView;

import com.service.BangongshebeiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 办公设备
 * 后端接口
 * @author 
 * @email 
 * @date 2020-09-29 12:26:11
 */
@RestController
@RequestMapping("/bangongshebei")
public class BangongshebeiController {
    @Autowired
    private BangongshebeiService bangongshebeiService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,BangongshebeiEntity bangongshebei, HttpServletRequest request){

        EntityWrapper<BangongshebeiEntity> ew = new EntityWrapper<BangongshebeiEntity>();
    	PageUtils page = bangongshebeiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bangongshebei), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,BangongshebeiEntity bangongshebei, HttpServletRequest request){
        EntityWrapper<BangongshebeiEntity> ew = new EntityWrapper<BangongshebeiEntity>();
    	PageUtils page = bangongshebeiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bangongshebei), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( BangongshebeiEntity bangongshebei){
       	EntityWrapper<BangongshebeiEntity> ew = new EntityWrapper<BangongshebeiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( bangongshebei, "bangongshebei")); 
        return R.ok().put("data", bangongshebeiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(BangongshebeiEntity bangongshebei){
        EntityWrapper< BangongshebeiEntity> ew = new EntityWrapper< BangongshebeiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( bangongshebei, "bangongshebei")); 
		BangongshebeiView bangongshebeiView =  bangongshebeiService.selectView(ew);
		return R.ok("查询办公设备成功").put("data", bangongshebeiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        BangongshebeiEntity bangongshebei = bangongshebeiService.selectById(id);
        return R.ok().put("data", bangongshebei);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        BangongshebeiEntity bangongshebei = bangongshebeiService.selectById(id);
        return R.ok().put("data", bangongshebei);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody BangongshebeiEntity bangongshebei, HttpServletRequest request){
    	bangongshebei.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(bangongshebei);

        bangongshebeiService.insert(bangongshebei);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody BangongshebeiEntity bangongshebei, HttpServletRequest request){
    	bangongshebei.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(bangongshebei);

        bangongshebeiService.insert(bangongshebei);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody BangongshebeiEntity bangongshebei, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bangongshebei);
        bangongshebeiService.updateById(bangongshebei);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        bangongshebeiService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<BangongshebeiEntity> wrapper = new EntityWrapper<BangongshebeiEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = bangongshebeiService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
