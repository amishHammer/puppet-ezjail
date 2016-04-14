require 'puppet'

Puppet::Type.type(:jail).provide :ezjail do
    confine :operatingsystem => [:freebsd]
    defaultfor :operatingsystem => [:freebsd]
    commands    :ezjail_admin   => "/usr/local/bin/ezjail-admin",
                :ezjail         => "/usr/local/etc/rc.d/ezjail"

    def self.jails
        jaillist = ezjail_admin('list').split("\n")
        jails = {}


        jaillist.drop(2).each do |jail|
            jail.chomp!
            props = jail.split(/ +/)
            jails[props[3]] = {
                :ipaddress => props[2],
                :root => props[4],
                :imagetype => props[0][0]
            }
            if props[1] == "N/A" then
                jails[props[3]][:jid] = nil
            else
                jails[props[3]][:jid] = props[1]
            end
            if props[0][1] == "R" then
                jails[props[3]][:running] = true
            else
                jails[props[3]][:running] = false
            end
        end
        return jails
    end

    def create
        if @resource[:flavour].nil?
            ezjail_admin([
                'create',
                "#{@resource[:hostname]}",
                "#{@resource[:ipaddress]}",
            ])
        else
            ezjail_admin([
                'create',
                '-f', "#{@resource[:flavour]}",
                "#{@resource[:hostname]}",
                "#{@resource[:ipaddress]}",
            ])
        end
    end

    def destroy
        ezjail_admin([
            'delete',
            '-wf',
            "#{@resource[:hostname]}"
        ])
    end

    def running
        if ! self.class.jails.include? @resource[:name]
            create
        end
        if ! self.class.jails[@resource[:name]][:running]
            ezjail([
                'start',
                @resource[:name]
            ])
        end
    end

    def stopped
        if ! self.class.jails.include? @resource[:name]
            create
        end
        if self.class.jails[@resource[:name]][:running]
            ezjail([
                'stop',
                @resource[:name]
            ])
        end
    end

    def exists?
        return self.class.jails.include? @resource[:name]
    end
end
