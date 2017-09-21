avahi-packages:
  pkg.installed:
    - pkgs:
      - avahi
      - nss-mdns

/etc/nsswitch.conf:
  file.replace:
    - pattern: '(?!mdns_minimal )resolve'
    - repl: 'mdns_minimal resolve'
