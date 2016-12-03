#!/usr/bin/ruby

dhcp = File.readlines("/Library/Preferences/VMware\ Fusion/vmnet8/dhcpd.conf")
index_end_of = dhcp.find_index { |line| line.include? "End of" }
dhcp = dhcp.drop(index_end_of + 1)
dhcp = dhcp.join
dhcp = dhcp.gsub(/(\s|\n)+/, "")
dhcp = dhcp.split("host").drop(1)

def host_to_hash(host)
	host_hash = {}
	host_arr = host.split(/{|(hardwareethernet|;|fixed-address)/).values_at(0, 3, 7)
	host_hash[:name], host_hash[:mac], host_hash[:ip] = host_arr
	host_hash
end

dhcp_conf = dhcp.map { |host| host_to_hash(host) }

def write_mac_to_vmx(file, mac)
	old_contents = File.read(file)
	new_contents = old_contents.gsub(/ethernet0.address = \"([0-9A-Z]{2}:){5}[0-9A-Z]{2}\"/, "ethernet0.address = \"#{mac}\"")

	File.open(file, "w") do |f|
		f.write(new_contents)
	end
end

dhcp_conf.each do |host|
	file = "/Users/dewet/vm/#{host[:name]}.vmwarevm/#{host[:name]}.vmx"
	mac = host[:mac]
	write_mac_to_vmx(file, mac) if File.file?(file)
end
