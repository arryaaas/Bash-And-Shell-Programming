#!/bin/bash
clear

echo -n "bil 1 : "
read a
echo -n "bil 2 : "
read b

echo "pilih operasi perhitungan : "
echo "1. Penjumlahan"
echo "2. Pengurangan"
echo "3. Perkalian"
echo "4. Pembagian"
echo "Pilihan : "
read pilih

echo -e "\n=============================\n"

case "$pilih" in 
  "1")
    let hasil=$a+$b
    echo "Hasil penjumlahan : $hasil"
    ;;
  "2")
    let hasil=$a-$b
    echo "Hasil pengurangan : $hasil"
    ;;
  "3")
    let hasil=$a*$b
    echo "Hasil perkalian : $hasil"
    ;;
  "4")
    let hasil=$a/$b
    echo "Hasil pembagian : $hasil"
    ;;
  *)
    echo "Pastikan input benar"
    ;;
  esac

