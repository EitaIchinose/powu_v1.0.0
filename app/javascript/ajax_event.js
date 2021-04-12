const moment = require("moment");  //時間フォーマット変換

$(function(){
	//ページを表示させる箇所の設定
	var $content = $('.event');
	//ボタンをクリックした時の処理
	$(document).on('click', '.department-name', function(event) {
		event.preventDefault();
		$(function(){
			$("#overlay").fadeIn(300);
		})

		// カレンダー削除機能
		const department_name = $(".department-name"); // department-nameのクラスを全て取得
		const index = department_name.index(this);
		$(".fa").removeClass("fa-times-circle").eq(index + 1).addClass("fa-times-circle");

		//.department-nameのhrefにあるリンク先を保存
		var link = $(this).attr("href");
		//リンク先が今と同じであれば遷移しない
		if(link == lastpage.href){
			return false;
		}else{
			$content.fadeOut(600, function() {
				getPage(link);
			});
			//今のリンク先を保存
			lastpage = link;
			history.pushState(null, null, lastpage);  // url更新

		}
		
	});
	//初期設定
	getPage(lastpage);
  var lastpage = location.href;

	//ページを取得してくる
    function getPage(elm){
    	$.ajax({
            type: 'GET',
            url: elm,
						dataType: 'html',
			}).done(function(data){      // 処理が成功した場合
				setTimeout(function(){
					$("#overlay").fadeOut(300);
				},500)
				$content.html($(data).find(".event").html()).fadeIn(600);

				// カレンダー予定の吹き出し機能
				$.each(gon.event, function(index,value) {
					var startTime = new Date(value.start_time)
					var endTime = new Date(value.end_time)
					var tooltipHtml = `
					<div>
						<div style="margin: 10px;">
							<div>
							予定者：${value.user.nickname}<br>
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

					// カレンダータブ機能
					let tabs = $(".tab");                        // tabのクラスを全て取得し、変数tabsに配列で定義
					$(".tab").on("click", function() {           // tabをクリックしたらイベント発火
						$(".in_active").removeClass("in_active");  // in_activeクラスを消す
						$(this).addClass("in_active");             // クリックした箇所にin_activeクラスを追加
						const index = tabs.index(this);            // クリックした箇所がタブの何番目か判定し、定数indexとして定義
						$(".content").removeClass("show").eq(index).addClass("show"); // showクラスを消して、contentクラスのindex番目にshowクラスを追加
					})

					// コメント自動スクロール機能
					$('#submit').on('click', () => {
						const comment = $('.event-main')[0].scrollHeight
						$('.event-main').animate({scrollTop:comment}, "slow");
						});

			}).fail(function(){          // 処理が失敗した場合
				alert('問題がありました。');
			})
		}
});