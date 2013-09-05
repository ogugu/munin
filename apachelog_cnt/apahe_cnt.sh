#!/bin/sh

#%# family=auto
#%# capabilities=autoconf

if [ "$1" = "autoconf" ]; then
 echo yes
 exit 0
fi

if [ "$1" = "config" ] ; then
 echo "graph_args -r --lower-limit 0 ";
 echo "graph_title http access count(mjmj)";
 echo "graph_category http_cnt";
 echo "graph_info http count";
 echo 'graph_vlabel rows'

 echo "count.label access_cnt"
 echo "count.draw AREA"
 echo "count.type GAUGE"
 exit
fi

CNT=0
TIME=`date +"%H:%M"`

DATE1=`date --date '1 days ago' +"%Y%m"`
DATE2=`date --date '1 days ago' +"%Y%m%d"`

if [ $TIME == "05:00" ]; then
  CNT=`less /var/log/httpd/80/${DATE1}/mj-mj_mogame/access_log.${DATE2}.gz |wc -l`
fi

echo -n "count.value $CNT"