# Use the official Solr image as the base image
FROM solr:9.0

# Set the container name
ENV container_name solr1e

# Expose the ports
EXPOSE 8981

# Set the environment variables
ENV ZK_HOST zoo1:2181

# Start Solr in SolrCloud mode
CMD ["solr", "create_core", "-c", "mycollection", "-d", "_default"]
CMD ["solr", "cloud", "-h", "solr1e", "-p", "8983"]