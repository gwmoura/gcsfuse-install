# gcsfuse-install

Is a bash script to install and configure gcsfuse in ubuntu machines

### Instaling

1 - In your machine shell or terminal run:

`curl -sL https://raw.githubusercontent.com/lememilitar/gcsfuse-install/master/run.sh | bash -s [bucket_name]` - 
by default we use the folder "/home/$USER/cloudstorage" to mount your bucket

or if you want to set the folder:

`curl -sL https://raw.githubusercontent.com/lememilitar/gcsfuse-install/master/run.sh | bash -s [bucket_name] [folder_to_mount]`

2 - Put the json file credentials in ~/.gcloud/ with name credentials.json 

3 - Restart your shell

`exec -l $SHELL`

4 - List your bucket files running:

`ls ~/cloudstorage/`
