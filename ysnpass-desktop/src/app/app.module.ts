import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { StoreDevtoolsModule } from '@ngrx/store-devtools';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PasswordListComponent } from './password-list/password-list/password-list.component';
import { StoreModule } from '@ngrx/store';
import { appReducers } from './store/reducers/app-state.reducers';
import { environment } from '../environments/environment';
@NgModule({
  declarations: [AppComponent, PasswordListComponent],
  imports: [
    BrowserModule,
    AppRoutingModule,
    StoreModule.forRoot(appReducers, {}),
    StoreDevtoolsModule.instrument({
      maxAge: 25,
      logOnly: environment.production,
    }),
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
