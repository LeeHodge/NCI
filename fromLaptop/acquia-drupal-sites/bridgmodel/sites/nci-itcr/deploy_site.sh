if [ "root" = `whoami` ]; then
	printf "\nThis script should not be executed as the root user.\n\n"
	exit 1
fi

# Put site into maintenance mode
printf "Put site into maintenance mode.\n"
drush vset maintenance_mode 1

# Install new database
while true; do
    read -p "Do you want to (re)install the site database and overwrite any existing data (yes or no)? " yn
    case $yn in
        [Yy]* ) drush si standard --db-url='mysql://drupalsite:drupal123@127.0.0.1/nci-itcr' -y --sites-subdir=nci-itcr --site-name='Informatics Technology for Cancer Research' --account-name=admin --account-pass=admin --account-mail=admin@example.com --site-mail=admin@example.com; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no. ";;
    esac
done

# Put site into maintenance mode (again)
drush vset maintenance_mode 1

# Locality settings
printf "Locality settings.\n"
drush vset site_default_country 'US' -y
drush vset locale 'en-US'
drush vset date_first_day 1 -y
drush vset date_default_timezone 'America/New_York' -y
drush vset date_api_use_iso8601 0 -y
drush vset configurable_timezones 0 -y
drush vset user_default_timezone 0 -y

# Other settings
printf "Turn off user pictures.\n"
drush vset user_pictures 0
printf "Set the default site theme.\n"
drush vset theme_default multipurpose

# Disable the overlay and php modules for security purposes
printf "Disable vulnerable modules for security purposes.\n"
drush dis -y overlay
drush pmu -y overlay
drush dis -y php
drush pmu -y php

# Enable features modules for site configuration
printf "Configure site content types, views, permissions, etc.\n"
drush en -y features_baseline_setup
drush en -y features_site_security
drush en -y features_pathauto
drush en -y features_pages
drush en -y features_activity_code
drush en -y features_institution
drush en -y features_funded_project
drush en -y features_funded_opportunity
drush en -y features_informatics_tool
drush en -y features_rotator
drush en -y features_site_security
drush en -y features_main_menu
drush en -y features_settings_for_itcr_content

# Install content
while true; do
    read -p "Do you want to install site content (yes or no)? " yn
    case $yn in
        [Yy]* ) isContentToBeInstalled=true; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
if [ "$isContentToBeInstalled" == true ]; then
    drush en -y features_article_content_nodes
    drush en -y features_activity_code_content_nodes
    drush en -y features_institution_content_nodes
    drush en -y features_funded_project_content_nodes
    drush en -y features_funded_opportunity_content_nodes
    drush en -y features_informatics_tool_content_nodes
fi

# Clear the cache
printf "Clear the site cache.\n"
drush cc all

# Take site out of maintenance mode
printf "Take site out of maintenance mode.\n"
drush vset maintenance_mode 0

# Need to set permissions correctly.
printf "Set permissions.\n"
cd ..
sudo chmod 775 nci-itcr
for d in nci-itcr; do sudo find $d -type d -exec chmod 755 {} \;; sudo find $d -type f -exec chmod 644 {} \;; done
cd nci-itcr/
sudo chmod 644 settings.php
sudo chmod -R 775 files
for d in files; do sudo find $d -type d -exec chmod 775 {} \;; sudo find $d -type f -exec chmod 664 {} \;; done
sudo chmod 644 files/.htaccess

printf "Setup completed.\n"
