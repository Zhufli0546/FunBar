//Post area
var table = "<tr><th scope='row'>{{Member.memberimg}}</th>"
			+ "<td>{{Member.memberName}}</td>" 
			+ "<td>{{Member.memberBirth}}</td>" 
			+ "</tr>"

var requestUrl = ""
var loginMemberName = $('#loginMemberName').text();
var loginMemberid = $('#loginMemberid').text();

var mdata = null;

$.ajax({
	url : requestUrl + "getAllMemberJson",
	method : "POST",
	dataType : "JSON",
	success : function(memberData) {
		requestUrl = $('#requestUrl').text();
		mdata = memberData.Member;
	}
})

$(document).ready(function(){
	
	$.ajax({
	url : requestUrl + "friendJson",
	method : "POST",
	dataType : "JSON",
	success : function(friendData) {
		let tableArea = "";
		fdata = friendData.friend
		for (let i = 0; i < fdata.length; i++) {
			let friend = fdata[i];
			if (friend.receiver_memberId == loginMemberid && friend.friendStatus == 1) {
				for(let i = 0; i < mdata.length; i++) {
					let member = mdata[i];
					if(friend.sender_memberId == member.id){
						
						table_html = table.replace(/\{{Member.memberimg}}/g, member.memberimg)
						  				  .replace(/\{{Member.memberName}}/g, member.memberName)
						  				  .replace(/\{{Member.memberBirth}}/g, member.memberBirth)

						 tableArea += table_html;
					}
				}
			}
			
		}
	$("#friendshipTable").append(tableArea);
	}
})
})



function sendFriendRequest(memberId, memberIdf) {
	$("#friendRequest" + memberIdf).click(function() {
		$.get("sendFriendRequest", {
			memberId : memberId,
			memberIdf : memberIdf
		}, function() {
		})
		$(this).text("unFriend")
	})
}

function confirmFriendRequest() {
	$("#friendRequest" + memberIdf).text("Confirm")
	$("#friendRequest" + memberIdf).click(function() {
		$.get("confirmFriendRequest", {
			memberId : memberId,
			memberIdf : memberIdf
		}, function() {
		})
		$(this).text("Friend")
	})
}






//Open the web socket connection to the server
var socketConn = new WebSocket(requestUrl+'socketHandler');

//Send Message
function send() {
	var clientMsg = document.getElementById('clientMsg');
	if (clientMsg.value) {
		socketConn.send(clientMsg.value);
		clientMsg.value = '';
	}
}

// Recive Message
socketConn.onmessage = function(event) {
	var serverMsg = document.getElementById('serverMsg');
	serverMsg.value = event.data;
}