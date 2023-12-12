

ngc batch run  \
    --name "ml-model.notamodel-rna-folding"  \
    --preempt RUNONCE --total-runtime 604800s \
    --ace nv-us-west-2 --instance dgx1v.32g.8.norm \
    --commandline "nohup jupyter lab --ip=0.0.0.0 \
    --allow-root --no-browser --NotebookApp.token='' \
    --notebook-dir=/ \
    --NotebookApp.allow_origin='*' & date; sleep 168h" \
    --result result \
    --image "nvidia/pytorch:23.09-py3" \
    --org nvidian --team rapids-kgmon \
    --workspace NNDPdzVmROOT8Sw7iaPdgw:/mount/kazuki_kaggle3:RW \
    --label ml___rna_folding \
    --port 8888

ngc batch run  \
    --name "ml-model.notamodel-rna-folding"  \
    --preempt RUNONCE --total-runtime 604800s \
    --ace nv-us-west-2 --instance dgx1v.16g.8.norm \
    --commandline "nohup jupyter lab --ip=0.0.0.0 \
    --allow-root --no-browser --NotebookApp.token='' \
    --notebook-dir=/ \
    --NotebookApp.allow_origin='*' & date; sleep 168h" \
    --result result \
    --image "nvidia/pytorch:23.09-py3" \
    --org nvidian --team rapids-kgmon \
    --workspace NNDPdzVmROOT8Sw7iaPdgw:/mount/kazuki_kaggle3:RW \
    --label ml___rna_folding \
    --port 8888

cd
apt-get update
yes '' | apt-get install htop


cp -r /mount/kazuki_kaggle3/.kaggle .
cp -r /mount/kazuki_kaggle3/.ssh .
pip install poetry
pip install kaggle
pip install sentence-transformers
pip install numpy==1.25.2
pip install polars

echo "alias smi=nvidia-smi" >> .bashrc
echo "cd /mount/kazuki_kaggle3/RNA/Kaggle-Stanford-Ribonanza-RNA-Folding" >> .bashrc
echo "fwc() {
find ${1} -type f | wc -l
}" >> .bashrc

source .bashrc


# gsutil
cd
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-375.0.0-linux-x86_64.tar.gz
tar -xf google-cloud-sdk-375.0.0-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh
source .bashrc
yes '' | gcloud components update
gcloud init

## copy to bucket
gsutil -m cp [OBJECT_NAME] gs://[BUCKET_NAME]
gsutil -m rsync -r [OBJECT_NAME] gs://[BUCKET_NAME]/[OBJECT_NAME]




## copy to machine
gsutil -m cp -r gs://[BUCKET_NAME]/[OBJECT_NAME] .
gsutil -m rsync -r gs://[BUCKET_NAME]/[OBJECT_NAME] [OBJECT_NAME]


## remove
gsutil rm gs://[BUCKET_NAME]/[OBJECT_NAME]





