require 'pagy/extras/array'
require 'pagy/extras/headers'
require 'pagy/extras/overflow'

Pagy::DEFAULT[:items]    = 10
Pagy::DEFAULT[:overflow] = :last_page
Pagy::DEFAULT[:size]  = [1,4,4,1]
