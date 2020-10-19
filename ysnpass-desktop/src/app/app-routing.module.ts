import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PasswordListComponent } from './password-list/password-list/password-list.component';

const routes: Routes = [
  { path: '', component: PasswordListComponent, pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
