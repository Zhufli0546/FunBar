var stompClient = null;
var friendList = "<li class='contact'><div class='wrap'><span class='contact-status online'></span>"
		+ "<img src='{{requestUrl}}/membergetPicture/{{receiverMemberId}}'/><div class='meta'>"
		+ "<p class='name' id='Name{{receiverMemberId}}'>{{receiverMemberName}}</p>"
		+ "<button class='badge badge-primary badge-pill btn btn-primary btn-sm' id='receiver{{receiverMemberId}}'"
		+ "onclick='sendto({{receiverMemberId}})'>CHAT</button>"
		+ "</div></div></li>";

var requestUrl = ""
var loginMemberName = $('#loginMemberName_chatbox').text();
var loginMemberid = $('#loginMemberid_chatbox').text();
var friendList_html = null;

function getMemberData() {
	var mdata = null;
	$.ajax({
		url : requestUrl + "getAllMemberJson",
		method : "POST",
		dataType : "JSON",
		async : false,
		success : function(memberData) {
			let friendshipListTableArea = "";
			requestUrl = $('#requestUrl_chatbox').text();
			mdata = memberData.Member;
			for (let i = 0; i < mdata.length; i++) {
				let member = mdata[i];
			}
		}
	})
	return mdata;
}

function friendlist() {
	$.ajax({
		url : requestUrl + "friendJson",
		method : "POST",
		dataType : "JSON",
		success : function(friendData) {
			let receiverTableArea = "";
			var fdata = friendData.friend
			for (let i = 0; i < fdata.length; i++) {
				let friend = fdata[i];
				if (friend.sender_memberId == loginMemberid
						&& friend.friendStatus == 2) {
					for (let i = 0; i < mdata.length; i++) {
						let member = mdata[i];
						if (friend.receiver_memberId == member.id) {

							friendList_html = friendList
											.replace(/\{{receiverMemberName}}/g, member.memberName)
											.replace(/\{{receiverMemberId}}/g, member.id)
											.replace(/\{{requestUrl}}/g, requestUrl);

							receiverArea += friendList_html;
							
						}
					}
				}

			}
			var temp = receiverArea.toString()
			var newtemp = temp.slice(25)
			$("#receiverArea").append(newtemp);
		}
	})

}

function friends(){
	$.ajax({
		url : requestUrl + "friendJson",
		method : "POST",
		dataType : "JSON",
		success : function(friendData) {
			var fdata = friendData.friend
			for (let i = 0; i < fdata.length; i++) {
				let friend = fdata[i];
				if(friend.sender_memberId == loginMemberid && friend.friendStatus == 2){

					let conn = [ loginMemberid, friend.receiver_memberId ];
					if(conn[0] > conn[1]){
						let temp = conn[0];
						conn[0] = conn[1];
						conn[1] = temp;
					}
					stompClient.subscribe('/member/message/' + conn[0] + "/" + conn[1], function(message) {
						var json = JSON.parse(message.body);
						var senderMemberId = json.senderMemberId;
						var receiverMemberId = json.receiverMemberId;
						var messageType = json.messageType;
						var user = json.userName;
						var date = json.sendDate;
						var msg = json.messageContent;
						if (messageType == "text") {
							showNewMessage(user, date, msg, senderMemberId, receiverMemberId);
						} else if (messageType == "image") {
							showNewImage(user, date, msg, senderMemberId, receiverMemberId);
						}
					})
				}
			}
		}
	})
}


$(document).ready(function() {
	requestUrl = $('#requestUrl_chatbox').text();
	mdata = getMemberData();
	friendlist();

})

$(function() {
	connect();

	/**
	 * 清除聊天窗口的所有内容
	 */
	$("#clearBtn").click(function() {
		$("#historyMsg").empty();
		$("#messageInput").focus();
	});

	/**
	 * 上传图片发送
	 */
	$("#sendImage").bind("change", function() {
		if (this.files.length != 0) {
			$.ajax({
				url : $("#uploadUrl").val(),
				type : 'POST',
				cache : false,
				data : new FormData($('#sendImageForm')[0]),
				processData : false,
				contentType : false
			}).done(function(res) {
				console.log(res);
			}).fail(function(res) {
				console.log(res);
			});
		}
	});
	initEmoji();
	$("#sendImageBtn").click(function() {
		$("#sendImage").trigger("click");
	})

});
/**
 * 预加载emoji图片
 */
