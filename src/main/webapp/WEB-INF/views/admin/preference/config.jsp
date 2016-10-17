<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
.switch{width: 44px;background-color: blue;overflow: hidden;line-height: 1;height: 24px;cursor: pointer;}
.switch .on{display: inline-block;width: 33px;vertical-align: middle;line-height:1.9;height: 24px;}
.switch .off{display: inline-block;width: 33px;vertical-align: middle;line-height:1.9;height: 24px;}
</style>
<div class="mar15">
	<form id="imgForm" action="${path}/index/wangEditor/upload"  target="_self"	enctype="multipart/form-data">
		<div class="row mar5">
			<div class="sol-sm-6 sol-xs-4">
				<div class="form-group form-horizontal mar-top-15">
					<label class="sol-xs-5 control-label pad-right-0  align-right">名称：</label>
					<div class="sol-xs-7"><span class="sol-xs-11">${name}</span></div>
				</div>
			</div>
			<div class="sol-sm-6 sol-xs-4">
				<div class="form-group form-horizontal mar-top-15">
					<label class="sol-xs-5 control-label pad-right-0  align-right">类别：</label>
					<div class="sol-xs-7"><span class="sol-xs-11">${kind }</span></div>
				</div>
			</div>
			<div class="sol-sm-6 sol-xs-4">
				<div class="form-group form-horizontal mar-top-15">
					<label class="sol-xs-5 control-label pad-right-0  align-right">值：</label>
					<div class="sol-xs-7"><span class="sol-xs-11">${value }</span></div>
				</div>
			</div>
		</div>
		<div class="row mar5">
			<div>
				<div class="switch" style="">
					<span class="on" style="">ON</span>
					<span class="off" data-swtich="1" style="">&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<span class="on" style="">OFF</span>
					<input type="checkbox" id="" style="display: none;">
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">

</script>