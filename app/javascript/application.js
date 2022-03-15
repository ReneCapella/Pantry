// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require popper
//= require bootstrap
import "@hotwired/turbo-rails"
import "controllers"

window.addEventListener('load', () => {
  navigator.serviceWorker.register('/service-worker.js')
  .then(registration => {
    console.log('ServiceWorker registered: ', registration)
  });
});
