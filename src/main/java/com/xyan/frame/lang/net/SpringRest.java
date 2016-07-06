package com.xyan.frame.lang.net;

import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;

/**
 * Spring的rest服务
 * @author wangming
 */
public class SpringRest {
	private RestTemplate restTemplate;
	
	public SpringRest() {
		restTemplate=new RestTemplate();
		resetCnMessageConverter(restTemplate);
	}
	private  static void resetCnMessageConverter(RestTemplate restTemplate) {
        List<HttpMessageConverter<?>> converterList = restTemplate.getMessageConverters();
        HttpMessageConverter<?> converterTarget = null;
        for (HttpMessageConverter<?> item : converterList) {
            if (item.getClass() == StringHttpMessageConverter.class) {
                converterTarget = item;
                break;
            }
        }
        if (converterTarget != null) {
            converterList.remove(converterTarget);
        }
        HttpMessageConverter<?> converter = new StringHttpMessageConverter(StandardCharsets.UTF_8);
        converterList.add(converter);
        restTemplate.setMessageConverters(converterList);
	}
}
