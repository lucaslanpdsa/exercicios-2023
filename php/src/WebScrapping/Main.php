<?php

namespace Exercicio2023\WebScrapping; // Corrigido o namespace

class Main {

  public static function run(): void {
    $html = file_get_contents(__DIR__ . '/../../../webscrapping/origin.html');

    // Tratamento de erro para o carregamento do HTML
    if ($html === false) {
      echo "Erro ao carregar o arquivo HTML.\n";
      return;
    }

    $dom = new \DOMDocument();
    // Tratamento de erro para o carregamento do HTML no DOMDocument
    if (!$dom->loadHTML($html)) {
      echo "Erro ao carregar o HTML no DOMDocument.\n";
      return;
    }

    $data = (new Scrapper())->scrapeAndCreateSpreadsheet($dom); // Corrigido o método chamado

    print_r($data);
  }

}
