//Post area
var friendshipListTable = "<tr><th scope='row'>{{Member.memberimg}}</th>"
		+ "<td>{{Member.memberName}}</td>" 
		+ "<td>{{Member.memberBirth}}</td>"
		+ "<td>{{Member.memberEmail}}</td>"
		+ "<td><></td>"
		+ "</tr>"

var receiverTable = "<tr><th scope='row'>"
		+ "<img class='card-img-top rounded-circle' style='height: 40px; width: 40px' src='{{requestUrl}}membergetPicture/{{member.id}}'></th>"
		+ "<td>{{Member.memberName}}</td>" 
		+ "<td>{{Member.memberBirth}}</td>"
		+ "<td><button type='button' class='btn btn-info' id='confirmbtn{{Member.id}}'>Confirm</button></td>"
		+ "</tr>"
		
var requestUrl = ""
var loginMemberName = $('#loginMemberName').text();
var loginMemberid = $('#loginMemberid').text();

var mbrData = null;

function getMemberData(){
	var mdata = null;
	$.ajax({
		url : requestUrl + "getAllMemberJson",
		method : "POST",
		dataType : "JSON",
		async:false,
		success : function(memberData) {
			let friendshipListTableArea = "";
			requestUrl = $('#requestUrl').text();
			mdata = memberData.Member;
			for (let i = 0; i < mdata.length; i++) {
				let member = mdata[i];
			
				friendshipListTable_html = friendshipListTable
				.replace(/\{{Member.memberimg}}/g, member.memberimg)
				.replace(/\{{Member.memberName}}/g, member.memberName)
				.replace(/\{{Member.memberBirth}}/g, member.memberBirth)
				.replace(/\{{Member.memberEmail}}/g, member.memberEmail)
				.replace(/\{{requestUrl}}/g, requestUrl);
			
				friendshipListTableArea += friendshipListTable_html
			
			}
			$("#friendshipList").append(friendshipListTableArea);
		}
	})
	return mdata;
}


$(document).ready(
		function() {
			requestUrl = $('#requestUrl').text();
			mdata = getMemberData();
			$.ajax({
				url : requestUrl + "friendJson",
				method : "POST",
				dataType : "JSON",
				success : function(friendData) {
					var count = 0;
					let receiverTableArea = "";
					var fdata = friendData.friend
					for (let i = 0; i < fdata.length; i++) {
						let friend = fdata[i];
						if (friend.receiver_memberId == loginMemberid
								&& friend.friendStatus == 1) {
							for (let i = 0; i < mdata.length; i++) {
								let member = mdata[i];
								if (friend.sender_memberId == member.id && friend.friendStatus == 1) {
									
									receiverTable_html = receiverTable
									.replace(/\{{member.id}}/g, member.id)
									.replace(/\{{Member.memberName}}/g, member.memberName)
									.replace(/\{{Member.memberBirth}}/g, member.memberBirth)
									.replace(/\{{Member.id}}/g, member.id)
									.replace(/\{{requestUrl}}/g, requestUrl);
									

									receiverTableArea += receiverTable_html;
									count++;
								}
							}
						}

					}
					$("#friendshipTable").append(receiverTableArea);
					$("#friendRequest" + loginMemberid).text(count);
					
					for (let i = 0; i < fdata.length; i++) {
						let friend = fdata[i];
						if (friend.receiver_memberId == loginMemberid
								&& friend.friendStatus == 1) {
							for (let i = 0; i < mdata.length; i++) {
								let member = mdata[i];
								if (friend.sender_memberId == member.id) {
									confirmFriendRequest(loginMemberid, member.id)
								}
							}
						}
					}
				}
			})

		})

function confirmFriendRequest(loginMemberid, memberIdf) {
	$("#confirmbtn" + memberIdf).mousedown(function() {
		$.get("confirmFriendRequest", {
			memberId : loginMemberid,
			memberIdf : memberIdf
		}, function() {
		})
	})
	$("#confirmbtn" + memberIdf).mouseup(function() {
		
	})
}
