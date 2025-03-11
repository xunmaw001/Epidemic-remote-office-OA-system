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

import com.entity.ShebeishenqingxinxiEntity;
import com.entity.view.ShebeishenqingxinxiView;

import com.service.ShebeishenqingxinxiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 设备申请信息
 * 后端接口
 * @author 
 * @email 
 * @date 2020-09-29 12:26:12
 */
@RestController
@RequestMapping("/shebeishenqingxinxi")
public class ShebeishenqingxinxiController {
    @Autowired
    private ShebeishenqingxinxiService shebeishenqingxinxiService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,ShebeishenqingxinxiEntity shebeishenqingxinxi, HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yuangongxinxi")) {
			shebeishenqingxinxi.setYuangonggonghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<ShebeishenqingxinxiEntity> ew = new EntityWrapper<ShebeishenqingxinxiEntity>();
    	PageUtils page = shebeishenqingxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, shebeishenqingxinxi), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,ShebeishenqingxinxiEntity shebeishenqingxinxi, HttpServletRequest request){
        EntityWrapper<ShebeishenqingxinxiEntity> ew = new EntityWrapper<ShebeishenqingxinxiEntity>();
    	PageUtils page = shebeishenqingxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, shebeishenqingxinxi), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( ShebeishenqingxinxiEntity shebeishenqingxinxi){
       	EntityWrapper<ShebeishenqingxinxiEntity> ew = new EntityWrapper<ShebeishenqingxinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( shebeishenqingxinxi, "shebeishenqingxinxi")); 
        return R.ok().put("data", shebeishenqingxinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(ShebeishenqingxinxiEntity shebeishenqingxinxi){
        EntityWrapper< ShebeishenqingxinxiEntity> ew = new EntityWrapper< ShebeishenqingxinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( shebeishenqingxinxi, "shebeishenqingxinxi")); 
		ShebeishenqingxinxiView shebeishenqingxinxiView =  shebeishenqingxinxiService.selectView(ew);
		return R.ok("查询设备申请信息成功").put("data", shebeishenqingxinxiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        ShebeishenqingxinxiEntity shebeishenqingxinxi = shebeishenqingxinxiService.selectById(id);
        return R.ok().put("data", shebeishenqingxinxi);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        ShebeishenqingxinxiEntity shebeishenqingxinxi = shebeishenqingxinxiService.selectById(id);
        return R.ok().put("data", shebeishenqingxinxi);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ShebeishenqingxinxiEntity shebeishenqingxinxi, HttpServletRequest request){
    	shebeishenqingxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(shebeishenqingxinxi);

        shebeishenqingxinxiService.insert(shebeishenqingxinxi);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody ShebeishenqingxinxiEntity shebeishenqingxinxi, HttpServletRequest request){
    	shebeishenqingxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(shebeishenqingxinxi);

        shebeishenqingxinxiService.insert(shebeishenqingxinxi);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ShebeishenqingxinxiEntity shebeishenqingxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(shebeishenqingxinxi);
        shebeishenqingxinxiService.updateById(shebeishenqingxinxi);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        shebeishenqingxinxiService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<ShebeishenqingxinxiEntity> wrapper = new EntityWrapper<ShebeishenqingxinxiEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yuangongxinxi")) {
			wrapper.eq("yuangonggonghao", (String)request.getSession().getAttribute("username"));
		}

		int count = shebeishenqingxinxiService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
