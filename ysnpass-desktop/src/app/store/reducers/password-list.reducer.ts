import { createReducer, on } from '@ngrx/store';
import * as PasswordListActions from '../actions/password-list.actions';

export interface PasswordEntry {
  name: string;
  user: string;
  password: string;
}

export const initialPasswordList = [];

export const passwordListReducer = createReducer(
  initialPasswordList,
  on(
    PasswordListActions.addPassword,
    (state: PasswordEntry[], { passwordEntry }) => [...state, passwordEntry]
  )
);
