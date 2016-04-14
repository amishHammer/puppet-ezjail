# lib/puppet/type/jail.rb
Puppet::Type.newtype(:jail) do
    @doc = "Create a new jail."
    ensurable do
        newvalue(:present) do
            provider.create
        end

        newvalue(:absent) do
            provider.destroy
        end

        newvalue(:running) do
            provider.running
        end

        newvalue(:stopped) do
            provider.stopped
        end
    end
    newparam(:hostname) do
        isnamevar
        desc "The hostname of the jail."
    end

    newparam(:ipaddress) do
        desc "The IP address of the jail."
    end

    newparam(:flavour) do
        desc "The flavour to use to create the jail."
    end

    autorequire(:anchor) do [ 'ezjail::end' ] end
end
