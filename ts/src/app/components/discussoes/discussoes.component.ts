import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, } from '@angular/forms';

@Component({
  selector: 'app-discussoes',
  templateUrl: './discussoes.component.html',
  styleUrls: ['./discussoes.component.scss']
})

export class DiscussoesComponent implements OnInit {

  MostrarSessaoBase: boolean = true; //Quando for true a sessão base sera exibida

  mostrarCriateTopic: boolean = false; // Quando for true a div com class "create_topic" que é a sessão que cria um novo topicosera exibida

  formfoiEnviado: boolean = false; // Quando for true a div com class "topicoEnviado" sera exibida

  formulario!: FormGroup; // dados do formulario

  TopicoFoiAnalisado: boolean = false; // Quando for false o topico estará em analise e quando for true o topico será exibido

  topicos: Array<any> = [] //Array que exibira os tópicos no HTML

  CriaTopico() {
    this.mostrarCriateTopic = true
    this.MostrarSessaoBase = false
    this.formfoiEnviado = false
  }

  submit() {
    this.TopicoFoiAnalisado = false
    this.mostrarCriateTopic = false
    this.topicos.push({
      assunto: this.formulario.get("assunto")?.value,
      conteudo: this.formulario.get("conteudo")?.value
    })
    this.formfoiEnviado = true

    setInterval(() => {
      this.TopicoFoiAnalisado = true
    }, 3000)
  }

  ngOnInit(): void {
    this.formulario = new FormGroup({
      assunto: new FormControl(""),
      conteudo: new FormControl(""),
    })
  } // pega dados do form group
}
