// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails


//import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
import "@rails/actioncable";
//require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//= require jquery_ujs

console.log('Script loaded'); // スクリプトが読み込まれたことを確認
//= require jquery3
//= require popper
//= require bootstrap
import * as bootstrap from "bootstrap"
