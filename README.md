<h2 align="center">
    <a href="https://dainam.edu.vn/vi/khoa-cong-nghe-thong-tin">
    🎓 Faculty of Information Technology (DaiNam University)
    </a>
</h2>
<h2 align="center">
   HỆ THỐNG ĐIỂM DANH SINH VIÊN BẰNG CÔNG NGHỆ BLOCKCHAIN
</h2>

<div align="center">
    <p align="center">
        <img src="https://github.com/user-attachments/assets/ee72b1c4-04c7-4e4b-8d7a-8cf16932804a" width="170" />
    </p>

[![AIoTLab](https://img.shields.io/badge/AIoTLab-green?style=for-the-badge)](https://www.facebook.com/DNUAIoTLab)
[![Faculty of Information Technology](https://img.shields.io/badge/Faculty%20of%20Information%20Technology-blue?style=for-the-badge)](https://dainam.edu.vn/vi/khoa-cong-nghe-thong-tin)
[![DaiNam University](https://img.shields.io/badge/DaiNam%20University-orange?style=for-the-badge)](https://dainam.edu.vn)

</div>

---

## 1. 📌 Giới thiệu

**S-Attend** là hệ thống quản lý và tra cứu lịch sử điểm danh sinh viên dựa trên nền tảng **Blockchain**. Dự án ứng dụng hợp đồng thông minh (Smart Contract) giúp minh bạch hóa dữ liệu điểm danh, chống sửa đổi thông tin trái phép, đồng thời tích hợp ví điện tử dApp để quản trị quyền truy cập.

Hệ thống cho phép:
- 🔐 Xác thực quyền quản trị bằng ví điện tử MetaMask.
- 📝 Khởi tạo danh sách môn học, lớp học và đăng ký thông tin sinh viên lên mạng lưới.
- ⚡ Lập danh sách điểm danh, cập nhật trạng thái và đồng bộ dữ liệu trực tiếp vào Hợp đồng thông minh.
- 📊 Tra cứu nhanh kết quả điểm danh thời gian thực cho sinh viên theo ID và Ngày học.
- 📢 Hỗ trợ kết nối API gửi báo cáo kết quả điểm danh qua Telegram một cách tự động.

---

## 2. 🎯 Mục tiêu đề tài

- Nghiên cứu và triển khai ứng dụng Hợp đồng thông minh (Smart Contract) trong môi trường giáo dục.
- Đảm bảo tính toàn vẹn, bảo mật và bất biến của dữ liệu điểm danh, loại bỏ tình trạng gian lận thông tin.
- Xây dựng giao diện Web dApp tương tác trực quan, kết nối ví không gián đoạn (Session Management).
- Tối ưu hóa hiệu năng truy vấn dữ liệu trực tiếp từ các nút mạng Blockchain.

---

## 3. 📂 Cấu trúc Hợp đồng thông minh (Smart Contract)

Hợp đồng thông minh `AttendanceFinal.sol` được triển khai để lưu trữ các thực thể dữ liệu chính:
- **Sinh viên (Student):** Lưu trữ định danh bằng Tên và Địa chỉ ví (`address`) đại diện duy nhất trên Blockchain.
- **Buổi học (Session):** Quản lý trạng thái thông tin chi tiết của từng buổi học, ID môn, ngày học cụ thể.
- **Trạng thái điểm danh (Attendance Record):** Bản đồ cấu trúc (`mapping`) liên kết thông tin buổi học, ví sinh viên và trạng thái có mặt/vắng mặt.

---

## 4. ⚙️ Hướng triển khai

### 🔹 Bước 1: Phát triển & Triển khai Smart Contract
- Viết mã nguồn Hợp đồng thông minh bằng ngôn ngữ Solidity.
- Biên dịch và deploy contract lên mạng thử nghiệm (Testnet) hoặc mạng cục bộ thông qua Hardhat/Remix.

### 🔹 Bước 2: Thiết kế giao diện dApp
- Xây dựng layout bằng HTML5, CSS3 tích hợp thư viện Bootstrap để tối ưu hiển thị.
- Phân chia màn hình đăng nhập (Xác thực ví) và màn hình Dashboard nghiệp vụ tổng quan.

### 🔹 Bước 3: Tích hợp Web3 & Quản lý trạng thái phiên
- Sử dụng thư viện `ethers.js` thiết lập kết nối RPC thông qua `window.ethereum`.
- Tối ưu hóa trải nghiệm người dùng với `localStorage` để tự động khôi phục phiên kết nối khi tải lại trang hoặc điều hướng quay về trang chủ mà không cần thực hiện đăng nhập lại từ đầu.

### 🔹 Bước 4: Xây dựng cổng dữ liệu báo cáo
- Tạo luồng xử lý xuất bản và quét thông tin Blockchain để cập nhật giao diện chi tiết sinh viên.
- Nhúng webhook/API kết nối bot để gửi thông báo kết quả tức thời qua ứng dụng Telegram.

---

## 5. 🔥 Tính năng chính

✔ **Xác thực bảo mật:** Đăng nhập an toàn thông qua cổng MetaMask.  
✔ **Quản lý dữ liệu:** Khởi tạo thông tin sinh viên, đăng ký tạo buổi học mới.  
✔ **Điểm danh phân quyền:** Lập danh sách điểm danh nhanh gọn và thực hiện ghi dữ liệu bất biến lên mạng chuỗi khối.  
✔ **Tra cứu thời gian thực:** Cơ chế kiểm tra, thông báo đối khớp dữ liệu buổi học/ngày học/mã sinh viên trực quan và hiển thị lỗi sai lệch rõ ràng.  
✔ **Tự động hóa báo cáo:** Gửi dữ liệu thống kê điểm danh qua kênh Telegram.

---

## 6. 🖥️ Giao diện hệ thống

<div align="center">
    <img width="80%" src="img/login.png" />
    <p><i>Màn hình cổng đăng nhập xác thực ví MetaMask</i></p>
</div>

<div align="center">
    <img width="80%" src="img/dashboard.png" />
    <p><i>Màn hình tổng quan Dashboard quản trị</i></p>
</div>

<div align="center">
    <img width="80%" src="img/tra_cuu.png" />
    <p><i>Trang báo cáo sinh viên</i></p>
</div>

<div align="center">
    <img width="80%" src="img/report.png" />
    <p><i>Giao diện điểm danh sinh viên</i></p>
</div>

<div align="center">
    <img width="80%" src="img/report.png" />
    <p><i>Gửi báo cáo qua telegram</i></p>
</div>

<div align="center">
    <img width="80%" src="img/report.png" />
    <p><i>Tra cứu điểm danh</i></p>
</div>

---

## 7. 🧠 Công nghệ sử dụng

[![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/HTML)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=bootstrap&logoColor=white)](https://getbootstrap.com/)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![Solidity](https://img.shields.io/badge/Solidity-363636?style=flat&logo=solidity&logoColor=white)](https://soliditylang.org/)
[![Ethers.js](https://img.shields.io/badge/Ethers.js-2535a0?style=flat&logo=ethereum&logoColor=white)](https://docs.ethers.org/)

---

## 8. ⚡ Cài đặt & Chạy dự án

### Clone project
Mở terminal và sao chép mã nguồn về máy cục bộ:
```bash
git clone [https://github.com/MinnKaa/Block_Chain_Diem_Danh.git]
