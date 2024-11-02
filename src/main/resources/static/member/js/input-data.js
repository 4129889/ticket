
$(function () {
	/*  ================================== member 會員中心 ================================== */
	/*  將 member 資料用陣列包裝，並使用 push 將值置入  */
	// let member_item1 = [];
	// member_item1.push({
	// 	"memberName": $("#memberName h5").text()
	// });
	// console.log(member_item1[0].memberName);

	/*  將 member 資料用物件包裝  */
	// let member_item = {
	// 	name: "假名字",
	// 	nickname: "假暱稱",
	// 	email: "test@test.com",
	// 	birthdate: "2023/09/18",
	// 	cellphone: "(886) 098 7654 321",
	// 	location: "NOT IMPORTANT",
	// 	orders:
	// 	{
	// 		publisher: "廠商",
	// 		activity: "活動名稱",
	// 		ordersPic: "./assets/img/Bob3.png"
	// 	},
	// 	favoriteAct:
	// 	{
	// 		publisher: "廠商",
	// 		activity: "活動名稱",
	// 		favPic: "./assets/img/kirby_yoyo.png"
	// 	}
	// };
	// // console.log(member_item);

	// $.ajax({
	// 	url: "MemberPage",
	// 	type: "GET",
	// 	// data: member_item,
	// 	data: { "userID": 4 },
	// 	dataType: "json",
	// 	beforeSend: function (xhr) {
	// 		console.log("beforeSend");
	// 		console.log(xhr);
	// 	},
	// 	success: function (data) {


	// 		let h5_memberName_html = "";
	// 		h5_memberName_html =
	// 			`
	// 		<h5 class="mb-1">${data.name}</h5>
	// 		`;
	// 		$("#memberName h5").html(h5_memberName_html);
	// 		h5_memberName_html = "";

	// 		let p_member_html = "";
	// 		p_member_html +=
	// 			`
	// 	<p class="mb-0 font-weight-bold text-sm">${data.nickname}</p>
	// 	`;

	// 		$("#memberName p").html(p_member_html);
	// 		p_member_html = "";
	// 	}, error: function (xhr) {
	// 		console.log("error");
	// 		console.log(xhr.responseText);
	// 	}, complete: function (xhr, data) {
	// 		console.log("complete");
	// 		console.log(data);
	// 		console.log(xhr);
	// 	}
	// });


	// /*  標題小字卡-名字  */
	// $("#memberName h5").on("click", function () {
	// 	// console.log("aaa");
	// 	let h5_memberName_html = "";

	// 	h5_memberName_html = `
	//     <h5 class="mb-1">${member_item.memberName}</h5>
	//     `;

	// 	$("#memberName h5").html(h5_memberName_html);

	// 	h5_memberName_html = "";
	// });

	// $("#memberName p").on("mousemove", function () {
	// 	// console.log("bbb");
	// 	let p_member_html = "";

	// 	p_member_html += `
	//     <p class="mb-0 font-weight-bold text-sm">${member_item.memberNickname}</p>
	//     `;
	// 	$("#memberName p").html(p_member_html);

	// 	p_member_html = "";
	// });

	// /*  會員基本資料  */
	// /*  將 memberInfo 資料用物件包裝  */
	// let memberInfo_item = {
	// 	name: "假名字",
	// 	nickname: "假暱稱",
	// 	email: "test@test.com",
	// 	birthdate: "2023/09/18",
	// 	cellphone: "(886) 098 7654 321",
	// 	location: "NOT IMPORTANT",
	// };
	// // console.log(memberInfo_item);

	// $("#memberInfo p").on("mousemove", function () {
	// 	// console.log("a");
	// 	let p_profile_html = "";

	// 	p_profile_html += `
	// 	<p class="text-sm">我是自介我是自介</p>
	// 	<p class="text-sm" style = "color : red;">我是自介我是自介</p>
	//     `;
	// 	$("#memberInfo p").html(p_profile_html);

	// 	p_profile_html = "";
	// });

	// $("#memberInfo ul").on("mousemove", function () {
	// 	let ul_profile_detail_html = "";
	// 	// console.log("a");

	// 	ul_profile_detail_html += `
	//         <li class="list-group-item border-0 ps-0 pt-0 text-sm"><strong class="text-dark">Full Name:</strong> &nbsp; ${memberInfo_item.name}</li>
	//         <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">NickName:</strong> &nbsp; ${memberInfo_item.nickname}</li>
	//         <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Email:</strong> &nbsp; ${memberInfo_item.email}</li>
	//         <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Birthdate:</strong> &nbsp; ${memberInfo_item.birthdate}</li>
	//         <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Mobile:</strong> &nbsp; ${memberInfo_item.cellphone}</li>
	//         <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Location:</strong> &nbsp; ${memberInfo_item.location}</li>
	//         `;

	// 	$("#memberInfo ul").html(ul_profile_detail_html);
	// 	ul_profile_detail_html = "";
	// });

	// /*  會員訂單  */
	// /*  將 myOrders 資料用陣列物件包裝  */
	// let myOrders_item = [];

	// /*  用 for each 抓值範例
	// let sort_item = [];

	// $("ul.task_list").children("li").each(function (i, item) {
	// 	console.log(this)
	// 	$(this).attr("data-sort", i + 1);

	// 	sort_item.push({
	// 		"item_id": $(this).attr("data-id"),
	// 		"sort": $(this).attr("data-sort")
	// 	});
	// });	
	// */

	// myOrders_item.push(
	// 	{
	// 		publisher: "廠商",
	// 		activity: "活動名稱",
	// 		ordersPic: "./assets/img/Bob3.png",
	// 	},
	// 	{
	// 		publisher: "廠商1",
	// 		activity: "活動名稱1",
	// 		ordersPic: "圖片路徑1",
	// 	}
	// );
	// // console.log(myOrders_item[0]);

	// /*  抓取訂單各物件的元素  */
	// $(myOrders_item).each(function (i, item) {
	// 	// console.log(this)
	// });

	// let ul_orders_html = "";
	// $("#myOrders ul").on("click", function () {
	// 	// console.log("a");

	// 	/*  只加單筆的情況不用 for each

	// 	ul_orders_html += `

	// 		<li class="list-group-item border-0 d-flex align-items-center px-0 mb-2">
	// 			<div class="avatar me-3">
	// 				<img src="./assets/img/Bob3.png" alt="kal" class="border-radius-lg shadow" />
	// 			</div>
	// 			<div class="d-flex align-items-start flex-column justify-content-center">
	// 				<h6 class="mb-0 text-sm">廠商</h6>
	// 				<p class="mb-0 text-xs">活動名稱</p>
	// 			</div>
	// 			<a class="btn btn-link pe-3 ps-0 mb-0 ms-auto" href="javascript:;">訂單詳情</a>
	// 		</li>

	// 	`;

	// 	$("#myOrders ul").html(ul_orders_html);

	// 	// ul_orders_html = "";
	// 	 */

	// 	/*  預防一大堆訂單
	// 		圖片 = ordersPic
	// 		廠商 = publisher
	// 		活動名稱 = actName
	// 		可能要data sort方法, ID 排序訂單順序
	// 	 */

	// 	$.each(myOrders_item, function (i, item) {
	// 		ul_orders_html += `
	// 		<ul class="list-group">
	// 			<li class="list-group-item border-0 d-flex align-items-center px-0 mb-2">
	// 				<div class="avatar me-3" id="ordersPic">
	// 					<img src="${item.ordersPic}" alt="kal" class="border-radius-lg shadow" />
	// 				</div>
	// 				<div class="d-flex align-items-start flex-column justify-content-center">
	// 					<h6 class="mb-0 text-sm" id="publisher">${item.publisher}</h6>
	// 					<p class="mb-0 text-xs" id="actName">${item.actName}</p>
	// 				</div>
	// 				<a class="btn btn-link pe-3 ps-0 mb-0 ms-auto" href="javascript:;">訂單詳情</a>
	// 			</li>
	// 		</ul>
	// 		`;
	// 	});
	// 	$("#myOrders ul").html(ul_orders_html);
	// 	ul_orders_html = "";
	// });

	// /*  我的最愛  */
	// /*  將 myFavoriteActivities 資料用陣列物件包裝  */
	// let myFavoriteActivities_item = [];

	// /*  用 for each 抓值範例
	// let sort_item = [];

	// $("ul.task_list").children("li").each(function (i, item) {
	// 	console.log(this)
	// 	$(this).attr("data-sort", i + 1);

	// 	sort_item.push({
	// 		"item_id": $(this).attr("data-id"),
	// 		"sort": $(this).attr("data-sort")
	// 	});
	// });	
	// */

	// myFavoriteActivities_item.push(
	// 	{
	// 		publisher: "廠商",
	// 		activity: "活動名稱",
	// 		favPic: "./assets/img/kirby_yoyo.png",
	// 	},
	// 	{
	// 		publisher: "廠商1",
	// 		activity: "活動名稱1",
	// 		favPic: "./assets/img/KIRBY.png",
	// 	},
	// 	{
	// 		publisher: "廠商2",
	// 		activity: "活動名稱2",
	// 		favPic: "圖片路徑2",
	// 	}
	// );
	// // console.log(myFavoriteActivities_item);

	// $("#myFavoriteActivities").on("click", function (e) {
	// 	let this_pic = $("#myFavoriteActivities:first('div'):first('div'):first('div') img");
	// 	let div_fav_act_html = "";
	// 	// console.log(this_pic)

	// 	/*  抓取我的最愛各物件的元素  */
	// 	$(myFavoriteActivities_item).each(function (i, item) {
	// 		console.log(this);

	// 		div_fav_act_html += `
	// 		<div class="col-xl-3 col-md-6 mb-xl-0 mb-4">
	//     	    <div class="card card-blog card-plain">
	//     	        <div class="position-relative">
	//     	            <a class="d-block shadow-xl border-radius-xl">
	//     	                <img src="${this.favPic}" alt="img-blur-shadow" class="img-fluid shadow border-radius-xl" />
	//     	            </a>
	//     	        </div>
	//     	        <div class="card-body px-1 pb-0">
	//     	            <p class="text-gradient text-dark mb-2 text-sm">Fav #1</p>
	//     	            <a href="javascript:;">
	//     	                <h5>${this.publisher}</h5>
	//     	            </a>
	//     	            <p class="mb-4 text-sm">${this.activity}</p>
	//     	            <div class="d-flex align-items-center justify-content-between">
	//     	                <button type="button" class="btn btn-outline-primary btn-sm mb-0">活動詳情</button>

	//     	            </div>
	//     	        </div>
	//     	    </div>
	//     	</div>		
	// 		`;
	// 	});
	// 	$("#myFavoriteActivities").html(div_fav_act_html);
	// });

	/*  ================================== sign-in 登入 ================================== */
	/*  ================================== 觸發點擊事件後打包資料，轉交資料 ================================== */
	$("#signIn #commit").on("click", function (e) {
		// 停止點擊預設事件
		e.preventDefault();
		// window.location.href = "http://localhost:8081/com.tha103.newview/member.html";
		// var host = window.location.host;
		// var path = window.location.pathname;
		// var endPointURL = host + "/member.html";
		// console.log(endPointURL);
		// location.href = "/member.html";


		/*  將 sign-in 資料用物件包裝  */
		let signIn_item = {
			account: $("#account").val(),
			password: $("#password").val()
		};
		console.log(signIn_item);

		$.ajax({
			url: "http://localhost:8081/com.tha103.newview/SignIn",
			type: "POST",
			data: signIn_item,
			dataType: "json",
			beforeSend: function () {
				console.log("success前->beforeSend");
			},
			success: function (data) {
				console.log(data);
				// login_redirect(data);
				console.log("成功接data");
				// alert("登入成功");
			}, error: function (xhr) {
				console.log("error");
				console.log(xhr);
				location.href = "http://localhost:8081/com.tha103.newview/sign-in.html";
			}, complete: function (xhr) {
				console.log("complete");
				console.log(xhr);
				// location.href = "http://localhost:8081/com.tha103.newview/member.html";
			},
		});
		function login_redirect(data) {
			if (data != null) {
				console.log(data);
				console.log(data.location);
				console.log(data.account);
				location.href = "http://localhost:8081/com.tha103.newview/member.html";
			}
		};
	});


	/*  登入區塊 div  */
	`<div class="card-body" id="signIn">
		<form role="form">
			<label>帳號</label>
			<div class="mb-3">
				<input type="text" class="form-control" id="account" placeholder="請輸入帳號" aria-label="account" aria-describedby="account-addon" />
			</div>
			<label>密碼</label>
			<div class="mb-3">
				<input type="password" class="form-control" id="password" placeholder="請輸入密碼" aria-label="password" aria-describedby="password-addon" />
			</div>
			<div class="form-check form-switch">
				<input class="form-check-input" type="checkbox" id="rememberMe" checked="" />
				<label class="form-check-label" for="rememberMe">記住帳號密碼</label>
			</div>
			<div class="text-center">
				<button type="sumbit" class="btn bg-gradient-info w-100 mt-4 mb-0" id="commit">登入</button>
			</div>
		</form>
	</div>
	`;
	//	let sign_in_account_val = "";
	//	let sign_in_password_val = "";

	/*  打完使用者密碼後觸發 change 事件，取得 account, password 的值  */
	// $("#signIn #password").on("change", function () {
	// 	sign_in_password_val = $("#password").val();
	// 	sign_in_account_val = $("#account").val();
	// 	// console.log(sign_in_account_val);
	// 	// console.log(sign_in_password_val);

	// 	/*  將 account, password 的值放入 json-sign-in 物件中  */
	// 	signIn_item.account = sign_in_account_val;
	// 	signIn_item.password = sign_in_password_val;
	// 	console.log(signIn_item.account);
	// 	console.log(signIn_item.password);
	// });

	/*  ================================== sign-up 註冊 ================================== */

	/*  ==================================  ================================== */
	//	$("#submit").on("mousemove", function() {
	//		 console.log("aaa");
	//	});


	/*  ================================== 觸發點擊事件後打包資料，轉交資料 ================================== */
	$("#submit").on("click", function (e) {
		e.preventDefault();
		/*  將 sign-up 資料用物件包裝  */
		let signUp_item = {
			name: $("#name").val(),
			account: $("#account").val(),
			password: $("#password").val(),
			birthdate: $("#birthdate").val(),
			cellphone: $("#cellphone").val(),
			email: $("#email").val(),
			nickname: $("#nickname").val(),
		};
		console.log(signUp_item);

		//				let register_name_val = $("#name").val();
		//				let register_account_val = $("#account").val();
		//				let register_password_val = $("#password").val();
		//				let register_birthdate_val = $("#birthdate").val();
		//				let register_cellphone_val = $("#cellphone").val();
		//				let register_email_val = $("#email").val();
		//				let register_nickname_val = $("#nickname").val();
		//				// console.log(register_name_val);
		//				// console.log(register_account_val);
		//				// console.log(register_password_val);
		//				// console.log(register_birthdate_val);
		//				// console.log(register_cellphone_val);
		//				// console.log(register_email_val);
		//				// console.log(register_nickname_val);
		//
		//				signUp_item.name = register_name_val;
		//				signUp_item.account = register_account_val;
		//				signUp_item.password = register_password_val;
		//				signUp_item.birthdate = register_birthdate_val;
		//				signUp_item.cellphone = register_cellphone_val;
		//				signUp_item.email = register_email_val;
		//				signUp_item.nickname = register_nickname_val;
		//				console.log(signUp_item);


		// console.log(signUp_item);

		/*  註冊區塊 div  */
		`
	<div class="card-body" id="register">
		<form role="form text-left">
			<div class="mb-3">
				<input type="text" class="form-control" id="name" placeholder="請輸入名字" aria-label="Name" aria-describedby="name-addon" />
			</div>
			<div class="mb-3">
				<input type="text" class="form-control" id="account" placeholder="請輸入帳號" aria-label="Account" aria-describedby="account-addon" />
			</div>
			<div class="mb-3">
				<input type="password" class="form-control" id="password" placeholder="請輸入密碼" aria-label="Password" aria-describedby="password-addon" />
			</div>
			<div class="mb-3">
				<input type="date" class="form-control" id="birthdate" placeholder="請輸入生日" aria-label="Birthdate" aria-describedby="birthdate-addon" />
			</div>
			<div class="mb-3">
				<input type="text" class="form-control" id="Cellphone" placeholder="請輸入電話" aria-label="Cellphone" aria-describedby="cellphone-addon" />
			</div>
			<div class="mb-3">
				<input type="email" class="form-control" id="email" placeholder="請輸入Email" aria-label="Email" aria-describedby="email-addon" />
			</div>
			<div class="mb-3">
				<input type="text" class="form-control" id="nickname" placeholder="請輸入暱稱" aria-label="Nickname" aria-describedby="nickname-addon" />
			</div>
			<div class="text-center">
				<button type="sumbit" class="btn bg-gradient-dark w-100 my-4 mb-2" id="sumbit">送出</button>
			</div>
			<p class="text-sm mt-3 mb-0">已經有帳號了? <a href="./sign-in.html" class="text-dark font-weight-bolder">點我登入</a></p>
		</form>
	</div>
	`;
		$.ajax({
			url: "http://localhost:8081/com.tha103.newview/SignUp",
			type: "POST",
			data: signUp_item,
			dataType: "json",
			success: function (data) {
				console.log("aaa");
			},
		});
	})




	/*  ==================================  ================================== */



	/*  ================================== retrieve-password 忘記密碼 ================================== */
	/*  將 sign-in 資料用物件包裝  */
	let retrievePassword_item = {
		email: "",
		verify_code: "",
	};
	// console.log(retrievePassword_item);

	/*  忘記密碼區塊 div  */
	`
	<form role="form">
		<label>Email</label>
		<div class="mb-3">
			<input type="email" class="form-control" id="email" placeholder="請輸入Email" aria-label="email" aria-describedby="email-addon" />
		</div>
		<label>Verification-code</label>
		<a href="#" class="btn bg-gradient-danger btn-sm pull-right" tabindex="-1" role="button" aria-disabled="true" style="padding: 8px">點擊領取驗證碼</a>
		<div class="mb-3">
			<input type="text" class="form-control" id="verificationCode" placeholder="請輸入驗證碼" aria-label="verification-code" aria-describedby="verification-code-addon" />
		</div>
		<div class="text-center">
			<button type="button" class="btn btn-outline-danger w-100 mt-4 mb-0">送出</button>
		</div>
	</form>
	`;
	/*  輸入完驗證碼後觸發 change 事件後抓值  */
	$("#verificationCode").on("change", function () {
		// console.log("a");
		let verify_email_val = $("#email").val();
		let verify_code_val = $("#verificationCode").val();
		// console.log(verify_email_val);
		// console.log(verify_code_val);
		retrievePassword_item.email = verify_code_val;
		retrievePassword_item.verify_code = verify_code_val;
		// console.log(retrievePassword_item)
	});

	/*  ================================== my-profile 會員基本資料 ================================== */
	/*  將 my-profile 資料用物件包裝  */
	let myProfile_item = {
		account: "假帳號",
		name: "假名",
		nickname: "假暱稱",
		email: "假email@test.com",
		birthdate: "假生日2023/09/16",
		cellphone: "(886) 0987-654-321",
		password: "fakePassword ***",
		authority: "假權限1",
	};
	// console.log(myProfile_item);

	/*  抓取 #profile 標籤後，對裡面的 div 進行值的修改  */
	$("#profile").on("mousemove", function () {
		// console.log("a");
		let div_profile_html = "";

		div_profile_html += `
		<div class="d-flex align-items-center mb-3 text-center mr-5">
			<label for="account" class="form-label me-3">帳號</label>
			<span id="account" style="flex: 1; margin: 0 10px 10px 10px">${myProfile_item.account}</span>
		</div>

		<div class="d-flex align-items-center mb-3 text-center mr-5">
			<label for="name" class="form-label me-3">姓名</label>
			<span id="name" style="flex: 1; margin: 0 10px 10px 10px">${myProfile_item.name}</span>
		</div>
		
		<div class="d-flex align-items-center mb-3 text-center mr-5">
			<label for="nickname" class="form-label me-3">暱稱</label>
			<span id="nickname" style="flex: 1; margin: 0 10px 10px 10px">${myProfile_item.nickname}</span>
		</div>
		
		<div class="d-flex align-items-center mb-3 text-center mr-5">
			<label for="email" class="form-label me-3">信箱</label>
			<span id="email" style="flex: 1; margin: 0 10px 10px 10px">${myProfile_item.email}</span>
		</div>
		
		<div class="d-flex align-items-center mb-3 text-center mr-5">
			<label for="birthdate" class="form-label me-3">生日</label>
			<span id="birthdate" style="flex: 1; margin: 0 10px 10px 10px">${myProfile_item.birthdate}</span>
		</div>
		
		<div class="d-flex align-items-center mb-3 text-center mr-5">
			<label for="cellphone" class="form-label me-3">電話</label>
			<span id="cellphone" style="flex: 1; margin: 0 10px 10px 10px">${myProfile_item.cellphone}</span>
		</div>

		<div class="d-flex align-items-center mb-3 text-center mr-5">
			<label for="password" class="form-label me-3">密碼</label>
			<span id="password" style="flex: 1; margin: 0 10px 10px 10px">${myProfile_item.password}</span>
		</div>

		<div class="d-flex align-items-center mb-3 text-center mr-5">
			<label for="authority" class="form-label me-3">權限</label>
			<span id="authority" style="flex: 1; margin: 0 10px 10px 10px">${myProfile_item.authority}</span>
		</div>
		`;

		$("#profile").html(div_profile_html);
		div_profile_html = "";
	});

	/*  ================================== change-personal-info 修改會員基本資料 ================================== */
	/*  將 change-personal-info 資料用物件包裝  */
	let changInfoItem = {
		name: "",
		nickname: "",
		email: "",
		birthdate: "",
		cellphone: "",
	};
	// console.log(changInfo_item);

	/*  輸入完電話後觸發 change 事件，針對 #memberInfo 標籤裡面的各項 input 標籤取值  */
	/*  會員基本資料修改區塊 div  */
	`
	<div class="d-flex align-items-center mb-3 text-center">
		<label for="name" class="form-label me-3 p-t-7">姓名</label>
		<input type="text" class="form-control me-3" id="name" placeholder="name" aria-label="name" aria-describedby="name-addon" />
	</div>

	<div class="d-flex align-items-center mb-3 text-center">
		<label for="nickname" class="form-label me-3 p-t-7">暱稱</label>
		<input type="text" class="form-control me-3" id="nickname" placeholder="nickname" aria-label="nickname" aria-describedby="nickname-addon" />
	</div>

	<div class="d-flex align-items-center mb-3 text-center">
		<label for="email" class="form-label me-3 p-t-7">信箱</label>
		<input type="email" class="form-control me-3" id="email" placeholder="email" aria-label="email" aria-describedby="email-addon" />
	</div>

	<div class="d-flex align-items-center mb-3 text-center">
		<label for="birthdate" class="form-label me-3 p-t-7">生日</label>
		<input type="date" class="form-control me-3" id="birthdate" placeholder="birthdate" aria-label="birthdate" aria-describedby="birthdate-addon" />
	</div>

	<div class="d-flex align-items-center mb-3 text-center">
		<label for="cellphone" class="form-label me-3 p-t-7">電話</label>
		<input type="text" class="form-control me-3" id="cellphone" placeholder="cellphone" aria-label="cellphone" aria-describedby="cellphone-addon" />
	</div>	
	`;

	$("#memberInfo #cellphone").on("change", function () {
		// console.log("a");
		let memberInfo_name_html = $("#name").val();
		let memberInfo_nickname_html = $("#nickname").val();
		let memberInfo_email_html = $("#email").val();
		let memberInfo_birthdate_html = $("#birthdate").val();
		let memberInfo_cellphone_html = $("#cellphone").val();
		// console.log(memberInfo_name_html);
		// console.log(memberInfo_nickname_html);
		// console.log(memberInfo_email_html);
		// console.log(memberInfo_birthdate_html);
		// console.log(memberInfo_cellphone_html);

		changInfoItem.name = memberInfo_name_html;
		changInfoItem.nickname = memberInfo_nickname_html;
		changInfoItem.email = memberInfo_email_html;
		changInfoItem.birthdate = memberInfo_birthdate_html;
		changInfoItem.cellphone = memberInfo_cellphone_html;
		// console.log(changInfo_item)
	});
	/*  ================================== change-password 修改密碼 ================================== */
	/*  將 change-password-info 資料用物件包裝  */
	let changPassword_item = {
		oldPassword: "",
		newPassword: "",
		confirmNewPassword: "",
	};
	// console.log(changPassword_item);

	/*  輸入完確認新密碼後觸發 change 事件，針對 #changePassword div 標籤裡面的各項 input 標籤取值  */
	/*  修改密碼區塊 div  */
	`
	<div class="mb-3">
		<div class="d-flex align-items-center mb-3 text-center">
			<label for="oldPassword" class="form-label me-3 p-t-7">輸入舊密碼</label>
			<input type="password" class="form-control me-3" id="oldPassword" placeholder="輸入舊密碼" aria-label="oldPassword" aria-describedby="oldPassword-addon" />
		</div>

		<div class="d-flex align-items-center mb-3 text-center">
			<label for="newPassword" class="form-label me-3 p-t-7">輸入新密碼</label>
			<input type="password" class="form-control me-3" id="newPassword" placeholder="輸入新密碼" aria-label="newPassword" aria-describedby="newPassword-addon" />
		</div>

		<div class="d-flex align-items-center mb-3 text-center">
			<label for="confirmNewPassword" class="form-label me-3 p-t-7">確認新密碼</label>
			<input type="password" class="form-control me-3" id="confirmNewPassword" placeholder="確認新密碼" aria-label="confirmNewPassword" aria-describedby="confirmNewPassword-addon" />
		</div>
	</div>
	`;

	/*  確認完新密碼後觸發 change 事件後抓值  */
	$("#changePassword #confirmNewPassword").on("change", function () {
		// console.log("a");
		let changePassword_oldPassword_val = $("#oldPassword").val();
		let changePassword_newPassword_val = $("#newPassword").val();
		let changePassword_confirmNewPassword_val = $("#confirmNewPassword").val();
		// console.log(changePassword_oldPassword_val);
		// console.log(changePassword_newPassword_val);
		// console.log(changePassword_confirmNewPassword_val);

		changPassword_item.oldPassword = changePassword_oldPassword_val;
		changPassword_item.newPassword = changePassword_newPassword_val;
		changPassword_item.confirmNewPassword = changePassword_confirmNewPassword_val;
		console.log(changPassword_item);
	});
});