function initEmoji() {
	var emojiContainer = $("#emojiWrapper");
	var documentFragment = document.createDocumentFragment();
	for (var i = 69; i > 0; i--) {
		var emojiItem = document.createElement("img");
		emojiItem.src = $("#emojiBaseUri").val().trim() + i + ".gif";
		emojiItem.title = i;
		documentFragment.appendChild(emojiItem);
	}
	emojiContainer.append(documentFragment);

	$("#emoji").click(function(event) {
		emojiContainer.css("display", "block");
		event.stopPropagation(); // 阻止事件的传递，防止body监听到
	});

	$("body").click(function(event) {
		if (event.target != emojiContainer) {
			emojiContainer.css("display", "none");
		}
	});

	$("#emojiWrapper").click(
			function(event) {
				var target = event.target;
				if (target.nodeName.toLowerCase() == "img") {
					var messageInput = $("#messageInput");
					messageInput.val(messageInput.val() + "[EMOJI:"
							+ target.title + "]");
					messageInput.focus();
				}
			})

}
/**
 * 客户端连接服务端websocket 并且订阅一系列频道，用来接收不同种类的消息 /app/chat/participants
 * ：当前在线人数的消息，只会接收一次 /topic/login ： 新登录用户的消息 /topic/chat/message ： 聊天内容消息
 * /topic/logout : 用户离线的消息
 * 服务器发回json实例{"userName":"chris","sendDate":1494664021793,"content":"hello","messageType":"text"}
 * messageType分为：text与image
 */
