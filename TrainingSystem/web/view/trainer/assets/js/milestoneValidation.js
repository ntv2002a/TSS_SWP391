/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
jQuery.validator.addMethod("greaterThan", 
function(value, element, params) {

    if (!/Invalid|NaN/.test(new Date(value))) {
        return new Date(value) > new Date($(params).val());
    }

    return isNaN(value) && isNaN($(params).val()) 
        || (Number(value) > Number($(params).val())); 
},'Must be greater than {0}.');

$().ready(function () {
    $("#milestone-detail").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        rules: {
            "title": {
                required: true
            },
            "class": {
                required: true
            },
            "ass": {
                required: true
            }, "startDate": {
                required: true
            },
            "endDate": {
                required: true,
                greaterThan: "#startDate"
            }
        }
    });
});


