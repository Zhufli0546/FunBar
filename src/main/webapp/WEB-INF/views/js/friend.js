var friendshipListTable = "<tr><th scope='row'>"
		+ "<img class='card-img-top rounded-circle' style='height: 40px; width: 40px' src='{{requestUrl}}membergetPicture/{{member.id}}'></th>"
		+ "<td>{{member.memberName}}</td>" 
		+ "<td>{{member.memberBirth}}</td>"
		+ "<td>{{member.memberEmail}}</td></tr>"

var receiverTable = "<tr id='list{{member.id}}'><th scope='row'>"
		+ "<img class='card-img-top rounded-circle' style='height: 40px; width: 40px' src='{{requestUrl}}membergetPicture/{{member.id}}'></th>"
		+ "<td>{{member.memberName}}</td>"
		+ "<td>{{member.memberBirth}}</td>"
		+ "<td><button type='button' class='btn btn-info' id='confirmbtn{{member.id}}'>Confirm</button>"
		+ "<button type='button' class='btn btn-danger ml-2' id='cancelbtn{{member.id}}'>Cancel</button></td></tr>"

var requestUrl = ""
var loginMemberName = $('#loginMemberName').text();
var loginMemberid = $('#loginMemberid').text();

var mbrData = null;

function getMemberData() {
	var mdata = null;
	$.ajax({
		url : requestUrl + "getAllMemberJson",
		method : "POST",
		dataType : "JSON",
		async : false,
		success : function(memberData) {
			mdata = memberData.Member;

		}
	})
	return mdata;
}

$(document).ready(function() {
						requestUrl = $('#requestUrl').text();
						mdata = getMemberData();
						$.ajax({
								url : requestUrl + "friendJson",
								method : "POST",
								dataType : "JSON",
								success : function(friendData) {
									var count = 0;
									let receiverTableArea = "";
									let friendshipListTableArea = "";
									var fdata = friendData.friend;
									
									for (let j = 0; j < mdata.length; j++) {
										let member = mdata[j];
										if(member.memberName != loginMemberName){
											for(let i = 0; i < fdata.length; i++) {
													let friend = fdata[i];
													console.log(friend)
											if(loginMemberid == friend.sender_memberId && member.id == friend.receiver_memberId && friend.friendStatus == 2) {
												console.log("已是好友 = " + member.memberName)
												let temp = member.memberBirth.slice(5)
												friendshipListTable_html = friendshipListTable
																			.replace(/\{{member.memberName}}/g, member.memberName)
																			.replace(/\{{member.memberBirth}}/g, temp)
																			.replace(/\{{member.memberEmail}}/g, member.memberEmail)
																			.replace(/\{{member.id}}/g, member.id)
																			.replace(/\{{requestUrl}}/g, requestUrl);

													friendshipListTableArea += friendshipListTable_html
													console.log("執行一次又一次")
												
											} else if (loginMemberid == friend.receiver_memberId && member.id == friend.sender_memberId && friend.friendStatus == 1){
													console.log("收到好友邀請 = " + member.memberName)
													$("#friendRequest" + member.id).text("Confirm");
													let temp2 = member.memberBirth.slice(5)
													receiverTable_html = receiverTable
																		.replace(/\{{member.id}}/g, member.id)
																		.replace(/\{{member.memberName}}/g, member.memberName)	
																		.replace(/\{{member.memberBirth}}/g, temp2)
																		.replace(/\{{member.id}}/g, member.id)
																		.replace(/\{{requestUrl}}/g, requestUrl);

																receiverTableArea += receiverTable_html;
																count++;
													}
											}							
										}
									}

										$("#friendshipTable").append(receiverTableArea);
										$("#friendshipList").append(friendshipListTableArea);
										$("#friendRequest" + loginMemberid).text(count);

										for (let j = 0; j < mdata.length; j++) {
											let member = mdata[j];
											if(member.memberName != loginMemberName){
												for(let i = 0; i < fdata.length; i++) {
														let friend = fdata[i];
														console.log(friend)
												if(loginMemberid == friend.receiver_memberId && member.id == friend.sender_memberId && friend.friendStatus == 1) {
														confirmFriendRequest(loginMemberid, member.id)
														cancelFriendRequest(member.id)
													}
												}
											}
										}
								}
							})

				})

function confirmFriendRequest(loginMemberid, memberIdf) {
	$("#confirmbtn" + memberIdf).unbind().click(function() {
		$.get("confirmFriendRequest", {
			memberId : loginMemberid,
			memberIdf : memberIdf
		}, function() {
		})
		$(this).text("Friend")
		$(this).attr('disabled', true);
	})
}

function cancelFriendRequest(memberIdf){
	$("#cancelbtn" + memberIdf).unbind().click(function() {
		$.get("cancelFriendRequest", {
			sender_memberId : memberIdf,
			receiver_memberId : loginMemberid,
		}, function() {
		})
		$("#list" + memberIdf).hide();
	})
}