#!/bin/bash

# install emacs24 snapshot:

add-apt-repository -y ppa:cassou/emacs
apt-get update
apt-get -y install emacs-snapshot-el emacs-snapshot-gtk emacs-snapshot

# install related tools:

apt-get -y install texinfo

# configure vagrant user

USER_PROFILE=/home/vagrant/.profile
if ! grep -q "emacs" $USER_PROFILE; then
    echo -e '\n# start emacs server at login' >> $USER_PROFILE
    echo 'ps | grep -q emacs || emacs --daemon' >> $USER_PROFILE
fi

USER_DOTEMACS=/home/vagrant/.emacs
if [ ! -f $USER_DOTEMACS; then
    cat <<EOF > $USER_DOTEMACS
;;; .emacs
;; A minimal emacs config.
(tool-bar-mode -1)
(setq-default truncate-lines t)
(setq tab-always-indent 'complete)
(defalias 'yes-or-no-p 'y-or-n-p)
(ido-mode 'buffers)
(autoload 'dired-jump "dired-x")
(global-set-key (vector 'remap 'list-buffers) 'ibuffer)
(global-set-key (kbd "C-x C-j") 'dired-jump)
;;; .emacs ends here
EOF
    chown vagrant:vagrant $USER_DOTEMACS
fi
