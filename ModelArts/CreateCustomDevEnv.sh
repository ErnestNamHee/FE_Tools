#!/bin/bash
#Create env
Python_Version='3.10.0'
Conda_Env_Name='ModelArtsEnv01'
Kernel_Name='Pytorch-Python-3.10'
conda create --quiet --yes -n my-env python=$Python_Version
#source to env
source /home/ma-user/anaconda3/bin/activate /opt/conda/envs/$Conda_Env_Name
#Mandatory package
pip install jupyter
python3 -m ipykernel install --user --name "$Kernel_Name"
> /home/ma-user/.local/share/jupyter/kernels/$Kernel_Name/kernel.json
cat <<EOT >> /home/ma-user/.local/share/jupyter/kernels/$Kernel_Name/kernel.json
{
 "argv": [
  "/opt/conda/envs/$Conda_Env_Name/bin/python3",
  "-m",
  "ipykernel_launcher",
  "-f",
  "{connection_file}"
 ],
 "display_name": "$Kernel_Name",
 "language": "python",
 "env": {
        "PATH": "/opt/conda/envs/my-env/bin/:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/:/bin/:/sbin/",
        "http_proxy": "http://proxy-notebook.modelarts.com:8083",
        "https_proxy": "http://proxy-notebook.modelarts.com:8083",
        "ftp_proxy": "http://proxy-notebook.modelarts.com:8083",
        "HTTP_PROXY": "http://proxy-notebook.modelarts.com:8083",
        "HTTPS_PROXY": "http://proxy-notebook.modelarts.com:8083",
        "FTP_PROXY": "http://proxy-notebook.modelarts.com:8083"
        }
}
EOT
