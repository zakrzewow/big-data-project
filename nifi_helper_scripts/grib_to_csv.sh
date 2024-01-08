/usr/local/hadoop/bin/hadoop fs -copyToLocal "/user/bigdataproject/gefs/raw/$1" /home/vagrant/bigdataproject
/home/vagrant/miniconda3/bin/python /home/vagrant/bigdataproject/grib_to_csv.py --input "/home/vagrant/bigdataproject/$1" --output "/home/vagrant/bigdataproject/$2"
/usr/local/hadoop/bin/hadoop fs -copyFromLocal -f "/home/vagrant/bigdataproject/$2" "/user/bigdataproject/gefs/$2"
rm -f "/home/vagrant/bigdataproject/$1" "/home/vagrant/bigdataproject/$2"
