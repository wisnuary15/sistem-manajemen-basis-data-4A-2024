# Toko Buku Database

UTS

## 1. Membuat Database dan Tabel

- Membuat database `toko_buku` dan tabel-tabel berikut:
  - Tabel `Penulis` dengan kolom `id_penulis`, `nama`, dan `negara`.
  - Tabel `Buku` dengan kolom `id_buku`, `judul`, `id_penulis`, `harga`, dan `stok`.
  - Tabel `Penjualan` dengan kolom `id_penjualan`, `id_buku`, `tanggal`, dan `jumlah`.

## 2. Mengisi Tabel dengan Data

- Menambahkan data penulis ke tabel `Penulis`.
- Menambahkan data buku ke tabel `Buku`.

## 3. Membuat View

- Membuat view `viewBukuPenulis` yang menampilkan informasi buku beserta nama penulisnya.

## 4. Membuat Stored Procedure TambahPenjualan

- Membuat stored procedure `TambahPenjualan` untuk menambahkan data pada tabel `Penjualan`.
- Stored procedure ini memeriksa ketersediaan buku sebelum menambahkan penjualan.

## 5. Menghapus Stored Procedure

- Setelah pengujian, menghapus stored procedure `TambahPenjualan`.

## 6. Membuat View Baru

- Membuat view `penjualanTerbanyak` untuk menampilkan buku-buku dengan penjualan terbanyak.

## 7. Membuat Stored Procedure insertToBuku

- Membuat stored procedure `insertToBuku` untuk menambahkan buku baru dengan pemeriksaan ketersediaan.


## Catatan

UTS
