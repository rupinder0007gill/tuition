window.show_notifications = function() {
  // Notification element
  const _notification = $('.notice_notification');

  // Notification icon
  const _nIcon = $('.notice_notification__icon');

  // Notification title
  const _nTitle = $('.notice_notification__title');

  // Notification text
  const _nText = $('.notice_notification__text');

  // Notification button
  const _button = $('.notice_notification__button');


  // Notification button click
  _button.click(function(event) {
    event.preventDefault();
    _notification.removeClass('-open');
  });
  // Get the color
  let _status; let _text = '';

  if (pageMessages.getAttribute('data-alert').length) {
    _status = '-danger';
    _text = pageMessages.getAttribute('data-alert');
  } else if (pageMessages.getAttribute('data-notice').length) {
    _status = '-info';
    _text = pageMessages.getAttribute('data-notice');
  }

  // Check if status found
  if (typeof _status == 'undefined' || !_status.length) {
    return;
  }

  // Check if open
  const _open = _notification.hasClass('-open');

  // Remove all classes besides the notification class
  _notification.attr('class', 'notice_notification' + (_open ? ' -open' : ''));

  // Add the status
  _notification.addClass(_status);

  // Change text
  let _title; let _buttonText; let _icon;

  switch (_status) {
    case '-warning':
      _title = 'Invalid data provided';
      _buttonText = 'Let\'s fix it';
      _icon = 'fas fa-exclamation-triangle';
      break;
    case '-danger':
      _title = 'Oh snap!';
      _buttonText = 'Dismiss';
      _icon = 'fas fa-exclamation-circle';
      break;
    case '-info':
      _title = 'Hey there!';
      _buttonText = 'Got it!';
      _icon = 'fas fa-info-circle';
      break;
    case '-success':
      _title = 'Success!';
      _buttonText = 'Thank you!';
      _icon = 'far fa-check-circle';
      break;
  }

  _nTitle.text(_title);
  _nText.text(_text);
  _button.text(_buttonText);

  _nIcon.attr('class', 'notice_notification__icon ' + _icon);

  $(this).addClass('-active');
  autoOpen(300);
}

// Auto open notification
function autoOpen($ms = 2000) {
  setTimeout(function() {
    // Notification element
    const _notification = $('.notice_notification');
    _notification.addClass('-open');
    autoClose();
  }, $ms);
}

// Auto open notification
function autoClose($ms = 4000) {
  setTimeout(function() {
    // Notification element
    const _notification = $('.notice_notification');
    _notification.removeClass('-open');
  }, $ms);
}

$(document).on('turbolinks:load', function() {
  window.show_notifications();
});