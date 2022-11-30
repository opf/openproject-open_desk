import {
  ChangeDetectionStrategy,
  Component,
  ElementRef,
  HostBinding,
} from '@angular/core';
import { TopMenuService } from 'core-app/core/top-menu/top-menu.service';
import { map } from 'rxjs/operators';
import { CentralNavigationService } from 'core-app/features/plugins/linked/openproject-souvap/central-navigation/central-navigation.service';
import {
  DomSanitizer,
  SafeUrl,
} from '@angular/platform-browser';

export const souvapCentralNavigationSelector = 'op-souvap-central-navigation';

@Component({
  selector: souvapCentralNavigationSelector,
  templateUrl: './central-navigation.component.html',
  styleUrls: ['./central-navigation.component.sass'],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class CentralNavigationComponent {
  @HostBinding('class.op-souvap-navigation') className = true;

  text:string;

  active$ = this
    .topMenuService
    .activeDropdown$()
    .pipe(
      map((el) => el?.contains(this.elementRef.nativeElement)),
    );

  navigationGroups$ = this.centralNavigationService.navigationGroups$;

  constructor(
    private topMenuService:TopMenuService,
    private elementRef:ElementRef,
    private centralNavigationService:CentralNavigationService,
    private sanitizer:DomSanitizer,
  ) {}

  iconURL(url:string):SafeUrl {
    return this.sanitizer.bypassSecurityTrustUrl(url);
  }
}
