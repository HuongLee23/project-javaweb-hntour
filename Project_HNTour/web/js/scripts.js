/*!
 * Start Bootstrap - SB Admin v7.0.7 (https://startbootstrap.com/template/sb-admin)
 * Copyright 2013-2023 Start Bootstrap
 * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
 */
// 
// Scripts
// 

function banAccount() {
    // Hiển thị hộp thoại xác nhận
    var userConfirmed = confirm('Are you sure lock this account?');

    // Kiểm tra xem người dùng đã đồng ý hay không
    if (userConfirmed) {
        // Thực hiện hành động nếu người dùng đồng ý
        alert('The account is locked');
        // Thêm logic xử lý khi người dùng đồng ý ở đây
    } else {
        // Xử lý khi người dùng không đồng ý hoặc đóng hộp thoại
        alert('Canceled');
        // Thêm logic xử lý khi người dùng không đồng ý ở đây
    }
}

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});
