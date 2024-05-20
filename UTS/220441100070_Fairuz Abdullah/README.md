Penjelasan :
1. pertama saya membuat database`toko_buku`, lalu membuat tiga tabel di dalamnya: `Penulis`, `Buku`, dan `Penjualan`, sesuai dengan isi nya dan diberikan data kecuali pada tabel penjualan

2. Membuat View `viewBukuPenulis`, yang menggabungkan informasi tentang buku dan penulisnya dari tabel `Buku` dan `Penulis`. 
   
3. Selanjutnya, saya menggunakan view tersebut untuk menampilkan 5 data pertama dari buku yang diurutkan berdasarkan harga terendah ke tertinggi dengan menggunakan order by harga ASC dan juga limit 5.

4. saya membuat sebuah stored procedure bernama `tambahDataPenjualan`, yang digunakan untuk menambahkan data ke tabel `Penjualan`, dengan memeriksa terlebih dahulu apakah buku yang ingin ditambahkan telah ada di dalam database atau belum dengan menggunakan if , agar kondisi nya berjalan saya menggunakan count(*)

5. Membuat View `penjualanTerbanyak` , yang menampilkan informasi tentang buku, penulis, dan total penjualan dari buku-buku yang paling banyak terjual. untuk menjumlahkan jumlah pada penjuaan saya menggunakan SUM, pada order by saya menggunakan DESC untuk mengurutkan dari terbesar dan limit 5 data saja.

6. Terakhir, saya membuat stored procedure `insertToBuku`, yang memungkinkan penambahan buku baru ke dalam sistem dengan harga dan stok awal yang ditentukan, dan juga memeriksa dengan if else apakah buku tersebut sudah ada dalam database sebelum menambahkannya.