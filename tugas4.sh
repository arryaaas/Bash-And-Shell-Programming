read -p "Input : " num

while [[ $num -ge 1 ]]
do 
    let mod=$num%2
    
    if [[ $mod == 1 ]]
    then
        echo $num
    fi
    
    ((num--))
done
