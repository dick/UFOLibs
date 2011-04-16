require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
require './lib/partials.rb'
require './main.rb'
run Main
