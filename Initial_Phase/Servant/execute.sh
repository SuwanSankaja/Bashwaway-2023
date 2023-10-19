#!/bin/bash

# Check the operating system
if [[ "$OSTYPE" == "msys" ]]; then
  # Windows (using Azure Storage Emulator)
  echo "Running Azure Storage Emulator on port 12000..."
  AzureStorageEmulator.exe start
else
  # Non-Windows (using Azurite)
  echo "Running Azurite on port 12000..."
  azurite-blob -l ~/azurite-data -p 12000
fi