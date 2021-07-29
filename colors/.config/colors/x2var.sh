#!/bin/bash
# Create script to export color env variables from Xresources
# Run needed only when Xresources is updated

cd /home/bolivar/.config/colors
cp colors.tmpl tmp.sh

# replace color0..15
for i in {0..15} 
do
    v=`xrdb -query | awk '/*.color'"$i":'/ { print substr($2,2) }'`
    #echo $v
    eval "sed -i s/%cl${i}%/#${v}/g tmp.sh";
done

# replace fg bg and cursor
fg=`xrdb -query | awk '/*.foreground/ { print substr($2,2) }'`
sed -i "s/%fg%/#${fg}/g" tmp.sh

bg=`xrdb -query | awk '/*.background/ { print substr($2,2) }'`
sed -i "s/%bg%/#${bg}/g" tmp.sh

csr=`xrdb -query | awk '/ala.cursor/ { print substr($2,2) }'`
sed -i "s/%csr%/#${csr}/g" tmp.sh

cp -u tmp.sh colors.sh
rm tmp.sh
