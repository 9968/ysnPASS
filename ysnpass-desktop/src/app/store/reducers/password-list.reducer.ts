import { createReducer, on } from '@ngrx/store';
import * as PasswordListActions from '../actions/password-list.actions';

export interface PasswordEntry {
  name: string;
  user: string;
  password: string;
}

export const initialPasswordList = [
  { name: 'name1', user: 'user1', password: 'savepassword123' },
];

export const passwordListReducer = createReducer(
  initialPasswordList,
  on(
    PasswordListActions.addPassword,
    (state: PasswordEntry[], { passwordEntry }) => [...state, passwordEntry]
  )
);
