cd ..
chmod 775 nci-itcr
for d in nci-itcr; do find $d -type d -exec chmod 755 {} \;; find $d -type f -exec chmod 644 {} \;; done
cd nci-itcr/
chmod 644 settings.php
chmod -R 775 files
for d in files; do find $d -type d -exec chmod 775 {} \;; find $d -type f -exec chmod 664 {} \;; done
chmod 644 files/.htaccess
