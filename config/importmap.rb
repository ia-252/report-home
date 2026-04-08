# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.js"

pin "bootstrap" # @5.3.3


pin "bootstrap", to: "bootstrap.min.js", preload: true


