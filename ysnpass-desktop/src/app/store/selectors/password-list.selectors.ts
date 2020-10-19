import { AppState } from '../reducers/app-state.reducers';

export const selectPasswordList = (state: AppState) => {
  return state.passwordList;
};
