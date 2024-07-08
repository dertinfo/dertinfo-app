import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/authentication/auth.service';

@Component({
  selector: 'app-silent',
  templateUrl: './silent.page.html',
  styleUrls: ['./silent.page.scss']
})
export class SilentPage {

  constructor(private authService: AuthService) {
    this.authService.parseSilentResponse();
  }

}
