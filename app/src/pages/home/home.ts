import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';

import { ScannerPage } from '../scanner/scanner';
import { UserProvider } from '../../providers/user/user';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  private email:string;
  private paswword:string;

  constructor(private navCtrl: NavController, private userProvider: UserProvider) {
  }

  private signIn() {
    // let data = JSON.stringify({email: this.email, password: this.paswword});
    // this.userProvider.post(data);
    this.navCtrl.setRoot(ScannerPage);
  }
}
