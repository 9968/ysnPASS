import { createAction, props } from '@ngrx/store';
import { PasswordEntry } from '../reducers/password-list.reducer';

export const addPassword = createAction(
  '[Password List] Add Password',
  props<{ passwordEntry: PasswordEntry }>()
);
export const deletePassword = createAction(
  '[Password List] Delete Password',
  props<{ passwordId: string }>()
);
export const editPassword = createAction(
  '[Password List] Edit Password',
  props<{ passwordEntry: PasswordEntry }>()
);
export const setPasswords = createAction(
  '[Password List] Set Passwords',
  props<{ passwordEntries: PasswordEntry[] }>()
);
