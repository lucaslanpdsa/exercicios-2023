import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-resumo',
  templateUrl: './resumo.component.html',
  styleUrls: ['./resumo.component.scss']
})
export class ResumoComponent implements OnInit {

  mostrarResumo: boolean = false //Quando for true o resumo sera expandido

  mostrarMais() {
    this.mostrarResumo = !this.mostrarResumo
  }

  constructor() { }

  ngOnInit(): void {
  }

}
