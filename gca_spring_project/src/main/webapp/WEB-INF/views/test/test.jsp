<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
$("document").ready(function() {
	  $(".slider").rangeslider();
	});
	$.fn.rangeslider = function(options) {
	  var obj = this;
	  var defautValue = obj.attr("value");
	  obj.wrap("<span class='range-slider'></span>");
	  obj.after("<span class='slider-container'><span class='bar'><span></span></span><span class='bar-btn'><span>0</span></span></span>");
	  obj.attr("oninput", "updateSlider(this)");
	  updateSlider(this);
	  return obj;
	};

	function updateSlider(passObj) {
	  var obj = $(passObj);
	  var value = obj.val();
	  var min = obj.attr("min");
	  var max = obj.attr("max");
	  var range = Math.round(max - min);
	  var percentage = Math.round((value - min) * 100 / range);
	  var nextObj = obj.next();
	  nextObj.find("span.bar-btn").css("left", percentage + "%");
	  nextObj.find("span.bar > span").css("width", percentage + "%");
	  nextObj.find("span.bar-btn > span").text(percentage);
	};


</script>

<style>

.range-slider {
  display: inline-block;
  width: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  position: relative;
  padding-bottom: 15px;
  & > input {
    opacity: 0;
    width: 100%;
    position: relative;
    z-index: 5;
    margin-top: 72px;
    -webkit-appearance: none;
    &::-webkit-slider-thumb {
      -webkit-appearance: none;
      z-index: 100;
      position: relative;
      width: 50px;
      height: 30px;
      -webkit-border-radius: 10px;
    }
  }
  & > span.slider-container {
    display: inline-block;
    min-height: 110px;
    display: inline-block;
    position: absolute;
    top: 70px;
    left: -8px;
    right: 46px;
    z-index: 3;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    & > span.bar {
        background-color: #000;
        display: inline-block;
        position: absolute;
        z-index: 1;
        top: 12px;
        left: 10px;
        right: -42px;
        height: 11px;
        overflow: hidden;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        & > span {
          background: #02c38a;
          display: inline-block;
          float: left;
          height: 11px;
          width: 0%;
        }
      }
      & > span.bar-btn {
        display: inline-block;
        position: absolute;
        width: 46px;
        height: 30px;
        padding-top: 8px;
        font-weight: bold;
        text-align: center;
        background: #fff;
        left: -25px;
        top: -65px;
        border-radius: 3px;
        border: #333 2px solid;
        -webkit-box-shadow: 0px 0px 10px rgba(0, 0, 0, .8);
        -moz-box-shadow: 0px 0px 10px rgba(0, 0, 0, .8);
        box-shadow: 0px 0px 10px rgba(0, 0, 0, .8);
        &:after {
          content: "";
          border: 2px solid #fff;
          background-color: #02c38a;
          border-radius: 20px;
          width: 30px;
          height: 30px;
          display: inline-block;
          position: absolute;
          left: 8px;
          top: 63px;
          z-index: 3;
          -webkit-box-shadow: 0px 0px 10px rgba(0, 0, 0, .8);
          -moz-box-shadow: 0px 0px 10px rgba(0, 0, 0, .8);
          box-shadow: 0px 0px 10px rgba(0, 0, 0, .8);
        }
        & > span{
          &:before {
            content: "";
            display: inline-block;
            width: 0;
            height: 0;
            border-width: 25px;
            border-style: solid;
            border-color: #333 transparent transparent;
            position: absolute;
            top: 39px;
            left: -2px;
          }
          &:after {
            content: "%";
          }
        }
      }

    }
}

</style>

</head>

<body>

<input class="slider" value="20" min="0" max="100" name="rangeslider" type="range" />


</body>
</html>