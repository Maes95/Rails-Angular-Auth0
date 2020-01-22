import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/auth/auth.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  profileJson: string = null;

  constructor(public auth: AuthService, private userService:UserService) { }

  ngOnInit() {
    this.userService.me().subscribe((user)=>{
      this.profileJson = JSON.stringify(user, null, 2)
    })
  }

}
