package net.app.controller;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import net.app.util.*;

import javax.servlet.http.HttpServletRequest;



import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

/**
 * 
 * @Title controller基类
 * @Package net.huadong.core.base.controller
 * @ClassName: BaseController
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author wangsong
 * @date 2016年3月5日 下午2:02:21
 * @verson
 */
public class BaseController {

	/**
	 * 初始化，将所有传递进来的字符串进行HTML编码，防止xss攻击
	 * 
	 * @param binder
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
			}

			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? value.toString() : "";
			}
		});

		/**
		 * 日期类型转换
		 */
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(DateUtils.parseDate(text));
			}
		});

		/**
		 * 时间类型转换
		 */
		binder.registerCustomEditor(Timestamp.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				Date date = DateUtils.parseDate(text);
				setValue(date == null ? null : new Timestamp(date.getTime()));
			}
		});
	}

	@SuppressWarnings("rawtypes")
	protected Map<String, Object> getWebParams(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String paraName = (String) enu.nextElement();
			map.put(paraName, request.getParameter(paraName));
			System.out.println(paraName+"  "+request.getParameter(paraName));
		}
		return map;
	}

}
