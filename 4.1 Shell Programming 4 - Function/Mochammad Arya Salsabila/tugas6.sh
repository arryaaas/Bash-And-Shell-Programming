function luas() {
    p=$1
    l=$2

    let luas=p*l

    echo "Luas persegi panjang : $luas"
}

read -p "Masukkan panjang : " panjang
read -p "Maukkan lebar : " lebar
luas panjang lebar