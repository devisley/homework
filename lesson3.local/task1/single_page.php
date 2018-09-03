<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 03.09.2018
 * Time: 23:25
 */

namespace app;

use app\gallery\gallery;
require_once 'classes/Gallery.php';

require 'vendor/autoload.php';
$loader = new \Twig_Loader_Filesystem('pages');
$twig = new \Twig_Environment($loader);

if (isset($_GET['id'])) {
    $galleryObj = new Gallery($twig);
    $galleryObj->renderItem($_GET['id'], 'single_page.twig');
}
