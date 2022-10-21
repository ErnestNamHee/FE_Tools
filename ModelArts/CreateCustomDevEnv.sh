#!/bin/bash
#Create env

#### Set Parameters
Python_Version='3.10.0'
Conda_Env_Name='ModelArtsEnv01'
Kernel_Name='pytorch-python-3.10'  #Please use small capital only for the Kernel environment name

#### Create Conda Environment
conda create --quiet --yes -n $Conda_Env_Name python=$Python_Version
#source to env
source /home/ma-user/anaconda3/bin/activate /opt/conda/envs/$Conda_Env_Name

#### Install Mandatory package
pip install jupyter numpy scipy scikit-learn pillow

#### Create the iPython Kernel
python3 -m ipykernel install --user --name "$Kernel_Name"
> /home/ma-user/.local/share/jupyter/kernels/$Kernel_Name/kernel.json

#### Update the Kernel json file
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
