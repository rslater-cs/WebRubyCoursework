// function clicked() {
//     const button = $("#input_button");
//     const height = button.outerHeight();
//     const register = $("#register_fields");
//     if(button.text() === "Register"){
//         anim_log_to_reg(button, height, register);
//     }else{
//         anim_reg_to_log(button, height, register);
//     }
// }
//
// function anim_log_to_reg(button, height, register){
//     button.animate({opacity: "0", height: "0px", top: "+="+height.toString()+"px"}, 300);
//     button.queue(function(){
//         button.html("Log In");
//         button.dequeue();
//     });
//     button.animate({opacity: "1", height: height}, 300);
//     register.animate({height: "+=50px"}, 300);
//     register.html("<label>Re-Enter Password</label><input type='password' name='reenter' id='password_reenter'>");
//     register.animate({opacity: "1"}, 300);
// }
//
// function anim_reg_to_log(button, height, register){
//     button.animate({opacity: "0", height: "0px"}, 300);
//     register.animate({opacity: "0"}, 300);
//     button.queue(function(){
//         button.html("Register");
//         button.dequeue();
//     });
//     button.animate({opacity: "1", height: height, top: "-="+height.toString()+"px"}, 300);
//     register.animate({height: "-=50px"}, 300);
//     register.queue(function(){
//        register.html("");
//        register.dequeue();
//     });
// }

$(document).ready(function () {
    alert("hi");
});