-- 2a: Them cot sdt va cap nhat sdt cua doc gia DG01
ALTER TABLE doc_gia ADD COLUMN sdt VARCHAR(15);
UPDATE doc_gia SET sdt = '0988000001' WHERE ma_dg = 'DG01';

-- 2b: Bo sung them 2 ban cho sach thuoc the loai Tin hoc (ma_tl = 'TH')
UPDATE sach SET so_ban = so_ban + 2 WHERE ma_tl = 'TH';

-- 2c: Them doc gia DG09 va them 2 luot muon moi
INSERT INTO doc_gia (ma_dg, ho_ten, khoa, ngay_dang_ky) 
VALUES ('DG09', 'Ngo Van Phuc', 'Kinh te', '2026-10-05');

INSERT INTO muon_sach (ma_dg, ma_sach, ngay_muon, ngay_tra) VALUES 
('DG09', 'S006', '2026-10-05', NULL),
('DG09', 'S009', '2026-10-07', NULL);

-- 2d: Xoa sach co ma S010
DELETE FROM sach WHERE ma_sach = 'S010';