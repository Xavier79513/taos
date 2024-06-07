"use strict";
!function () {
    var f = document.querySelector("#shake-animation"), b = document.querySelectorAll(".btn-popup");

    f && (f.onclick = function () {
        Swal.fire({
            title: "Shake Animation",
            showClass: {popup: "animate__animated animate__shakeX"},
            customClass: {confirmButton: "btn btn-primary"},
            buttonsStyling: !1
        })
    }), b && b.forEach(b.onclick = function (button) {
        button.onclick = function () {
            Swal.fire({
                title: "Correo enviado!",
                icon: "success",
                customClass: {confirmButton: "btn btn-primary"},
                buttonsStyling: !1
            })
            button.disabled = true;
        }
    })
}();