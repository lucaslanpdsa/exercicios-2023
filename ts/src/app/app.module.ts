import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { SideBarComponent } from './components/side-bar/side-bar.component';
import { CabecalhoComponent } from './components/cabecalho/cabecalho.component';
import { CorpoComponent } from './components/corpo/corpo.component';
import { ResumoComponent } from './components/resumo/resumo.component';
import { RodapeComponent } from './components/rodape/rodape.component';
import { DiscussoesComponent } from './components/discussoes/discussoes.component';


@NgModule({
  declarations: [
    AppComponent,
    SideBarComponent,
    CabecalhoComponent,
    CorpoComponent,
    ResumoComponent,
    RodapeComponent,
    DiscussoesComponent,
  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
