declare -a arr

read -p "Input : " n

i=0
total=0

while [[ $i -lt $n ]]
do
    read arr[$i]
    let total+=${arr[$i]}
    ((i++))
done

echo ""
echo "IPS mhs = $total / ${#arr[@]}"
echo "IPK mhs = $(($total / ${#arr[@]}))"