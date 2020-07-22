package com.lk11.common.convert;

import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class MultiValueMapConverter {
	
	public <T> MultiValueMap<String, String> convert(T body) {
        try {
            MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.setSerializationInclusion(Include.NON_NULL);
			Map<String, String> map = objectMapper.convertValue(body, new TypeReference<Map<String, String>>() {});
            params.setAll(map);
            return params;
        } catch (Exception e) {
            throw new IllegalStateException("Url Parameter Convert Error");
        }
    }
}
