/**
 * Advisor v1.0 - 2020.07.01
 */
(function($, fn) {

	$.Advisor = new fn();
	
})(jQuery, function() {

	$.ajaxSetup({
	  beforeSend:function(jqXHR,settings){
	    if (settings.dataType === 'binary'){
	      settings.xhr().responseType='arraybuffer';
	      settings.processData=false;
	    }
	  }
	})
		
	function convertJSONMessage(res) {
		if(typeof res == 'string') {
			try {
				return JSON.parse(res);
			} catch(error) {
				return res;
			}
		}
		return res;
	}
	
	function getErrorMessage(error) {
		return convertJSONMessage(error).message;
	}
	
	function isFormData(obj) {
		return getObjectClassName(obj) === 'FormData'
	}
	
	function getObjectClassName(obj) {
		if(!obj)
			return '';
		return obj.constructor.name;
	}
	
	function ajax(option) {
		$.ajax({
            cache: false,
            async : option.async || true,
            type: option.type,
            url: ( option.url || '' ).replace('//', '/'),
            data: option.data,
            dataType: option.dataType || 'json',
            contentType: isFormData(option.data) ? false : (option.contentType || 'application/json'),
            processData: isFormData(option.data) ? false : true,
            beforeSend: function() {
            	isProcess = true;
            },
            success: function(res) {
            	res = convertJSONMessage(res);
            	if(!res.success) {
					var message = res.message || ''
					console.log(message, false);
					
					if(option.error)
						option.error(message)
					
					return;
				}
            	
            	if(!option.success)
					return;
				
				option.success(res.data);
            },
            error: function(req, status, message) {
            	var resText = req.responseText || '';
            	if(!option.error) {
					console.log(status + '[' + req.status + ']' + ' - ' + getErrorMessage(resText), false);
					return;
				}
            	option.error(getErrorMessage(resText));
            },
            complete: function(xhr, status) {
                isProcess = false;
            }
        });
	}
	
	function ajaxPromise(option) {
		var deferred = $.Deferred();
		
		$.ajax({
            cache: false,
            async : option.async || true,
            type: option.type,
            url: ( option.url || '' ).replace('//', '/'),
            data: option.data,
            contentType: isFormData(option.data) ? false : (option.contentType || 'application/json'),
            processData: isFormData(option.data) ? false : true,
            beforeSend: function() {
            	isProcess = true;
            },
            success: function(res) {
            	res = convertJSONMessage(res);
            	if(!res.success) {
					var message = res.message || ''
					console.log(message, false);
					
					if(option.error)
						option.error(message)
					
					return;
				}
            	deferred.resolve(res.data);
            },
            error: function(req, status, message) {
            	var resText = req.responseText || '';
            	deferred.reject(getErrorMessage(resText));
            },
            complete: function(xhr, status) {
                isProcess = false;
            }
        });
		return deferred.promise();
	}

	function ajaxSync(option) {
		
		var result;
		
		$.ajax({
            cache: false,
            async : false,
            type: option.type,
            url: ( option.url || '' ).replace('//', '/'),
            data: option.data,
            contentType: isFormData(option.data) ? false : (option.contentType || 'application/json'),
            processData: isFormData(option.data) ? false : true,
            beforeSend: function() {
            	isProcess = true;
            },
            success: function(res) {
            	res = convertJSONMessage(res);
            	if(!res.success) {
					var message = res.message || ''
					console.log(message, false);
					
					if(option.error)
						option.error(message)
					
					return;
				}
            	result = res.data;
            },
            error: function(req, status, message) {
            	var resText = req.responseText || '';
            	if(!option.error) {
					console.log(status + '[' + req.status + ']' + ':' + getErrorMessage(resText), false);
					return;
				}
            	result = getErrorMessage(resText);
            },
            complete: function(xhr, status) {
                isProcess = false;
            }
        });
		return result;
	}
	
	function ajaxForm(form, option) {
		
		$(form).ajaxSubmit({
			cache: false,
			type: option.type,
			url: ( option.url || '' ).replace('//', '/'),
			//enctype: 'multipart/form-data',
			//dataType: 'json',
			beforeSubmit: function(data, frm, opt) {
				isProcess = true;
				
				if(!option.validation)
					return true;
				
				if(option.convertData)
					data = option.convertData(data);
				
				return option.validation(data, frm, opt)
			},
			success: function(res) {
				res = convertJSONMessage(res);
				if(!res.success) {
					var message = res.message || ''
					console.log(message, false);
					
					if(option.error)
						option.error(message)
					
					return;
				}
				if(!option.success)
					return;
				
				option.success(res.data);
			},
			 error: function(req, status, message) {
				 var resText = req.responseText || '';
				if(!option.error) {
					console.log(status + '[' + req.status + ']' + ':' + getErrorMessage(resText), false);
					return;
				}
				option.error(getErrorMessage(resText));
			},
			complete: function(xhr, status) {
				isProcess = false;
			}
		});
	}
	

	function ajaxBinary(option) {
		$.ajax({
			url: ( option.url || '' ).replace('//', '/'),
			dataType: 'native',
			data: option.data,
            xhrFields: {
                responseType: 'blob'
            },
            beforeSend: function() {
            	isProcess = true;
            },
            success: function(blob) {
            	if(!option.success)
					return;
				
				option.success(res.data);
            },
            error: function(req, status, message) {
            	var resText = req.responseText || '';
            	if(!option.error) {
					console.log(status + '[' + req.status + ']' + ':' + getErrorMessage(resText), false);
					return;
				}
            	option.error(getErrorMessage(resText));
            },
            complete: function(xhr, status) {
                isProcess = false;
            }
        });
	}
	
	return {
		getBinary: function(url, option) {
			option = option || {};
			$.extend(option, {
				type: 'get',
				url: url || '/'
			});
			ajaxBinary(option);
		},
		get: function(url, option) {
			option = option || {};
			$.extend(option, {
				type: 'get',
				url: url || '/'
			});
			ajax(option);
		},
		getSync: function(url, data) {
			var option = {
				type: 'get',
				url: url || '/',
				data : data || {}
			};
			return ajaxSync(option);
		},
		getPromise: function(url, option) {
			option = option || {};
			$.extend(option, {
				type: 'get',
				url: url || '/'
			});
			return ajaxPromise(option);
		},
		post: function(url, option) {
			option = option || {};
			$.extend(option, {
				type: 'post',
				url: url || '/',
			});
			ajax(option);
		},
		postSync: function(url, data) {
			var option = {
				type: 'post',
				url: url || '/',
				data : data || {}
			};
			return ajaxSync(option);
		},
		postPromise: function(url, option) {
			option = option || {};
			$.extend(option, {
				type: 'post',
				url: url || '/'
			});
			return ajaxPromise(option);
		},
		getByForm: function(form, option) {
			option = option || {};
			$.extend(option, {
				type: 'get',
				url: option.url || '',
			});
			ajaxForm(option);
		},
		postByForm: function(form, option) {
			option = option || {};
			$.extend(option, {
				type: 'post',
				url: option.url || '',
			});
			ajaxForm(form, option);
		},
		put: function(url, option) {
			option = option || {};
			$.extend(option, {
				type: 'put',
				url: url || '/',
			});
			ajax(option);
		},
		delete: function(url, option) {
			option = option || {};
			$.extend(option, {
				type: 'delete',
				url: url || '/',
			});
			ajax(option);
		},
	}
})