mkdir untarred_root
cd untarred_root
tar -xvzf ../tar_files/1_demo.tar
tar -xvzf ../tar_files/2_main.tar
tar -xvzf ../tar_files/3_extra.tar

diff -r ../root_dir root_dir
exit_code=$?
if [ $exit_code -eq 1 ]; then
  echo 'Non-zero exit code - some file was different'
else
  echo "Everything ok"
fi


echo ''
echo 'Running sanity check by removing file and recomparing...'
rm root_dir/dir3/subdir3/z.txt
diff -r ../root_dir root_dir
exit_code=$?
if [ $exit_code -eq 1 ]; then
  echo 'Non-zero exit code - some file was different - sanity check was ok'
else
  echo 'Exit code was zero but should not be'
fi