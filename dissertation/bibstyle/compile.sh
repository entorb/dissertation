#!/bin/bash
latex TM-DDD-URL.dbj
rm TM-DDD-URL.log
cp TM-DDD-URL.bst TM-DDD-URL.bst.gen
# "URL " nicht mehr vor Links schreiben
sed -i -e 's/{URL }/{}/g' TM-DDD-URL.bst
# "\providecommand{\urlprefix}{URL }"