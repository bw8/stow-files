#!/bin/bash
# Create zathura color config from Xresources
# Run needed only when Xresources is updated

cd /home/bolivar/.config/zathura
cp tmpl.zat tmp.zat

# replace color0..15
for i in {0..15} 
do
    v=`xrdb -query | awk '/*.color'"$i":'/ { print substr($2,2) }'`
    #echo $v
    eval "sed -i s/%cl${i}%/#${v}/g tmp.zat";
done

# replace fg bg and cursor
fg=`xrdb -query | awk '/*.foreground/ { print substr($2,2) }'`
sed -i "s/%fg%/#${fg}/g" tmp.zat

bg=`xrdb -query | awk '/*.background/ { print substr($2,2) }'`
sed -i "s/%bg%/#${bg}/g" tmp.zat

csr=`xrdb -query | awk '/ala.cursor/ { print substr($2,2) }'`
sed -i "s/%csr%/#${csr}/g" tmp.zat

cp -u tmp.zat colors.zat
rm tmp.zat
