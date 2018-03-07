puts "Destroying all the quotes."

Quote.destroy_all

quote_attributes = [ 
  {
    supplier_name:       'Securitas',
    supplier_address:    'Potsdamer Straße 88 10785 Berlin',
    phone_number:         '030 5010000',
    price:                 nil,
    token:                 nil,
    request_id:            nil 
  },
  {
    supplier_name:       'Kötter Security',
    supplier_address:    'Friedrichstraße 95, 10117 Berlin',
    phone_number:         '030 28509011',
    price:                 nil,
    token:                 nil,
    request_id:            nil 
  },
  {
    supplier_name:       'GRAEF Information Technology',
    supplier_address:    'Eiswerderstrasse 20, 13585 Berlin',
    phone_number:         '030 69202294',
    price:                 nil,
    token:                 nil,
    request_id:            nil 
  },
  {
    supplier_name:        'Protection One',
    supplier_address:     'Holzhauser Str. 177, 13509 Berlin',
    phone_number:         '030 27004970',
    price:                 nil,
    token:                 nil,
    request_id:            nil 
  },
  {
    supplier_name:        'SOSCOM',
    supplier_address:     'Scharnweberstrasse 113, 13405 Berlin',
    phone_number:         '030 410300',
    price:                 nil,
    token:                 nil,
    request_id:            nil 
  }
]

Quote.create!(quote_attributes)

puts "Finished"
