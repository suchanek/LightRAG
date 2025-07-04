# LightRAG Core Concepts

This document outlines the fundamental concepts of the LightRAG project, based on the information provided in the `README.md` file.

## Overview

LightRAG is a system for **Simple and Fast Retrieval-Augmented Generation (RAG)**. It is designed to build knowledge graphs from various data sources and use them to answer queries.

## Key Features

- **Modular Storage:** LightRAG supports multiple storage backends for different components:
    - **KV Storage:** `JsonKVStorage`, `PGKVStorage`, `RedisKVStorage`, `MongoKVStorage`
    - **Vector Storage:** `NanoVectorDBStorage`, `PGVectorStorage`, `MilvusVectorDBStorage`, `ChromaVectorDBStorage`, `FaissVectorDBStorage`, `MongoVectorDBStorage`, `QdrantVectorDBStorage`
    - **Graph Storage:** `NetworkXStorage`, `Neo4JStorage`, `PGGraphStorage`, `AGEStorage`
- **LLM and Embedding Flexibility:** It can be integrated with various Large Language Models (LLMs) and embedding models, including:
    - OpenAI
    - Hugging Face
    - Ollama
    - LlamaIndex
- **LightRAG Server:** Provides a web UI and API for:
    - Document indexing
    - Knowledge graph exploration
    - RAG query interface
    - Ollama compatible interfaces
- **Multimodal Document Processing:** Integrates with `RAG-Anything` to handle various document formats like PDFs, Office documents, images, and extract structured content (text, tables, equations).
- **Knowledge Graph Management:** Offers comprehensive functionalities to manage the knowledge graph, including:
    - Creating, editing, and deleting entities and relations.
    - Merging multiple entities into a single one.
    - Inserting custom knowledge graphs.
- **Token Usage Tracking:** A `TokenTracker` tool is available to monitor and manage token consumption.
- **Data Export:** Supports exporting knowledge graph data to various formats like CSV, Excel, Markdown, and text.
- **Citation Support:** Can trace back information to its original source documents.

## Installation

LightRAG can be installed in two main ways:
1.  **From PyPI:** `pip install "lightrag-hku[api]"` for the server or `pip install lightrag-hku` for the core library.
2.  **From Source:** By cloning the repository and using `pip install -e ".[api]"` or `pip install -e .`.

Docker support is also available for easy deployment of the LightRAG server.

## Basic Usage

A typical workflow with LightRAG involves:
1.  **Initialization:** Creating a `LightRAG` instance and initializing its storage and pipeline status.
    ```python
    rag = LightRAG(...)
    await rag.initialize_storages()
    await initialize_pipeline_status()
    ```
2.  **Data Insertion:** Adding documents to the knowledge graph.
    ```python
    rag.insert("Your text here")
    ```
3.  **Querying:** Retrieving information using different modes.
    ```python
    await rag.query("Your question here?", param=QueryParam(mode="hybrid"))
    ```

## Querying

LightRAG offers several query modes controlled by the `QueryParam` class:
- `local`: Focuses on context-dependent information.
- `global`: Utilizes global knowledge.
- `hybrid`: Combines local and global retrieval.
- `naive`: Performs a basic search.
- `mix`: Integrates knowledge graph and vector retrieval.

The `QueryParam` class also allows for customization of the response format, conversation history, and other parameters.
