[![CI](https://github.com/maestro-org/maestro-api-specifications/actions/workflows/postman.yml/badge.svg)](https://github.com/maestro-org/maestro-api-specifications/actions/workflows/postman.yml)

# Maestro API Specifications

This repository contains a collection of OpenAPI specifications for various Maestro API services. These specifications define the structure, endpoints, and data models for interacting with Maestro's blockchain-related APIs.

## Overview

Maestro provides a suite of APIs for blockchain services across multiple chains, including Bitcoin, Cardano, Dogecoin, and Midnight. Each API is documented using the OpenAPI standard, ensuring clarity and consistency for developers.

## API Documentation Viewer

You can explore all Maestro OpenAPI specifications using Swagger UI at:

🔗 [https://swagger.gomaestro.org/](https://swagger.gomaestro.org/)

This viewer supports switching between multiple chains/specs. Simply authorize the service with your [Maestro API key](https://dashboard.gomaestro.org) to begin testing out the endpoints.

## Postman Workspace

All OpenAPI specifications in this repository are published to the public [Maestro Postman Workspace](https://www.postman.com/go-maestro/maestro-api/overview). Developers can explore, test, and integrate with Maestro APIs directly from Postman.

## Structure

The repository is organized by blockchain and service:

-   **Bitcoin**
    -   Blockchain Indexer API
    -   Event Manager API
    -   Market Price API
    -   Mempool Monitoring API
    -   Node RPC API
-   **Cardano**
    -   Blockchain Indexer API
    -   Managed Contracts API
    -   Market Price API
    -   Transaction Manager API
-   **Dogecoin**
    -   Blockchain Indexer API
    -   Node RPC API
-   **Midnight**
    -   Indexer GraphQL API

Each service's OpenAPI specification is located in its respective directory.

## Merged Specifications and MCP Server

For each chain, OpenAPI specifications have been merged using [openapi-merge-cli](https://www.npmjs.com/package/openapi-merge-cli).
For example, specifications for Bitcoin can be merged using:

```
npx openapi-merge-cli --config bitcoin/merged/merge-config.json
```

The merged specification is then used to generate the [Maestro MCP Server](https://github.com/maestro-org/maestro-mcp-server) using [openapi-mcp-generator](https://github.com/harsha-iiiv/openapi-mcp-generator):

```
npx openapi-mcp-generator --input bitcoin/merged/openapi-merged.json --output /PATH/TO/maestro-mcp-server --force --transport streamable-http --port 3000
```

## License

This repository is licensed under the [Apache 2.0 License](LICENSE).
