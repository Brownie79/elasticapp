#!/usr/bin/env ruby
require 'elasticsearch' #gem install elasticsearch for the plugin
require 'json'
require 'pp'

#Instantiate a basic user with READ ONLY permissions
#Admin user must be logged in using method
#configuration specifying host ip, port, user/pass, can have multiple hosts if elastic search has multiple nodes
=begin
client = Elasticsearch::Client.new hosts: [
    {   
        host: 'localhost',
        port: '9200', #should be remapped to 9200
        user: 'development',
        password: 'eccdev', #insecure, switch to SHELL VARIABLES on upgrade
        scheme: 'https'    
    }]
=end
client = Elasticsearch::Client.new hosts: [
    {   
        host: 'ecc.ideashop.iit.edu',
        port: '8085', #should be remapped to 9200
        user: 'development',
        password: 'eccdev', #insecure, switch to SHELL VARIABLES on upgrade
        scheme: 'http'    
    }]

#response = client.perform_request 'GET', '_cluster/health'
pp client.perform_request 'GET', '_cluster/health'
 

#read input files to put into the server
json = JSON.parse(File.read('0.json'))
#pp json
pp client.create    index: 'codes',
                    type:  'technology',
                    body:   json,
                    id:     1

