const moment = require("moment");

$(window).on('load', function() {
    $.each(gon.event, function(index,value) {
      var time = new Date(value.start_time)
      var nowTime = moment(time).format()
      var tooltipHtml = `
      <div>
        <div class="tooltipClose">×</div>
          <div style="margin: 10px;">
            <div>
            予定：${value.title}<br>
              ${nowTime}<br>
            </div>
          </div>
        </div>
      </div>`;

        $(".showTooltip2-" + value.id).tooltip({
            content: tooltipHtml
        }) 
    });
});