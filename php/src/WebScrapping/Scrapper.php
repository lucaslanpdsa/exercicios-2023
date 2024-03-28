<?php

namespace Exercicio2023\WebScrapping;

require_once __DIR__ . '/../../vendor/autoload.php'; // Ajuste o caminho para o autoload.php

use Box\Spout\Writer\Common\Creator\WriterEntityFactory;
use Box\Spout\Common\Entity\Row;
use Box\Spout\Writer\Common\Creator\Style\StyleBuilder;

class Scrapper
{
    public function scrapeAndCreateSpreadsheet()
    {
        echo "O método scrapeAndCreateSpreadsheet() está sendo chamado...\n"; // Adicionando mensagem de depuração

        echo "Iniciando o processo de scraping e criação da planilha...\n";

        // Carregando o arquivo HTML
        $html = file_get_contents(__DIR__ . '/../../../webscrapping/origin.html');

        echo "Arquivo HTML carregado...\n";

        // Criando o objeto DOMDocument
        $dom = new \DOMDocument();
        $dom->loadHTML($html);

        echo "DOMDocument criado e HTML carregado...\n";

        // Iniciando a criação da planilha
        $writer = WriterEntityFactory::createXLSXWriter();

        echo "Objeto Spout Writer criado...\n";

        // Abrindo a planilha para escrita
        $writer->openToFile(__DIR__ . '/../../../webscrapping/trabalhos.xlsx');

        echo "Planilha aberta para escrita...\n";

        // Criando um estilo para o cabeçalho
        $headerStyle = (new StyleBuilder())->setFontBold()->build();

        echo "Estilo para o cabeçalho criado...\n";

        // Escrevendo o cabeçalho da planilha
        $writer->addRow(
            WriterEntityFactory::createRowFromArray(['Título', 'Autores', 'Resumo'], $headerStyle)
        );

        echo "Cabeçalho da planilha escrito...\n";

        // Encontrando todas as informações dos trabalhos
        $cards = $dom->getElementsByTagName('div');
        foreach ($cards as $card) {
            if ($card->getAttribute('class') === 'card card-horizontal card-trabalho') {
                $titulo = $card->getElementsByTagName('h5')->item(0)->nodeValue;
                $autores = $card->getElementsByTagName('p')->item(0)->nodeValue;
                $resumo = $card->getElementsByTagName('div')->item(1)->nodeValue;

                // Escrevendo os dados do trabalho na planilha
                $writer->addRow(WriterEntityFactory::createRowFromArray([$titulo, $autores, $resumo]));

                echo "Dados do trabalho escritos na planilha: Título: $titulo, Autores: $autores, Resumo: $resumo\n";
            }
        }

        // Fechando a planilha
        $writer->close();

        echo "Planilha fechada. Processo de scraping e criação da planilha concluído!\n";
    }
}
