// Angular
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ILogger } from '../providers/diagnostics/logger';
import { Observable } from 'rxjs';

// Application
import { GroupDto } from '../models/dto';
import { ConfigurationService } from './configuration.service';

@Injectable()
export class GroupService {

    constructor(private _logger: ILogger, private _authHttp: HttpClient, private _configurationService: ConfigurationService) {
        this._logger.trace('GroupService - constructor ', ['GroupService']);
    }

    getGroups(): Observable<GroupDto[]> {
        this._logger.trace('GroupService - getGroups', ['GroupService']);

        const url = this._configurationService.baseApiUrl + '/group';
        return this._authHttp.get(url) as Observable<GroupDto[]>;
    }

    private handleError(error: Response | any) {
        this._logger.trace('GroupService - handleError ', ['GroupService']);
        // In a real world app, we might use a remote logging infrastructure
        let errMsg: string;
        if (error instanceof Response) {
            const body = error.json() || '';
            const err = body || JSON.stringify(body);
            errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
        } else {
            errMsg = error.message ? error.message : error.toString();
        }
        console.error(errMsg);
        return Observable.throw(errMsg);
    }
}
