<?php
/**
 * Created by PhpStorm.
 * User: Ruslan
 * Date: 03.09.2018
 * Time: 21:11
 */

namespace app\gallery;

require_once 'DatabaseConnector.php';


class Gallery
{
    public $items = [];
    private $connector;
    private $twig;

    public function __construct($twigObj)
    {
        $this->connector = DatabaseConnectorSingleton::getInstance('localhost', 'lesson3', 'lesson3', 'lesson3', 3307);
        $this->twig = $twigObj;
    }

    private function getAllItems() {
        $sql = 'select * from gallery';
        $this->items = $this->connector->getAssocResult($sql);
    }

    private function getOneItem($itemId) {
        $sql = 'select * from gallery where id=' . $itemId;
        $this->items = $this->connector->getRowResult($sql);
    }

    public function renderGallery($template) {
        $this->getAllItems();
        echo $this->twig->render($template, [
            'items' => $this->items
        ]);
    }

    public function renderItem($itemId, $template) {
        $this->getOneItem($itemId);
        echo $this->twig->render($template, [
            'item' => $this->items
        ]);
    }


}