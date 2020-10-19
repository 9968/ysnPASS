import { Component, OnInit } from '@angular/core';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { PasswordEntry } from 'src/app/store/reducers/password-list.reducer';
import { selectPasswordList } from 'src/app/store/selectors/password-list.selectors';
import * as PasswordListActions from '../../store/actions/password-list.actions';

@Component({
  selector: 'ysnpass-password-list',
  templateUrl: './password-list.component.html',
  styleUrls: ['./password-list.component.css'],
})
export class PasswordListComponent implements OnInit {
  constructor(private readonly store: Store) {}

  passwordList$: Observable<PasswordEntry[]>;

  ngOnInit(): void {
    this.passwordList$ = this.store.select(selectPasswordList);
  }

  addPassword(): void {
    this.passwordList$.subscribe((list) => console.log(list));
    this.store.dispatch(
      PasswordListActions.addPassword({
        passwordEntry: { user: 'user2', name: 'name2', password: 'password2' },
      })
    );
  }
}
