jQuery(document).ready(function() {
  addDatepicker("sta_dat");//初始化日期控件
  var nextDay = getNextDay();
  $("#sta_dat").val(nextDay);
});
/*获取下一天日期*/
function getNextDay(){
  // var date = new Date();
  // var nextDate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDate()+1);
  // alert(dayChanged(-1,'-'));
  return dayChanged(1,'-');
}

function dayChanged(n,f) {
  var date = new Date();          
  var year = date.getFullYear();
  var month = date.getMonth()+1;
  var day = date.getDate();
  var nextDay = day+n;
  var oneMonth_days=getDaysInMonth(year,month);
  if(nextDay>oneMonth_days){
  if(month>=12){
    month=month-12;
    year=year+1;
  }
    month=month+1;
    nextDay=nextDay-oneMonth_days;  
  }
  return year+f+formMonth(month)+f+formDay(nextDay);
}
//当日、月为一位数是补零
function formMonth(month){
  if(month>0&month<10){month="0"+month;}
  return month;
}
function formDay(day){
  if(day>0&day<10){day="0"+day;}
  return day;
}
/*得到任意月的天数*/
function getDaysInMonth(year,month){
  return new Date(year,month,0).getDate();
}

//添加日期控件
function addDatepicker(id){
  var dateOne = $("#"+id).datepicker({
  defaultDate: "+1w",
  changeMonth: true,
  numberOfMonths: 1,
  dateFormat:"yy-mm-dd",
  onSelect: function(selectedDate) {
    var option = this.id == "id" ? "minDate" : "maxDate";
    var instance = $(this).data("datepicker");
    var date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
    dateOne.not(this).datepicker("option", option,date);
    }       
  });
}




/*获取当前月第一天的日期后最后一天的日期*/

/*当日、月为一位数时补零*/
function formMonth(month){
     if(month>0&month<10){month="0"+month;}
     return month;
}
function formDay(day){
     if(day>0&day<10){day="0"+day;}
     return day;
}
/*幻灯片js*/
$(function(){
     var len  = $(".flashSlider .num > li").length;
   var index = 0;
   var adTimer;
   $(".flashSlider .num li").mouseover(function(){
    index  =   $(".flashSlider .num li").index(this);
    showImg(index);
   }).eq(0).mouseover();  
  
   $('.flashSlider').hover(function(){
       clearInterval(adTimer);
     },function(){
       adTimer = setInterval(function(){
          index++;
        if(index==len){index=0;}
        showImg(index); 
        } , 5000);
   }).trigger("mouseleave");
})
      
function showImg(index){
  var adHeight = $(".flashSlider").height();
  $(".flashSlider .slider").stop(true,false).animate({top : -adHeight*index},"normal");
  $(".flashSlider .num li").removeClass("on")
    .eq(index).addClass("on");
}
