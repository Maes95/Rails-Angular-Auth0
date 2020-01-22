import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { User } from '../models/User'

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  exists?(): Observable<boolean> {
    return this.http.get<boolean>("/api/users/exists");
  }

  index(id:number):Observable<User[]> {
    return this.http.get<User[]>(`/api/users/`);
  }

  get(id:number):Observable<User> {
    return this.http.get<User>(`/api/users/${id}`);
  }

  me():Observable<User> {
    return this.http.get<User>("/api/users/me");
  }

  create(user:User):Observable<User> {
    return this.http.post<User>("/api/users/",user);
  }

}
