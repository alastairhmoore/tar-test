# tar-test
Attempting to create separate tar files for a dataset

Make sure there are no left over files from previous run

```
bash s0_clear_all.sh
```


Populate directory structure and compress into 3 tar files

```
bash s1_create_data.sh
```


Extract the tar files and check the reconstructed file hierarchy is the same

```
bash s2_extract_and_compare.sh
```