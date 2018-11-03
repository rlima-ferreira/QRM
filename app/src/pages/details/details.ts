import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

@IonicPage()
@Component({
  selector: 'page-details',
  templateUrl: 'details.html',
})
export class DetailsPage {

  private pet:string = 'user';

  constructor(public navCtrl: NavController, public navParams: NavParams) {
  }

  private goBack() {
    this.navCtrl.pop();
  }

}
