import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'ysnpass-password-list',
  templateUrl: './password-list.component.html',
  styleUrls: ['./password-list.component.css'],
})
export class PasswordListComponent implements OnInit {
  constructor() {}

  passwordList = [{ name: 'name', user: 'user', password: 'password' }];

  ngOnInit(): void {}
}
