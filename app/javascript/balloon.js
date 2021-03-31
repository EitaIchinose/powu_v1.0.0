// 吹き出し機能
$(window).on('load',function() {
  var tooltipHtml = `
  <div>
    <div style="margin: 10px;">
      <div>
      <div class="rotate-anime rotate-anime1"><i class="fa fa-cog"></i></div><br>
        <span class="margin_left">ボタンをクリックしたら</span><br>
        <span class="margin_left">新規予定を作成できるよ！</span><br>
        <div class="rotate-anime rotate-anime1" style="margin-left: 235px;"><i class="fa fa-cog"></i></div>
      </div>
      </div>
  </div>`;

    $(".showTooltip").tooltip({
        content: tooltipHtml
    });
});