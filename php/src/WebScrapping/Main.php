<?php

namespace Chuva\Php\WebScrapping;

use Exercicio2023\WebScrapping\Scrapper;

/**
 * Runner for the Webscrapping exercice.
 * Corredor para o exercício Webscrapping.
 */
class Main {

  /**
   * Main runner, instantiates a Scrapper and runs.
   * Corredor principal, instancia um Scrapper e executa.
   */
  public static function run(): void {
    $dom = new \DOMDocument('1.0', 'utf-8');
    $dom->loadHTMLFile(__DIR__ . '/../../assets/origin.html');

    $data = (new Scrapper())->scrap($dom);

    // Write your logic to save the output file bellow.
    //  Escreva sua lógica para salvar o arquivo de saída abaixo.

    print_r($data);
  }

}
