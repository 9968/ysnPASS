import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { PasswordFormDialogComponent } from 'src/app/password-form-dialog/password-form-dialog/password-form-dialog.component';
import { PasswordEntry } from 'src/app/store/reducers/password-list.reducer';
import { selectPasswordList } from 'src/app/store/selectors/password-list.selectors';
import * as PasswordListActions from '../../store/actions/password-list.actions';

@Component({
  selector: 'ysnpass-password-list',
  templateUrl: './password-list.component.html',
  styleUrls: ['./password-list.component.css'],
})
export class PasswordListComponent implements OnInit {
  constructor(private store: Store, private dialog: MatDialog) {}

  passwordList$: Observable<PasswordEntry[]>;

  ngOnInit(): void {
    this.passwordList$ = this.store.select(selectPasswordList);
  }

  addPassword(): void {
    const dialogRef = this.dialog.open(PasswordFormDialogComponent);
    dialogRef.afterClosed().subscribe((passwordEntry: PasswordEntry) => {
      this.store.dispatch(
        PasswordListActions.addPassword({
          passwordEntry,
        })
      );
    });
  }
}
