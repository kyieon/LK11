/**
 * File Upload Library v1.1.1 - 2018.08.31
 * 
 *  <Usage>
 *  
 *  option.id: (string)
 *  => DIV Tag id
 *  
 *  option.disable: (boolean)
 *  => If true, then disabled.
 *  
 */
(function($, lodash, Vue, fn) {

	$.FileUpload = fn;

})(jQuery, _, Vue, function(option) {

	if(typeof option !== 'object')
		throw Error('Parameter ' + typeof option + '.');

	//Default Option Setting.
	option = option || {};
	$.extend(option, {
		id: option.id || option.el.attr('id'),
		disable: option.disable,
	});

	var vm = _initVue(option);
	var EventBus = new Vue();
	var scroll;
	
	vm.$watch('fileList', function() {
		
		if(option.height == 'auto') return;
		
		var scrollHtml = $(vm.$el).find('.mu-scroller')[0];
		
		if(scroll) {
			scroll.destroy();
			scroll = null;
		}
		
		scroll = new IScroll('.mu-scroller', {
			scrollbars: true,
			mouseWheel: true,
			interactiveScrollbars: true,
			shrinkScrollbars: 'scale',
			fadeScrollbars: false,
			disableMouse: true,
			disablePointer: true,
			disableTouch: true,
			vScrollbar: true,
			hScrollbar: true,
		});
	});

	function _initVue(option) {
		if(!option) return;

		return new Vue({
			el: option.id,
			template: 
				'<div>' +
					'<div class="mu-file-btn mb5">' +
						'<button class="mu-btn mr5 width100" :disabled="!!disable" type="button" @click="addFile">파일선택</button>' +
						'<input class="mu-btn-hide hidden" type="file" multiple @change="handler">' +
						'<button class="mu-btn mu-btn-line width100" :disabled="!!disable" type="button" @click="delFile">삭제</button>' +
					'</div>' +
					'<div class="mu-file-wrap mu-scroller" style="width: 100%; min-height: 90px; max-height: 90px">' +
						'<ul class="mu-file-write">' +
							'<template v-for="(file, index) in fileList">' +
								'<file-row ' +
								':fileId="\'ckbFile\' + index"' +
								':isCheck="false"' +
								':disabled="disable"' + 
								':rFileName="file.realFileName"' +
								':uFileName="file.updateFileName">' +
								'</file-row>' +
							'</template>' +
						'</ul>' +
					'</div>' +
				'</div>',
			data: {
				initUFileNameList: [],
				fileList: [],
				disable: option.disable,
			},
			mounted: function() {
			    this.$nextTick(function () {
			    	if(option.bindEvent)
			    		option.bindEvent();
			    	
			    	EventBus.$emit('bindEvent');
			    })
			},
			computed: {
				
			},
			methods: {
				addFile: function() {
					$(this.$el).find('.mu-file-btn input[type=file]').trigger('click');
				},
				delFile: function() {
					var checkFileList = this.$children
							.filter(function(c) { 
								return Common.CheckBox.isCheck($(c.$el).find('input[type="checkbox"]')) 
							})
							.map(function(o) { 
								return { realFileName: $(o.$el).find('label').text(), updateFileName: $(o.$el).find('input[type="hidden"]').val() };
							});
					this.fileList = _.differenceBy(this.fileList, checkFileList, 'realFileName')
					$(this.$el).find('.mu-file-btn input[type=file]')[0].value = '';
				},
				
				handler: function(e) {
					var that = this;
					_.map(e.target.files)
						.filter(function(file) {
							return !_.includes(getFileNames(that.fileList), file.name);
						})
						.forEach(function(file) {
							that.fileList.push({ realFileName: file.name, updateFileName: undefined, fileObj: file });
						});
				},
			},
			components: {
				'fileRow': {
					template: 
						'<li>' +
							'<div class="mu-checkbox">' +
								'<input v-if="!disabled" :id="fileId" type="checkbox" :checked="isCheck">' +
								'<label :style="getStyle()" :for="fileId">' +
									'<i class="mu-icon-img"></i>' + 
									'{{rFileName}}' +
								'</label>' +
							'</div>' +
						'</li>',
					props: ['fileId', 'disabled', 'isCheck', 'rFileName', 'uFileName'],
					methods: {
						getStyle: function() {
							return !this.disabled ? {} : {'cursor' : 'default'};
						}
					},
				}
			},
		})
	}
	
	function getFileNames(fileList) {
		return fileList.map(function(file) { return file.realFileName });
	}
	
	return {
		create: function(option) {
			if(vm)	this.destory();
			vm = _initVue(option);
		},
		destroy: function() {
			vm.$destroy();
		},
		
		disableSelection: function(b) {
			vm.$data.disable = (b == undefined) ? true : !!b;
		},
		
		/* Set Function */
		setData: function(datas, rFileName, uFileName) {
			if(_.isArray(datas)) {
				vm.$data.initUFileNameList = datas.map(function(data) {
					return data[uFileName];
				})
				vm.$data.fileList = datas.map(function(data) {
					return { realFileName: data[rFileName], updateFileName: data[uFileName], fileObj: null };
				});
			}
		},
		
		/* Get Function */
		getData: function() {
			return vm.$data.fileList;
		},
		
		getFileData: function() {
			return vm.$data.fileList
				.filter(function(file) {
					return !!file.fileObj;
				}).map(function(file) {
					return file.fileObj;
				});
		},
		
		getRNameData: function() {
			return vm.$data.fileList
				.filter(function(file) {
					return !file.fileObj;
				}).map(function(file) {
					return file.realFileName;
				});
		},
		
		getUNameData: function() {
			return vm.$data.fileList
				.filter(function(file) {
					return !file.fileObj;
				}).map(function(file) {
					return file.updateFileName;
				});
		},

		getDeleteFileName: function() {
			return _.difference(vm.$data.initUFileNameList, this.getUNameData());
		},
		
		/**
			Event Type -> {
				bindEvent: 'bindEvent'
				click: 'click', {key: '', name: '', children: []}
			}
		 */
		on: function(event, fn) {
			EventBus.$on(event, fn);
		}
	}
});