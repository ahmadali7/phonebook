// alert();

$('.new_phone').on('click', function(e) {
  e.preventDefault();
  // e.stopPropagation();
  alert();
})

$('.phone_form').on('submit', function(e) {
  e.preventDefault();
  e.stopPropagation();
  // debugger;
  $this = $(this)
  $.ajax({
    url: '/phones',
    data: $this.serialize(),
    type: 'post',
    success: function(response) {
      // debugger;
      $('.all_phone').append(response);
      $this.trigger('reset');
    },
    error: function(error) {
      alert('an error occured')
    }
  })
})

function update_button (e) {
  e.preventDefault();
  e.stopPropagation();
  // debugger;
  $this = $(this)
  fields = $this.siblings().find('input')
  phone_number = $(fields[0]).value()
  name = $(fields[1]).value()
  $.ajax({
    url: '/phones',
    data: {
      phone_number,
      name,
    },
    type: 'put',
    success: function(response) {
      // debugger;
      $('.all_phone').append(response);
      $this.trigger('reset');
    },
    error: function(error) {
      alert('an error occured')
    }
  })
}
// $('.update_phone').on('click', function(e) {
//   e.preventDefault();
//   e.stopPropagation();
//   // debugger;
//   $this = $(this)
//   fields = $this.siblings().find('input')
//   phone_number = $(fields[0]).value()
//   name = $(fields[1]).value()
//   $.ajax({
//     url: '/phones',
//     data: {
//       phone_number,
//       name,
//     },
//     type: 'put',
//     success: function(response) {
//       // debugger;
//       $('.all_phone').append(response);
//       $this.trigger('reset');
//     },
//     error: function(error) {
//       alert('an error occured')
//     }
//   })
// })
// $('.edit_phone').on('click', function(e) {
//   e.preventDefault();

//   $(this).parent().parent().html("<%= escape_javascript(render partial: 'phone', locals: { phone: phone } ) %>");

//   // e.stopPropagation();
//   // alert();
// })
