-- CreateTable
CREATE TABLE `dim_pelanggan` (
    `id_pelanggan` INTEGER NOT NULL AUTO_INCREMENT,
    `kode_pelanggan` VARCHAR(20) NULL,
    `nama_pelanggan` VARCHAR(100) NULL,
    `jenis_kelamin` CHAR(1) NULL,
    `kota` VARCHAR(50) NULL,

    PRIMARY KEY (`id_pelanggan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dim_produk` (
    `id_produk` INTEGER NOT NULL AUTO_INCREMENT,
    `kode_produk` VARCHAR(20) NULL,
    `nama_produk` VARCHAR(100) NULL,
    `kategori` VARCHAR(50) NULL,
    `harga` DECIMAL(10, 2) NULL,

    PRIMARY KEY (`id_produk`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dim_waktu` (
    `id_waktu` INTEGER NOT NULL AUTO_INCREMENT,
    `tanggal` DATE NULL,
    `tahun` INTEGER NULL,
    `bulan` INTEGER NULL,
    `bulan_nama` VARCHAR(20) NULL,
    `kuartal` INTEGER NULL,

    PRIMARY KEY (`id_waktu`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fact_penjualan` (
    `id_penjualan` INTEGER NOT NULL AUTO_INCREMENT,
    `id_produk` INTEGER NULL,
    `id_pelanggan` INTEGER NULL,
    `id_waktu` INTEGER NULL,
    `jumlah` INTEGER NULL,
    `harga_satuan` DECIMAL(10, 2) NULL,
    `total_harga` DECIMAL(10, 2) NULL,

    PRIMARY KEY (`id_penjualan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `fact_penjualan` ADD CONSTRAINT `fact_penjualan_id_pelanggan_fkey` FOREIGN KEY (`id_pelanggan`) REFERENCES `dim_pelanggan`(`id_pelanggan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fact_penjualan` ADD CONSTRAINT `fact_penjualan_id_produk_fkey` FOREIGN KEY (`id_produk`) REFERENCES `dim_produk`(`id_produk`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fact_penjualan` ADD CONSTRAINT `fact_penjualan_id_waktu_fkey` FOREIGN KEY (`id_waktu`) REFERENCES `dim_waktu`(`id_waktu`) ON DELETE NO ACTION ON UPDATE NO ACTION;
