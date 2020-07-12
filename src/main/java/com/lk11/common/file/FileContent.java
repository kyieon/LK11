package com.lk11.common.file;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public enum FileContent {
	INSTANCE;

	public <T> byte[] convert(List<T> datas, Class<T> clz) throws NotDeclaredFileAnnotationException,
			IllegalArgumentException, IllegalAccessException, SecurityException {
		Annotation[] annotations = clz.getDeclaredAnnotations();
		for (Annotation annotation : annotations) {
			if (annotation instanceof CSVFile) {
				return convertCSVFormat(datas, clz);
			} else {
				throw new NotDeclaredFileAnnotationException();
			}
		}
		return new byte[] {};
	}

	private <T> byte[] convertCSVFormat(List<T> datas, Class<T> clz)
			throws IllegalArgumentException, IllegalAccessException, SecurityException {
		Map<String, Field> map = makeHeaderMap(clz);

		StringBuilder sb = new StringBuilder();
		
		sb.append(printHeader(map)).append("\n");
		sb.append(printContent(map, datas));

		//UTF-8 => euc-kr
		return sb.toString().getBytes(Charset.forName("euc-kr"));
	}

	private <T> String printContent(Map<String, Field> map, List<T> datas) {
		return datas.stream().map(data -> {
			return sort(map.entrySet().stream()).map(e -> e.getValue()).map(field -> {
				field.setAccessible(true);
				try {
					return field.get(data);
				} catch (Exception e) {
					return "";
				}
			}).map(String::valueOf).collect(Collectors.joining(","));
		}).collect(Collectors.joining("\n"));
	}

	private String printHeader(Map<String, Field> map) {
		return sort(map.entrySet().stream()).map(e -> {
			return e.getValue().getAnnotation(Column.class).name();
		}).collect(Collectors.joining(","));
	}

	private Stream<Entry<String, Field>> sort(Stream<Entry<String, Field>> stream) {
		return stream.sorted((e1, e2) -> {
			Column c1 = e1.getValue().getAnnotation(Column.class);
			Column c2 = e2.getValue().getAnnotation(Column.class);
			return Integer.compare(c1.index(), c2.index());
		});
	}

	private <T> Map<String, Field> makeHeaderMap(Class<T> clz) {
		return Arrays.stream(clz.getDeclaredFields()).filter(field -> {
			Column column = field.getAnnotation(Column.class);
			if (null == column) {
				return false;
			}
			return true;
		}).collect(Collectors.toMap(field -> field.getName(), field -> field));
	}
}
