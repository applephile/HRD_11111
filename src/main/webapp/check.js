function joinCheck() {
    // document.frm.custname.value.length

    if(document.frm.custname.value.trim() == 0) {
        alert("회원성명이 입력되지 않았습니다.");
        frm.custname.focus();
        return false;
    }
    if(document.frm.phone.value.trim() == 0) {
        alert("회원전화가 입력되지 않았습니다.");
        frm.phone.focus();
        return false;
    }
    if(document.frm.address.value.trim() == 0) {
        alert("회원주소가 입력되지 않았습니다.");
        frm.address.focus();
        return false;
    }
    if(document.frm.joindate.value.trim() == 0) {
        alert("가입일자가 입력되지 않았습니다.");
        frm.joindate.focus();
        return false;
    }
    if(document.frm.grade.value.trim() == 0) {
        alert("고객등급이 입력되지 않았습니다.");
        frm.grade.focus();
        return false;
    }
    if(document.frm.city.value.trim() == 0) {
        alert("도시코드가 입력되지 않았습니다.");
        frm.city.focus();
        return false;
    }
    success();
    return true;
}
function success() {
    alert("회원 등록이 완료되었습니다.");
}

function modify() {
	alert("회원 정보 수정이 완료되었습니다.");
}

function search() {
	window.location = "list.jsp"
}



























