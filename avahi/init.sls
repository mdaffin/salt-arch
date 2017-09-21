avahi-packages:
  pkg.installed:
    - pkgs:
      - avahi
      - nss-mdns

/etc/nsswitch.conf:
  file.replace:
    - pattern: '(?!mdns_minimal \[NOTFOUND=return\] )resolve'
    - repl: 'mdns_minimal [NOTFOUND=return] resolve'
