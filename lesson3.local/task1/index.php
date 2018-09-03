<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 03.09.2018
 * Time: 22:39
 */

namespace app;

use app\gallery\gallery;
require_once 'classes/Gallery.php';

require 'vendor/autoload.php';
$loader = new \Twig_Loader_Filesystem('pages');
$twig = new \Twig_Environment($loader);

$galleryObj = new Gallery($twig);
$galleryObj->renderGallery('gallery.twig');
