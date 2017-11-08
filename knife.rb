current_dir = File.dirname(__FILE__)
log_level                 :info
log_location              STDOUT
node_name                 "chefadmin"
client_key                "#{current_dir}/chefadmin.pem"
chef_server_url           "https://ec2-35-164-35-44.us-west-2.compute.amazonaws.com/organizations/chefinc"
cookbook_path             ["#{current_dir}"]
