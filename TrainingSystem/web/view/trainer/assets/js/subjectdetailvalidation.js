/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$.validator.addMethod("validateCode", function (value, element) {
            return this.optional(element) || /[A-Z]{3}[0-9]{3}/i.test(value);
        }, "Subject code must be in SSS000 format");
$().ready(function() {
	$("#detailForm").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"code": {
				required: true,
                                validateCode: true
			},
                        "name": {
                                required: true
                        }
		},
                messages: {
			"code": {
				required: "This field is required"
			},
                        "name": {
                                required: "This field is required"
                        }
		}
	});
});
