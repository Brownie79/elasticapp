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
json = JSON.parse(File.read('1.json'))
#pp json
pp client.create    index: 'codes',
                    type:  'technology',
                    body:   json

def add_document(document)
    response = client.create    index:          'codes',
                                type:           doc.type,        
                                title:          doc.title,
                                year:           doc.year,
                                institution:    doc.institution,
                                contributor:    doc.contributor,
                                code_versions:  doc.code_versions,
                                date_publish:   doc.date_publised,
                                ecc_date:       doc.ecc_date,
                                author_site:    doc.author_site,
                                url_code:       doc.orig_url,
                                description:    doc.description,
                                notes:          doc.notes,
                                doi:            doc.doi,
                                copyright:      doc.copyright,
                                topics:         doc.topics,
                                fields:         doc.fields
    return response
end