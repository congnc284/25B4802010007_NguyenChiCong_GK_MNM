-- Cau 3.1
SELECT ma_sach, ten_sach, tac_gia, nam_xb 
FROM sach 
WHERE nam_xb >= 2018 
ORDER BY nam_xb DESC, ten_sach ASC;

-- Cau 3.2
SELECT 
    COUNT(*) AS so_dau_sach, 
    SUM(so_ban) AS tong_so_ban, 
    MAX(nam_xb) AS nam_xb_moi_nhat 
FROM sach;

-- Cau 3.3
SELECT s.ma_sach, s.ten_sach, tl.ten_tl, s.so_ban 
FROM sach s 
JOIN the_loai tl ON s.ma_tl = tl.ma_tl 
WHERE tl.ten_tl IN ('Tin hoc', 'Kinh te') 
ORDER BY tl.ten_tl ASC, s.ten_sach ASC;

-- Cau 3.4
SELECT tl.ten_tl, COUNT(*) AS so_luot_muon 
FROM muon_sach ms 
JOIN sach s ON ms.ma_sach = s.ma_sach 
JOIN the_loai tl ON s.ma_tl = tl.ma_tl 
GROUP BY tl.ten_tl 
HAVING COUNT(*) >= 4 
ORDER BY so_luot_muon DESC;

-- Cau 3.5
SELECT ma_dg, ho_ten, khoa 
FROM doc_gia 
WHERE ma_dg NOT IN (
    SELECT DISTINCT ms.ma_dg 
    FROM muon_sach ms 
    JOIN sach s ON ms.ma_sach = s.ma_sach 
    WHERE s.ma_tl = 'VH'
) 
ORDER BY ma_dg ASC;