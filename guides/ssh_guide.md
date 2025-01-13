## SSH-guide to connect with Github

If a .ssh directory does not exist in your $HOME directory create one, and put the following file inside it.

> mkdir ~/.ssh
> touch ~/.ssh/<id_Github>

Type the following command.

> ssh-keygen -t ed25519 -C "youremail@example.com"

When you're prompted to "Enter a file in which to save the key", you can press Enter to accept the default file location. I recommend creating a directory and file beforehand as stated above.

Now enter a passphrase when prompted. The '.pub' file holds your public key.
