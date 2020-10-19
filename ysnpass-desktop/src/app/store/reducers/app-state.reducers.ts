import { PasswordEntry, passwordListReducer } from './password-list.reducer';

export interface AppState {
  passwordList: PasswordEntry[];
}
export const appReducers = {
  passwordList: passwordListReducer,
};
