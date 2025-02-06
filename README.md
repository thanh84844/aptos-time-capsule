
# Aptos Time Capsule

## Giới Thiệu

Aptos Time Capsule là một smart contract viết bằng Move để tạo và quản lý "time capsule" (hộp thời gian) trên blockchain Aptos. Người dùng có thể lưu trữ dữ liệu trong một khoảng thời gian nhất định và chỉ có thể truy cập lại dữ liệu sau khi thời gian đã kết thúc.

## Chức Năng Chính

-   **Tạo hộp thời gian** (`initTimeCapsule`): Khởi tạo một hộp thời gian với thời gian khóa.
    
-   **Xóa hộp thời gian** (`deleteTimeCapsule`): Xóa hộp thời gian khi thời gian đã hết.
    
-   **Cập nhật dữ liệu** (`updateData`): Cập nhật nội dung bên trong hộp thời gian.
    
-   **Kiểm tra thời gian còn lại** (`getTimeLeft`): Lấy số giây còn lại trước khi mở hộp thời gian.
    
-   **Lấy dữ liệu** (`getData`): Truy xuất dữ liệu nếu thời gian đã hết.
    

## Cài Đặt

### Yêu Cầu Hệ Thống

-   Aptos CLI
    
-   Move Prover
    
-   Node.js (nếu cần tích hợp với dApp)
    

### Triển Khai

1.  Clone repo:
    
    ```
    git clone https://github.com/yourusername/aptos-time-capsule.git
    cd aptos-time-capsule
    ```
    
2.  Build và kiểm tra:
    
    ```
    aptos move compile
    aptos move test
    ```
    
3.  Deploy lên Aptos blockchain:
    
    ```
    aptos move publish --profile default
    ```
    

## Cách Sử Dụng

### Tạo Hộp Thời Gian

```
call time_cap_addr::TIME_CAP::initTimeCapsule(account, time)
```

### Cập Nhật Dữ Liệu

```
call time_cap_addr::TIME_CAP::updateData(account, data)
```

### Xóa Hộp Thời Gian

```
call time_cap_addr::TIME_CAP::deleteTimeCapsule(account)
```

### Kiểm Tra Thời Gian Còn Lại

```
call time_cap_addr::TIME_CAP::getTimeLeft(account)
```

### Lấy Dữ Liệu Sau Khi Thời Gian Hết Hạn

```
call time_cap_addr::TIME_CAP::getData(account)
```

## Lỗi và Mã Lỗi

Mã lỗi

Ý nghĩa

`1`

Thời gian chưa hết

`2`

Thời gian đã hết

`3`

Không phải chủ sở hữu

`4`

Hộp thời gian không tồn tại

`5`

Hộp thời gian đã tồn tại

## Đóng Góp

Mọi đóng góp đều được hoan nghênh! Vui lòng fork repo, tạo pull request và gửi báo cáo lỗi nếu có.

## Giấy Phép

Dự án này được phát hành dưới giấy phép MIT.
