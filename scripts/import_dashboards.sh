echo "[+]  Import all Kibana Dashboards."
for f in $(find /kibana/dashboards/ -name *.ndjson); do
    echo "[+]  Import: $f"
    curl -s -H 'kbn-xsrf: true' --form file=@${f} http://elastic:$ELASTIC_PASSWORD@kibana:$KIBANA_PORT/api/saved_objects/_import?overwrite=true;
done

echo "[+]  Import all Searches."
for f in $(find /kibana/searches/ -name *.ndjson); do
    echo "[+]  Import: $f"
    curl -s -H 'kbn-xsrf: true' --form file=@${f} http://elastic:$ELASTIC_PASSWORD@kibana:$KIBANA_PORT/api/saved_objects/_import?overwrite=true;
done

echo "[+]  All done."