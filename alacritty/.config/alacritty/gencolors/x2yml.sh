#!/bin/bash
# Create alacritty color config from Xresources
# Run needed only when Xresources is updated

cd ~/.config/alacritty/colors
cp tmpl.yml tmp.yml

# replace color0..15
for i in {0..15} 
do
    v=`xrdb -query | awk '/*.color'"$i":'/ { print substr($2,2) }'`
    #echo $v
    eval "sed -i s/%cl${i}%/#${v}/g tmp.yml";
done

# replace fg bg and cursor
fg=`xrdb -query | awk '/*.foreground/ { print substr($2,2) }'`
sed -i "s/%fg%/#${fg}/g" tmp.yml

bg=`xrdb -query | awk '/*.background/ { print substr($2,2) }'`
sed -i "s/%bg%/#${bg}/g" tmp.yml

csr=`xrdb -query | awk '/ala.cursor/ { print substr($2,2) }'`
sed -i "s/%csr%/#${csr}/g" tmp.yml

cp -u tmp.yml ../colors.yml
rm tmp.yml
