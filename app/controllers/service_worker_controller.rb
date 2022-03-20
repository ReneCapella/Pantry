class ServiceWorkerController < ApplicationController
    protect_from_forgery except: :service_worker

    def service_worker
      puts "service worker"
    end

    def manifest
      puts "manifest"
    end
  end
