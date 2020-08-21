import '@client-side-validations/client-side-validations';

window.ClientSideValidations.formBuilders['ActionView::Helpers::FormBuilder'] = {
    add: function(element, settings, message) {
        let form; let divErrorField;
        form = $(element[0].form);
        if (element.data('valid') !== false && (form.find('div.error-feedback.' + (element.attr('id')) + '_error')[0] == null)) {
            if (element.attr('autofocus')) {
                element.attr('autofocus', false);
            }
            element.removeClass('is-valid').addClass('is-invalid');
            divErrorField = $('<div class="error-feedback '+ element.attr('id') + '_error' +'">').insertAfter(element);
        } else {
            if (element.attr('autofocus')) {
                element.attr('autofocus', false);
            }
            divErrorField = $(form.find('div.error-feedback.' + (element.attr('id')) + '_error')[0]);
        }
        return divErrorField.addClass('invalid-feedback').text(message);
    },
    remove: function(element, settings) {
        let divErrorField;
        let form;
        form = $(element[0].form);
        divErrorField = form.find('div.error-feedback.' + (element.attr('id')) + '_error');
        if (divErrorField[0]) {
            element.removeClass('is-invalid').addClass('is-valid');
            return divErrorField.remove();
        }
    },
};
