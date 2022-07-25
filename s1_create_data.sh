root='root_dir' 
level_1=(
  'dir1'
  'dir2'
  'dir3'
)
level_2=(
  'subdir1'
  'subdir2'
  'subdir3'
)
files=(
  'x.txt'
  'y.txt'
  'z.txt'
)

# populate the full data structure
mkdir $root
for l1 in "${level_1[@]}"; do
  echo "$l1"
  mkdir "$root/$l1"
  for l2 in "${level_2[@]}"; do
    mkdir "$root/$l1/$l2"
    for f in "${files[@]}"; do
      touch "$root/$l1/$l2/$f"
    done
  done
done

# define the files to go in each zip



FILE=file_list_1_demo.txt
touch $FILE
echo "$root/dir1/subdir1/x.txt" > $FILE # > to overwrite contents
echo "$root/dir1/subdir1/y.txt" >> $FILE # >> to append contents
echo "$root/dir1/subdir1/z.txt" >> $FILE # >> to append contents
echo "$root/dir1/subdir2/x.txt" >> $FILE # >> to append contents
echo "$root/dir1/subdir2/y.txt" >> $FILE # >> to append contents
echo "$root/dir1/subdir2/z.txt" >> $FILE # >> to append contents
echo "$root/dir1/subdir3/x.txt" >> $FILE # >> to append contents
echo "$root/dir1/subdir3/y.txt" >> $FILE # >> to append contents
echo "$root/dir1/subdir3/z.txt" >> $FILE # >> to append contents

FILE=file_list_2_main.txt
touch $FILE
echo "$root/dir2/subdir1/x.txt" > $FILE # > to overwrite contents
echo "$root/dir2/subdir1/y.txt" >> $FILE # >> to append contents
echo "$root/dir2/subdir1/z.txt" >> $FILE # >> to append contents
echo "$root/dir2/subdir2/x.txt" >> $FILE # > to overwrite contents
echo "$root/dir2/subdir2/y.txt" >> $FILE # >> to append contents
echo "$root/dir2/subdir2/z.txt" >> $FILE # >> to append contents
echo "$root/dir3/subdir1/x.txt" >> $FILE # > to overwrite contents
echo "$root/dir3/subdir1/y.txt" >> $FILE # >> to append contents
echo "$root/dir3/subdir1/z.txt" >> $FILE # >> to append contents
echo "$root/dir3/subdir2/x.txt" >> $FILE # > to overwrite contents
echo "$root/dir3/subdir2/y.txt" >> $FILE # >> to append contents
echo "$root/dir3/subdir2/z.txt" >> $FILE # >> to append contents


FILE=file_list_3_extra.txt
touch $FILE
echo "$root/dir2/subdir3/x.txt" > $FILE # > to overwrite contents
echo "$root/dir2/subdir3/y.txt" >> $FILE # >> to append contents
echo "$root/dir2/subdir3/z.txt" >> $FILE # >> to append contents
echo "$root/dir3/subdir3/x.txt" >> $FILE # >> to append contents
echo "$root/dir3/subdir3/y.txt" >> $FILE # >> to append contents
echo "$root/dir3/subdir3/z.txt" >> $FILE # >> to append contents


mkdir tar_files
tar -cvf tar_files/1_demo.tar -T file_list_1_demo.txt
tar -cvf tar_files/2_main.tar -T file_list_2_main.txt
tar -cvf tar_files/3_extra.tar -T file_list_3_extra.txt