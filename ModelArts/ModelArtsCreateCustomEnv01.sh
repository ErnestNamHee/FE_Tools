#!/bin/bash

#Create env

conda create --quiet --yes -n modelarts-env python=3.10.0

#source to env
source /home/ma-user/anaconda3/bin/activate /opt/conda/envs/modelarts-env

#Install Mandatory package
pip install jupyter 

# Create Kernel
python3 -m ipykernel install --user --name "custom-python-310"
> /home/ma-user/.local/share/jupyter/kernels/custom-python-310/kernel.json

cat <<EOT >> /home/ma-user/.local/share/jupyter/kernels/custom-python-310/kernel.json
{
 "argv": [
  "/opt/conda/envs/modelarts-env/bin/python3",
  "-m",
  "ipykernel_launcher",
  "-f",
  "{connection_file}"
 ],
 "display_name": "custom-python-310",
 "language": "python",
 "env": {
        "PATH": "/opt/conda/envs/modelarts-env/bin/:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        "http_proxy": "http://proxy-notebook.modelarts.com:8083",
        "https_proxy": "http://proxy-notebook.modelarts.com:8083",
        "ftp_proxy": "http://proxy-notebook.modelarts.com:8083",
        "HTTP_PROXY": "http://proxy-notebook.modelarts.com:8083",
        "HTTPS_PROXY": "http://proxy-notebook.modelarts.com:8083",
        "FTP_PROXY": "http://proxy-notebook.modelarts.com:8083"
        }
}
EOT
