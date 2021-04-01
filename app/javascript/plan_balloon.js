const moment = require("moment");

$(window).on('load', function() {
    $.each(gon.event, function(index,value) {
      var time = new Date(value.start_time)
      var nowTime = moment(time).format()
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

        $(".showTooltip2-" + value.id).tooltip({
            content: tooltipHtml
        }) 
    });
});