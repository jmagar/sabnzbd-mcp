#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

echo "SABnzbd MCP Service: Initializing..."

# Validate required environment variables
if [ -z "$SABNZBD_URL" ]; then
    echo "Error: SABNZBD_URL environment variable is required"
    exit 1
fi

if [ -z "$SABNZBD_API_KEY" ]; then
    echo "Error: SABNZBD_API_KEY environment variable is required"
    exit 1
fi

# Set defaults for MCP server configuration
export SABNZBD_MCP_HOST=${SABNZBD_MCP_HOST:-"0.0.0.0"}
export SABNZBD_MCP_PORT=${SABNZBD_MCP_PORT:-"9152"}
export SABNZBD_MCP_TRANSPORT=${SABNZBD_MCP_TRANSPORT:-"sse"}
export SABNZBD_LOG_LEVEL=${SABNZBD_LOG_LEVEL:-"INFO"}

echo "SABnzbd MCP Service: Configuration validated"
echo "  - SABNZBD_URL: $SABNZBD_URL"
echo "  - SABNZBD_API_KEY: ***SET***"
echo "  - MCP_HOST: $SABNZBD_MCP_HOST"
echo "  - MCP_PORT: $SABNZBD_MCP_PORT"
echo "  - MCP_TRANSPORT: $SABNZBD_MCP_TRANSPORT"
echo "  - LOG_LEVEL: $SABNZBD_LOG_LEVEL"

# Change to app directory (important for relative path handling)
cd /app

echo "SABnzbd MCP Service: Starting server..."
exec python3 sabnzbd-mcp-server.py 