function connect() {
	var receiverMemberId = 12;

	var socket = new SockJS($("#websocketUrl").val().trim());
	stompClient = Stomp.over(socket);
	var sessionId = "";
	stompClient.connect({}, function(frame) {

		var url = stompClient.ws._transport.url;
		url = url.replace("ws://localhost:8080/FunBar/websocket/", "");
		url = url.replace("/websocket", "");
		url = url.replace(/^[0-9]+\//, "");
		console.log("Your current session is: " + url);
		sessionId = url;

		stompClient.subscribe("/chat/participants", function(message) {
			showActiveUserNumber(message.body);
			var user = "系统消息";
			var date = null;
			var msg = loginMemberName + "加入聊天！";
			showNewMessage(user, date, msg);
		});
		stompClient.subscribe("/topic/login", function(message) {
			showNewUser(message.body);
		});

		friends();
		// stompClient.subscribe('/member/message/'+ loginMemberid, function
		// (message) {
		// var json = JSON.parse(message.body);
		// var senderMemberId = json.senderMemberId;
		// var receiverMemberId = json.receiverMemberId;
		// var messageType = json.messageType;
		// var user = json.userName;
		// var date = json.sendDate;
		// var msg = json.content;
		// if (messageType == "text"){
		// showNewMessage(user, date, msg, senderMemberId, receiverMemberId);
		// }else if (messageType == "image"){
		// showNewImage(user, date, msg, senderMemberId, receiverMemberId);
		// }
		// })

		stompClient.subscribe("/topic/logout", function(message) {
			showUserLogout(message.body);
		})

	});
}
/**
 * 显示用户离线消息
 * 
 * @param message
 */
function showUserLogout(message) {
	var json = JSON.parse(message);
	var logoutUser = json.name;
	var date = json.logoutDate;
	var user = "系统消息";
	var msg = logoutUser + "离开了聊天室~";
	showNewMessage(user, date, msg);
	showSubActiveUserNumber();
}
/**
 * 显示新用户登录的消息
 * 
 * @param message
 */
function showNewUser(message) {
	var json = JSON.parse(message);
	var newUser = json.name;
	var date = json.loginDate;
	var user = '系统消息';
	var msg = newUser + "加入聊天！";
	showNewMessage(user, date, msg);
	showAddActiveUserNumber();

}
/**
 * 显示当前在线人数
 * 
 * @param number
 */
function showActiveUserNumber(number) {
	$("#status").text(number);
}
/**
 * 在线人数加1
 */
function showAddActiveUserNumber() {
	var number = parseInt($("#status").text());
	number = number + 1;
	$("#status").text(number);
}
/**
 * 在线人数减1
 */
function showSubActiveUserNumber() {
	var number = parseInt($("#status").text());
	number = number - 1;
	$("#status").text(number);
}
/**
 * 格式化时间，参数为null显示当前客户端时间
 * 
 * @param dateTime
 * @returns {string}
 */
function formatDate(dateTime) {
	var date = dateTime == null ? new Date() : new Date(dateTime);
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	var hour = date.getHours();
	hour = hour < 10 ? '0' + "" + hour : hour;
	var minute = date.getMinutes();
	minute = minute < 10 ? '0' + "" + minute : minute;
	var second = date.getSeconds();
	second = second < 10 ? '0' + "" + second : second;
	return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":"
			+ second;
}

/**
 * 显示新消息
 * 
 * @param user
 *            发消息的用户或者‘系统消息’
 * @param date
 *            发消息的时间（未格式化）
 * @param msg
 *            消息内容
 */
function showNewMessage(user, date, msg, senderMemberId, receiverMemberId) {
	var container = document.getElementById("conversation");
	var messages = document.getElementById("messages");
	var msgToDisplay = document.createElement('li');

	if (user == "系统消息") {
		msgToDisplay.style.color = 'red';
	}
	var dateTime = formatDate(date);
	msg = showEmoji(msg);
	console.log(msgToDisplay)

	if (senderMemberId == loginMemberid) {
		msgToDisplay.setAttribute("class", "replies");
		msgToDisplay.innerHTML = "<img src='http://emilcarlsson.se/assets/harveyspecter.png' alt='' />"
				+ "<p>" + msg + "</p>"
		container.append(msgToDisplay);
		
	} else {
		msgToDisplay.setAttribute("class", "sent");
		msgToDisplay.innerHTML = "<img src='http://emilcarlsson.se/assets/harveyspecter.png' alt='' />"
				+ "<p>" + msg + "</p>"
		container.append(msgToDisplay);
		
	}

	($('#conversation').children("li:last-child")[0]).scrollIntoView();
}
/**
 * 正则表达式显示消息中的emoji图片
 * 
 * @param message
 * @returns {*} 返回添加emoji图片标签后的消息
 */
function showEmoji(message) {
	var result = message, regrex = /\[EMOJI:\d+\]/g, match;
	while (match = regrex.exec(message)) {
		var emojiIndex = match[0].slice(7, -1);
		var emojiUrl = $("#emojiBaseUri").val().trim() + emojiIndex + ".gif";
		result = result.replace(match[0], '<img src="' + emojiUrl + '"/>');
	}
	return result;
}

/**
 * 显示用户发送的图片
 * 
 * @param user
 *            用户名称
 * @param date
 *            用户发送的时间（未格式化）
 * @param url
 *            图片url
 */
function showNewImage(user, date, url) {
	var container = document.getElementById("historyMsg");
	var msgToDisplay = document.createElement('p');
	var dateTime = formatDate(date);
	msgToDisplay.innerHTML = '<span class="timespan">' + dateTime
			+ '</span><br/>[' + user + '] : <br/>'
			+ '<img class="img-thumbnail" src="' + url + '"/>';
	container.append(msgToDisplay);
//	container.scrollTop = container.scrollHeight;
}
/**
 * 发送输入框中的信息
 */
function sendMessage(loginMemberid, receiverMemberId) {
	var content = $("#messageInput").val();
	let conn = [ loginMemberid, receiverMemberId];
	if(conn[0] > conn[1]){
		let temp = conn[0];
		conn[0] = conn[1];
		conn[1] = temp;
	}
	let subscribe = conn[0] + "/" + conn[1];
	if (content.trim().length != 0) {
		$("#messageInput").val('');
		stompClient.send("/message", {}, JSON.stringify({
			'senderMemberId' : loginMemberid,
			'receiverMemberId' : receiverMemberId,
			'subscribe' : subscribe,
			'userName' : loginMemberName,
			'messageContent' : content,
		}));
	}
}

 function sendto(receiverMemberId){
	 $("#messageInput").unbind("keyup").bind("keyup", function(event) {
		if (event.keyCode == 13) {
			sendMessage(loginMemberid, receiverMemberId);
			}
	   });
	let receiverMemberName = $("#Name" + receiverMemberId).text();
 	let conn = [ loginMemberid, receiverMemberId];
	if(conn[0] > conn[1]){
		let temp = conn[0];
		conn[0] = conn[1];
		conn[1] = temp;
	}
	let subscribe = conn[0] + "/" + conn[1];
	$("#receiverMemberName").text(receiverMemberName);
 	getHistoryMessage(subscribe)
 }

 function getHistoryMessage(subscribe){
	 $("#conversation").html("");
 $.ajax({
		url : requestUrl + "getHistoryMessageJson",
		method : "POST",
		dataType : "JSON",
		async : false,
		data : {subscribe : subscribe},
		success : function(messageHistoryData) {
			let messageArea = "";
			let messageData = messageHistoryData.message
			for(let i = 0; i < messageData.length; i++){
				let message = messageData[i];
				showNewMessage(message.userName, message.sendDate, message.messageContent
						, message.senderMemberId, message.receiverMemberId);
				
			}
		}
 	})
 }
