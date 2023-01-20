document.getElementById('updateButton').onclick = function () {
    alert('수정이 완료되었습니다.');
}

document.getElementById('dropButton').onclick = function () {
    if(confirm("정말 탈퇴하시겠습니까?")) {
        document.getElementById('dropForm').submit();
        alert('탈퇴가 완료되었습니다.');
    } else {

    }
}

document.getElementById('insertButton').onclick = function () {
    alert('가입이 완료되었습니다.');
}