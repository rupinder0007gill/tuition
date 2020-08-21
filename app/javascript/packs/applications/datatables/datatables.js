require('datatables.net-bs4')(window, $);

// Global setting and initializer

$.extend($.fn.dataTable.defaults, {
  responsive: true,
  pagingType: 'full',
  serverSide: true
});

// turbolinks cache fix
$(document).on('turbolinks:before-cache', function() {
  let dataTable = $($.fn.dataTable.tables(true)).DataTable();
  if (dataTable !== null) {
    dataTable.clear();
    dataTable.destroy();
    return dataTable = null;
  }
});
