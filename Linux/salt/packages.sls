install ebtables:
   pkg.installed:
      - name: ebtables

install jq:
   pkg.installed:
      - name: jq

install vim:
   pkg.installed:
      - name: vim

remove cron:
   pkg.removed:
      - pkgs: ["cron", "crond", "cronie", "fcron"]

update all packages:
   pkg.uptodate:
      - refresh: true

fetch osquery from master:
  file.managed:
   {% if grains.os_family == 'RedHat' %}
      - name: /root/osquery_pkg
      - source: salt://osquery.rpm
   {% elif grains.os_family == 'Debian' %}
      - name: /root/osquery_pkg
      - source: salt://osquery.deb
   {% endif %}

install osquery:
   pkg.installed:
      - sources:
         - local_pkg: /root/osquery_pkg

osqueryd:
   service.running: 
      - enable: true