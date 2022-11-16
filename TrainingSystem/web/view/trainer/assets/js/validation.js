/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$().ready(function () {
    $("#user-detail").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        rules: {
            "fullname": {
                required: true
            },
            "email": {
                required: true,
                email: true
            },
            "phone": {
                required: true,
                minlength: 8,
                maxlength: 11,
                number: true
            }
        }
    });
});

