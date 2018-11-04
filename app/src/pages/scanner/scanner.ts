import { Component } from '@angular/core';
import { NavController, NavParams } from 'ionic-angular';
import { BarcodeScanner } from '@ionic-native/barcode-scanner';

import { DetailsPage } from '../details/details';
import { HomePage } from '../home/home';

/**
 * Generated class for the ScannerPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@Component({
  selector: 'page-scanner',
  templateUrl: 'scanner.html',
})
export class ScannerPage {

  constructor(public navCtrl: NavController, public navParams: NavParams, private barcode:BarcodeScanner) {
  }

  private scan() {
    // this.barcode.scan().then((result) => {
    //   this.navCtrl.push(DetailsPage, { result: result })
    // });
    this.navCtrl.push(DetailsPage)
  }

  private logout() {
    this.navCtrl.setRoot(HomePage);
  }

}
