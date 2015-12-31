BUCKET_NAME=$1
FOLDER_TO_MOUNT=$2

if [ -z $BUCKET_NAME ]; then
 echo "Please specify google cloud storage bucket name"
 exit
fi

if [ -z $FOLDER_TO_MOUNT ]; then
 $FOLDER_TO_MOUNT="/home/$USER/cloudstorage"
fi

export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
export GOOGLE_APPLICATION_CREDENTIALS="/home/$USER/.gcloud/*.json"
echo "export GOOGLE_APPLICATION_CREDENTIALS=\"/home/$USER/.gcloud/*.json\"" >> ~/.bashrc
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y gcsfuse daemon
sudo usermod -a -G fuse $USER
mkdir -p $FOLDER_TO_MOUNT
mkdir -p /home/$USER/.gcloud
echo "daemon -- gcsfuse --implicit-dirs $BUCKET_NAME $FOLDER_TO_MOUNT" >> ~/.bashrc
echo "Put your Google Cloud credentials account's JSON key file in /home/$USER/.gcloud/ and run 'exec -l $SHELL' to restart the shell"
