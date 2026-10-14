# THÔNG TIN SINH VIÊN
- Họ và tên: Nguyen Chi Cong
- MSSV: 25B4802010007
- Lớp: TTLT1Đ25
- Đề thi số: 02

# MÔ TẢ NGẮN CƠ SỞ DỮ LIỆU
Cơ sở dữ liệu `gk_thuvien` được xây dựng trên PostgreSQL nhằm mục đích quản lý độc giả, danh mục sách và các lượt mượn trả sách trong thư viện trường đại học. Hệ thống bao gồm 4 bảng: `the_loai`, `doc_gia`, `sach`, và `muon_sach`.

# THỨ TỰ CHẠY CÁC FILE SQL
1. `sql/01_create.sql`: Tạo cấu trúc database và các bảng dữ liệu kèm ràng buộc.
2. `sql/02_data.sql`: Nạp các bản ghi dữ liệu mẫu ban đầu do giám thị cung cấp.
3. `sql/03_alter_update.sql`: Chỉnh sửa cấu trúc cột và thực hiện cập nhật/xóa dữ liệu theo yêu cầu.
4. `sql/04_query.sql`: Thực thi các câu lệnh truy vấn, thống kê dữ liệu.

# TRÍCH XUẤT DỮ LIỆU
- Lệnh xuất dữ liệu Câu 3.4 ra CSV:
  ```bash
  psql -U postgres -d gk_thuvien -c "\copy (SELECT tl.ten_tl, COUNT(*) AS so_luot_muon FROM muon_sach ms JOIN sach s ON ms.ma_sach = s.ma_sach JOIN the_loai tl ON s.ma_tl = tl.ma_tl GROUP BY tl.ten_tl HAVING COUNT(*) >= 4 ORDER BY so_luot_muon DESC) TO 'export/ketqua_cau3_4.csv' WITH CSV HEADER;"
  ```

- Lệnh sao lưu toàn bộ cơ sở dữ liệu (cấu trúc và dữ liệu):
  ```bash
  pg_dump -U postgres gk_thuvien > export/gk_thuvien_backup.sql
  ```