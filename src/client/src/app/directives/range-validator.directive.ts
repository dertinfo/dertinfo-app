import { Directive, forwardRef } from '@angular/core';
import { AbstractControl, FormControl, NG_VALIDATORS, Validator, ValidatorFn } from '@angular/forms';

function validateRangeFactory(minValue: number, maxValue: number) {

    return (c: FormControl) => {

        // prepare the return
        const isValid = c.value >= minValue && c.value <= maxValue;

        return isValid ? null : {
            validateRange: {
                valid: false
            }
        };
    };
}


@Directive({
    selector: '[validateRange][formControlName],[validateRange][formControl],[validateRange][ngModel]',
    providers: [
        { provide: NG_VALIDATORS, useExisting: forwardRef(() => RangeValidator), multi: true }
    ]
})
export class RangeValidator implements Validator {

    validatorFunction: ValidatorFn;

    initValidationFunction(rangeMin: number, rangeMax: number) {
        this.validatorFunction = validateRangeFactory(rangeMin, rangeMax);
    }

    validate(c: AbstractControl) {
        return this.validatorFunction(c);
    }


}



