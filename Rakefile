# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'
Bundler.require
require 'bubble-wrap/all'
require 'motion-testflight'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'rollstream gxs demo'
  app.redgreen_style = :full
  app.icons << 'agent.png'
  app.testflight.sdk = 'vendor/TestFlight'
  app.testflight.api_token = '677253bbe52b2527c01c27650b22cef2_Njc3MzcxMjAxMi0xMC0xNCAyMzoyODoyNi4yNzQ4MzE'
  app.testflight.team_token = 'e1210cb1e1ed7a56b7790c6ba9c5d1af_MTQzMTk0MjAxMi0xMC0xNCAyMzozNDo0Ni45MzY5NzM'
  app.frameworks << 'AddressBook'
end
