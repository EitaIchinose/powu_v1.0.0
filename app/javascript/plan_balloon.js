const moment = require("moment");

$(window).on('load', function() {
  $.each(gon.event, function(index,value) {
    var startTime = new Date(value.start_time)
    var endTime = new Date(value.end_time)
    var tooltipHtml = `
    <div>
      <div style="margin: 10px;">
        <div>
          予定：${value.title}<br>
          開始：${moment(startTime).format('YYYY-MM-DD HH:mm')}<br>
          終了：${moment(endTime).format('YYYY-MM-DD HH:mm')}<br>
        </div>
      </div>
    </div>`; 

    // 吹き出し出力
      $(".showTooltip2-" + value.id).tooltip({
          content: tooltipHtml,
          position:{
            my:"left+30 top",
            at:"right top",
          }
      }) 
  });
});