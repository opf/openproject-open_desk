import {
  ChangeDetectionStrategy,
  Component,
  ElementRef,
  HostBinding,
} from '@angular/core';
import { TopMenuService } from 'core-app/core/top-menu/top-menu.service';
import {
  catchError,
  map,
} from 'rxjs/operators';
import { CentralNavigationService } from 'core-app/features/plugins/linked/openproject-souvap/central-navigation/central-navigation.service';
import {
  DomSanitizer,
  SafeUrl,
} from '@angular/platform-browser';
import { I18nService } from 'core-app/core/i18n/i18n.service';

export const souvapCentralNavigationSelector = 'op-souvap-central-navigation';

@Component({
  selector: souvapCentralNavigationSelector,
  templateUrl: './central-navigation.component.html',
  styleUrls: ['./central-navigation.component.sass'],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class CentralNavigationComponent {
  @HostBinding('class.op-souvap-navigation') className = true;

  text = {
    error: this.I18n.t('js.souvap.central_navigation.loading_error'),
  };

  active$ = this
    .topMenuService
    .activeDropdown$()
    .pipe(
      map((el) => el?.contains(this.elementRef.nativeElement)),
    );

  navigationGroups$ = this.centralNavigationService.navigationGroups$;

  loadingError$ = this.centralNavigationService.loadingError$;

  constructor(
    private topMenuService:TopMenuService,
    private elementRef:ElementRef,
    private centralNavigationService:CentralNavigationService,
    private sanitizer:DomSanitizer,
    private I18n:I18nService,
  ) {}

  iconURL(url:string):SafeUrl {
    return this.sanitizer.bypassSecurityTrustUrl(url);
  }
}
