# Use the official Solr image as the base image
FROM solr:9.0

# Set the container name
ENV container_name solr1e

# Expose the ports
EXPOSE 8981

# Set the environment variables
ENV ZK_HOST zoo1:2181

# Set the ZooKeeper configuration
RUN echo "metricsProvider.className=org.apache.zookeeper.metrics.prometheus.PrometheusMetricsProvider metricsProvider.httpPort=7000 metricsProvider.exportJvmInfo=true" >> /opt/solr/server/etc/zoo.cfg

# Start Solr in SolrCloud mode
CMD ["solr-precreate", "mycollection", "/opt/solr/server/solr/configsets/_default"]
CMD ["solr-cloud", "-s", "solr1e:8983"]