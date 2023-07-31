---
date: 2023-07-30 23:23:32
title: Allow VPN clients to access Unbound DNS
translationKey: allow-vpn-clients-to-access-unbound-dns
---

[OPNSense](https://docs.opnsense.org/) comes with built-in support for [OpenVPN](https://docs.opnsense.org/manual/vpnet.html#openvpn-ssl-vpn). To set it up I followed this [great guide](https://homenetworkguy.com/how-to/configure-openvpn-opnsense/) from Home Network Guy. 

In addition to the guide, I realized that I needed to add a firewall rule to OpenVPN, to access _any_ website. To achieve this, I simply added a new rule in the `Firewall > Rules > OpenVPN` menu, allowing _any_ source to _any_ destination. Since my usage of OpenVPN is similar to my LAN network, this firewall rule serves my purpose well. That roughly translates to;

_Any source (who has credentials my OpenVPN server), coming through the OpenVPN interface, can access any destination_

However, even with this firewall rule in place, I still couldn't access my custom resources in my home network using their DNS aliases defined in the Unbound DNS service of OPNsense. Although specifying their full IP addresses worked, I prefer using DNS aliases for convenience.

To resolve this issue, I realized that I needed to add a DNS Server in the OpenVPN server setup (which could have been done during the initial setup), and add OpenVPN tunnel network to access list of Unbound DNS.

Here's what I did:

1. Under `VPN > OpenVPN > Servers`, I clicked edit to my only server.
2. In the client settings, I checked the box for `DNS Servers` and entered `192.168.1.1` as `Server #1:`. I also checked `Force DNS cache update` and `Prevent DNS leaks`, even though they seem more relevant to Windows clients. 
3. Under `Services > Unbound DNS > Access Lists` menu, I clicked add to add a new access rule. I entered `10.0.0.0` as Network, and 24 as CIDR. I gave `openvpn` as Access List Name, and `10.0.0.0/24` as Description to see the purpose of this rule in the listing menu.

After applying all changes, I now also can access all my DNS aliases while I am on VPN.