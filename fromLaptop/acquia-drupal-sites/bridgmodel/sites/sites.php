<?php

/**
 * @file
 * Configuration file for Drupal's multi-site directory aliasing feature.
 *
 * This file allows you to define a set of aliases that map hostnames, ports, and
 * pathnames to configuration directories in the sites directory. These aliases
 * are loaded prior to scanning for directories, and they are exempt from the
 * normal discovery rules. See default.settings.php to view how Drupal discovers
 * the configuration directory when no alias is found.
 *
 * Aliases are useful on development servers, where the domain name may not be
 * the same as the domain of the live server. Since Drupal stores file paths in
 * the database (files, system table, etc.) this will ensure the paths are
 * correct when the site is deployed to a live server.
 *
 * To use this file, copy and rename it such that its path plus filename is
 * 'sites/sites.php'. If you don't need to use multi-site directory aliasing,
 * then you can safely ignore this file, and Drupal will ignore it too.
 *
 * Aliases are defined in an associative array named $sites. The array is
 * written in the format: '<port>.<domain>.<path>' => 'directory'. As an
 * example, to map http://www.drupal.org:8080/mysite/test to the configuration
 * directory sites/example.com, the array should be defined as:
 * @code
 * $sites = array(
 *   '8080.www.drupal.org.mysite.test' => 'example.com',
 * );
 * @endcode
 * The URL, http://www.drupal.org:8080/mysite/test/, could be a symbolic link or
 * an Apache Alias directive that points to the Drupal root containing
 * index.php. An alias could also be created for a subdomain. See the
 * @link http://drupal.org/documentation/install online Drupal installation guide @endlink
 * for more information on setting up domains, subdomains, and subdirectories.
 *
 * The following examples look for a site configuration in sites/example.com:
 * @code
 * URL: http://dev.drupal.org
 * $sites['dev.drupal.org'] = 'example.com';
 *
 * URL: http://localhost/example
 * $sites['localhost.example'] = 'example.com';
 *
 * URL: http://localhost:8080/example
 * $sites['8080.localhost.example'] = 'example.com';
 *
 * URL: http://www.drupal.org:8080/mysite/test/
 * $sites['8080.www.drupal.org.mysite.test'] = 'example.com';
 * @endcode
 *
 * @see default.settings.php
 * @see conf_path()
 * @see http://drupal.org/documentation/install/multi-site
 */

/* LOCAL */
$sites['127.0.0.1']            = 'nci-itcr';
$sites['nci-emice.local']      = 'nci-emice';
$sites['nci-nctn.local']       = 'nci-nctn';
$sites['nci-itcr.local']       = 'nci-itcr';
$sites['8082:itcr']            = 'itcr';

/* AWS CI/QA */
$sites['174.129.249.95']       = 'nci-itcr';
$sites['nci-nctn.qa']          = 'nci-nctn';
$sites['nci-itcr.qa']          = 'nci-itcr';

/* AWS UAT */
$sites['50.17.223.185']        = 'nci-nctn';
$sites['nci-nctn.uat']         = 'nci-nctn';
$sites['nci-itcr.uat']         = 'nci-itcr';

/* NCI DEV */
$sites['nctn-dev.nci.nih.gov']       = 'nci-nctn';
$sites['443.nctn-dev.nci.nih.gov']   = 'nci-nctn';
$sites['nci-nctn.dev']               = 'nci-nctn';
$sites['itcrd7-dev.nci.nih.gov']     = 'nci-itcr';
$sites['443.itcrd7-dev.nci.nih.gov'] = 'nci-itcr';
$sites['nci-itcr.dev']               = 'nci-itcr';

/* NCI STAGE */
$sites['10.133.202.147']                      = 'nci-nctn';
$sites['nctn-data-archive-stage.nci.nih.gov'] = 'nci-nctn';
$sites['nci-nctn.stage']                      = 'nci-nctn';
$sites['nci-itcr.stage']                      = 'nci-itcr';
