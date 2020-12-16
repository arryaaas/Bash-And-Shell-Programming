declare -a kode_barang
declare -a nama_barang
declare -a harga_barang

function is_laporan_exists() {
    if [[ ! -e ./laporan/$kode_laporan.txt ]]
    then
        status=true
    fi
}

function is_folder_exists() {
    if [[ ! -d ./laporan ]]
    then
        mkdir laporan
    fi
}

function is_barang_exists() {
    for (( i=0;i<${#kode_barang[@]};i++ ))
    do
        if [[ $kode_barang_in == ${kode_barang[$i]} ]]
        then
            status=true
            index=$i
            break
        fi
    done
}

function insert() {
    status=false
    n=${#kode_barang[@]}

    read -p "Kode barang yang ingin ditambahkan : " kode_barang_in
    echo ""

    is_barang_exists

    if [[ $status == true ]]
    then
        echo -e "Barang sudah ada..\n"
    else
        echo -e "Barang belum ada, lanjut..\n"

        kode_barang[$n]=$kode_barang_in
        echo "Kode Barang  : ${kode_barang[$n]}"

        read -p "Nama Barang  : " nama_barang[$n] 
        read -p "Harga Barang : " harga_barang[$n]

        echo -e "\nBarang berhasil ditambahkan..\n"
    fi
}

function search() {
    status=false

    read -p "Kode barang yang ingin dicari : " kode_barang_in
    echo ""

    is_barang_exists

    if [[ $status == true ]]
    then
        echo "Kode Barang   : ${kode_barang[$index]}"
        echo "Nama Barang   : ${nama_barang[$index]}"
        echo "Harga Barang  : ${harga_barang[$index]}"

        echo -e "\nBarang berhasil ditemukan..\n"
    else
        echo -e "Barang tidak ditemukan..\n"
    fi
}

function show() {
    echo -e "Barang yang tersedia..\n"

    for (( i=0;i<${#kode_barang[@]};i++ ))
    do
        echo "Kode Barang   : ${kode_barang[$i]}"
        echo "Nama Barang   : ${nama_barang[$i]}"
        echo "Harga Barang  : ${harga_barang[$i]}"
        echo ""
    done
}

function delete() {
    status=false

    read -p "Kode barang yang ingin dihapus : " kode_barang_in
    echo ""

    is_barang_exists

    if [[ $status == true ]]
    then
        unset kode_barang[$index]
        unset nama_barang[$index]
        unset harga_barang[$index]

        kode_barang=( "${kode_barang[@]}" )
        nama_barang=( "${nama_barang[@]}" )
        harga_barang=( "${harga_barang[@]}" )

        echo -e "Barang telah dihapus..\n"
    else
        echo -e "Barang tidak ditemukan..\n"
    fi
}

function update() {
    status=false

    read -p "Kode barang yang ingin diperbarui : " kode_barang_in
    echo ""

    is_barang_exists

    if [[ $status == true ]]
    then
        read -p "Kode Barang  : " kode_barang[$index]
        read -p "Nama Barang  : " nama_barang[$index]
        read -p "Harga Barang : " harga_barang[$index]

        echo -e "\nBarang berhasil diperbarui..\n"
    else
        echo -e "Barang tidak ditemukan..\n"
    fi
}

function print_out() {
    status=false

    is_folder_exists

    read -p "Kode laporan : " kode_laporan
    echo ""

    is_laporan_exists

    if [[ $status == true ]]
    then
        echo "Laporan Penjualan $kode_laporan" >> ./laporan/$kode_laporan.txt
        echo $date >> ./laporan/$kode_laporan.txt
        echo "" >> ./laporan/$kode_laporan.txt

        total=0

        for (( i=0;i<${#kode_barang[@]};i++ ))
        do
            echo "Kode Barang   : ${kode_barang[$i]}" >> ./laporan/$kode_laporan.txt
            echo "Nama Barang   : ${nama_barang[$i]}" >> ./laporan/$kode_laporan.txt
            echo "Harga Barang  : ${harga_barang[$i]}" >> ./laporan/$kode_laporan.txt
            echo "" >> ./laporan/$kode_laporan.txt
            let total+=${harga_barang[$i]}
        done

        echo "Total Harga   : $total" >> ./laporan/$kode_laporan.txt
        echo "" >> ./laporan/$kode_laporan.txt

        cat ./laporan/$kode_laporan.txt

        unset kode_barang
        unset nama_barang
        unset harga_barang
    else
        echo -e "Laporan sudah ada..\n"
    fi
}

function menu() {
    date=`date +"%b %d, %Y %I:%M %p"`
    echo ""
    echo "=============================="
    echo "| Merchant Management System |"
    echo "|   $date    |"
    echo "=============================="
    echo "| Menu :                     |"
    echo "| 1. Tambah Barang           |"
    echo "| 2. Cari Barang             |"
    echo "| 3. Lihat Barang            |"
    echo "| 4. Hapus Barang            |"
    echo "| 5. Perbarui Barang         |"
    echo "| 6. Cetak Laporan           |"
    echo "| 7. Keluar                  |"
    echo "=============================="
    echo ""
    read -p "Masukkan pilihan : " pilihan
    echo ""

    case "$pilihan" in
        1)
            insert
            read -p "Tekan tombol apa saja untuk melanjutkan.." hold
            clear; menu
        ;;
        2)
            search
            read -p "Tekan tombol apa saja untuk melanjutkan.." hold
            clear; menu
        ;;
        3)
            show
            read -p "Tekan tombol apa saja untuk melanjutkan.." hold
            clear; menu
        ;;
        4)
            delete
            read -p "Tekan tombol apa saja untuk melanjutkan.." hold
            clear; menu
        ;;
        5)
            update
            read -p "Tekan tombol apa saja untuk melanjutkan.." hold
            clear; menu
        ;;
        6)
            print_out
            read -p "Tekan tombol apa saja untuk melanjutkan.." hold
            clear; menu
        ;;
        7)
            exit 0
        ;;
        *)
            echo -e "Pilihan salah\n"
            read -p "Tekan tombol apa saja untuk melanjutkan.." hold
            clear; menu
        ;;
    esac
}

menu