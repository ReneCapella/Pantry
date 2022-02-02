class ServiceWorkerController < ApplicationController
    protect_from_forgery except: :service_worker
   
    def service_worker
        puts "Hey..."
    end
   
    def manifest
    end
  end