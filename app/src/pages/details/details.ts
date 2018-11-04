import { Component } from '@angular/core';
import { NavController, NavParams } from 'ionic-angular';

@Component({
  selector: 'page-details',
  templateUrl: 'details.html',
})
export class DetailsPage {

  constructor(private navCtrl: NavController, private navParams: NavParams) {
  }

  // ionViewCanEnter() {
  //   let data = this.navParams.get('result');
  // }

  private goBack() {
    this.navCtrl.pop();
  }

}
