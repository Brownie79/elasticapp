require 'elasticsearch' #gem install elasticsearch for the plugin

#Instantiate a basic user with READ ONLY permissions
#Admin user must be logged in using method
#configuration specifying host ip, port, user/pass, can have multiple hosts if elastic search has multiple nodes
client = Elasticsearch::Client.new hosts: [
    {   
        host: 'ecc.ideashop.iit.edu',
        port: '8085', #should be remapped to 9200
        user: 'development',
        password: 'eccdev', #insecure, switch to SHELL VARIABLES on upgrade
        scheme: 'https'    
    }]
