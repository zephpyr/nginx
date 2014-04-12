#
# Cookbook Name:: nginx
#
define :nginx_app, :template => 'nginx_app.conf.erb', :local => false, :enable => true do

    application_name = params[:name]

    include_recipe 'nginx::default'

    template "#{node['nginx']['dir']}/sites-available/#{application_name}.conf" do
        source params[:template]
        local params[:local]
        owner 'root'
        group 'root'
        mode 0644
        cookbook params[:cookbook] if params[:cookbook]
        variables(
            :application_name => application_name,
            :params           => params
        )
        if ::File.exists?("#{node['nginx']['dir']}/sites-available/#{application_name}.conf")
            notifies :reload, resources(:service => "nginx")
        end
    end

    site_enabled = params[:enabled]
    nginx_site "#{params[:name]}.conf" do
        enable site_enabled
    end

end