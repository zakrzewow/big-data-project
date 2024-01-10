mkdir -p /home/vagrant/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_23.10.0-1-Linux-x86_64.sh -O /home/vagrant/miniconda3/miniconda.sh
bash /home/vagrant/miniconda3/miniconda.sh -b -u -p /home/vagrant/miniconda3
rm -rf /home/vagrant/miniconda3/miniconda.sh

/home/vagrant/miniconda3/bin/conda install -c conda-forge cfgrib
/home/vagrant/miniconda3/bin/python -m pip install xarray==2023.1.0
/home/vagrant/miniconda3/bin/python -m pip install pandas==1.4.2
/home/vagrant/miniconda3/bin/python -m pip install pyarrow
