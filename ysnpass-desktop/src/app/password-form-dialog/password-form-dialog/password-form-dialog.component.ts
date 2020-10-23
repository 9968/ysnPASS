import { Component, Inject } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { PasswordEntry } from 'src/app/store/reducers/password-list.reducer';

@Component({
  selector: 'ysnpass-password-form-dialog',
  templateUrl: './password-form-dialog.component.html',
  styleUrls: ['./password-form-dialog.component.css'],
})
export class PasswordFormDialogComponent {
  passwordForm: FormGroup;
  constructor(
    private dialogRef: MatDialogRef<PasswordFormDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: PasswordEntry,
    fb: FormBuilder
  ) {
    this.passwordForm = fb.group({
      name: new FormControl(data.name),
      user: new FormControl(data.user),
      password: new FormControl(data.password),
    });
  }

  onSubmit(): void {
    this.dialogRef.close({ ...this.data, ...this.passwordForm.value });
  }
  onCancel(): void {
    this.dialogRef.close();
  }
}
