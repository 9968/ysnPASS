import { createReducer, on } from '@ngrx/store';
import * as PasswordListActions from '../actions/password-list.actions';
import { v4 } from 'uuid';

export class PasswordEntry {
  id = v4();
  name = '';
  user = '';
  password = '';
  constructor(data?: PasswordEntry) {
    Object.assign(this, data);
  }
}

export const initialPasswordList = [];

export const passwordListReducer = createReducer(
  initialPasswordList,
  on(
    PasswordListActions.addPassword,
    (state: PasswordEntry[], { passwordEntry }) => [...state, passwordEntry]
  ),
  on(
    PasswordListActions.deletePassword,
    // filter is better for <100 items after that splice becomes better
    (state: PasswordEntry[], { passwordId }) =>
      state.filter((password) => password.id !== passwordId)
  ),
  on(
    PasswordListActions.editPassword,
    (state: PasswordEntry[], { passwordEntry }) => {
      const newState = [...state];
      const idx = newState.findIndex(
        (entry: PasswordEntry) => entry.id === passwordEntry.id
      );
      newState[idx] = passwordEntry;
      return newState;
    }
  )
);
