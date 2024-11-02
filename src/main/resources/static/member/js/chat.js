(() => {
	const url = `${location.pathname.substring(0, location.pathname.indexOf('/', 1) + 1)}websocket-endpoint`;
	const btnConnect = document.querySelector('#btnConnect');
	const messages = document.querySelector('#messages');
	const text = document.querySelector('#text');
	const btnSubmit = document.querySelector('#btnSubmit');
	let stompClient;


	btnConnect.addEventListener('click', () => {
		const socket = new SockJS(url);
		stompClient = Stomp.over(socket);
		stompClient.connect({}, () => {
			btnConnect.disabled = true;
			text.disabled = false;
			btnSubmit.disabled = false;
			stompClient.subscribe('/member/chat', resp => {
				const { nickname, content } = JSON.parse(resp.body);
				messages.value += `${nickname}: ${content}\n`;
			});
		}, () => {
			alert('Error!');
			btnConnect.disabled = false;
			text.disabled = true;
			btnSubmit.disabled = true;
		});

	});

	btnSubmit.addEventListener('click', () => {
		if (stompClient) {
			stompClient.send('/msg/talk', {}, JSON.stringify({ content: text.value }));
            text.value = '';
        }

	});
})();
