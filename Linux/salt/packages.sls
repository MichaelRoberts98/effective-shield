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