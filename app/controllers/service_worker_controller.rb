class ServiceWorkerController < ApplicationController
    protect_from_forgery except: :service_worker

    def service_worker
      puts "SERVICE WORKER!"
    end

    def manifest
      puts "MANIFEST!"
    end
  end
