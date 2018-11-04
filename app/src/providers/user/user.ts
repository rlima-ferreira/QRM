import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable()
export class UserProvider {

  constructor(private http: HttpClient) {
  }

  public async post(user) {
    let url:string = 'http://192.168.242.225/QRM/site/api/validalogin.php';
    let resp = await this.http.post(url, user);
    console.log(resp);
  }

  public async get(user) {
    let url:string = '';
    let resp = await this.http.post(url, user);
    console.log(resp);
  }

}
