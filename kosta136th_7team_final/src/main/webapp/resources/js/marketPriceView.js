$(document).ready(function() {
	
	$('#write_btn').click(function() {

        var title = $('#title').val();
        var content = $('#content').val();
        var writer = $('#writer').val();
        var board = new Board(title, content, writer);

        //이제 서버에 저장을 해야하니 일단 클라이언트의 controller로 보낸다
        Controllers.getBoardController().requestWrite(board);
	
	
	});
}