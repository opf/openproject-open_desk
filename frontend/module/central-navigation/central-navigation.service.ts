import { IApplicationGroup } from 'core-app/features/plugins/linked/openproject-souvap/central-navigation/central-navigation.model';
import { shareReplay } from 'rxjs/operators';
import { TopMenuService } from 'core-app/core/top-menu/top-menu.service';
import { Injectable } from '@angular/core';
import { PathHelperService } from 'core-app/core/path-helper/path-helper.service';
import { HttpClient } from '@angular/common/http';

@Injectable({ providedIn: 'root' })
export class CentralNavigationService {
  private url = this.pathHelper.api.v3.apiV3Base + '/linked_applications';

  navigationGroups$ = this
    .http
    .get<IApplicationGroup[]>(this.url)
    .pipe(
      shareReplay(1),
    );

  constructor(
    private topMenuService:TopMenuService,
    private pathHelper:PathHelperService,
    private http:HttpClient,
  ) {}
}
