echo "Program Operasi Aritmatika Sederhana"

echo -e "\nBilangan pertama : "
read a

echo -e "\nBilangan kedua : "
read b

echo -e "\nOperasi Aritmatika :"
echo "Penjumlahan"
echo "Pengurangan"
echo "Perkalian"
echo "Pembagian"
echo "Modulus"

echo -e "\nOperasi apa yang dipilih ?"
read operasi

case "$operasi" in
    "penjumlahan")
        let c=a+b
        echo -e "\n$a + $b = $c"
    ;;
    "pengurangan")
        let c=a-b
        echo -e "\n$a - $b = $c"
    ;;
    "perkalian")
        let c=a*b
        echo -e "\n$a * $b = $c"
    ;;
    "pembagian")
        let c=a/b
        echo -e "\n$a / $b = $c"
    ;;
    "modulus")
        let c=a%b
        echo -e "\n$a % $b = $c"
    ;;
    *)
        echo -e "\nOperasi yang dipilih tidak tersedia"
    ;;
esac