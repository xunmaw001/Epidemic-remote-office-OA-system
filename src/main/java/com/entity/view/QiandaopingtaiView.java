package com.entity.view;

import com.entity.QiandaopingtaiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 签到平台
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2020-09-29 12:26:11
 */
@TableName("qiandaopingtai")
public class QiandaopingtaiView  extends QiandaopingtaiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public QiandaopingtaiView(){
	}
 
 	public QiandaopingtaiView(QiandaopingtaiEntity qiandaopingtaiEntity){
 	try {
			BeanUtils.copyProperties(this, qiandaopingtaiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
