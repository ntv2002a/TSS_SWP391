/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$().ready(function () {
    $("#detail").validate({
        onfocusout: true,
        onkeyup: true,
        onclick: true,
        rules: {
            "title": {
                required: true
                
            },
            "value": {
                required: false

            },
            "order": {
               number: true
            }
        },
        messages: {
            "title": {
                required: "Bắt buộc nhập title"
            },
            "value": {
            },
            "order": {
                number: "Vui lòng chỉ nhập số"
            }
        }
    });
});