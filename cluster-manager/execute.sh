#!/bin/bash

set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Minikube if not installed
if ! command_exists minikube; then
    echo "Minikube not found. Installing Minikube..."
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube /usr/local/bin/
    rm minikube
fi

# Install kubectl if not installed
if ! command_exists kubectl; then
    echo "kubectl not found. Installing kubectl..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install kubectl /usr/local/bin/
    rm kubectl
fi

# Start Minikube
echo "Starting Minikube..."
minikube start

# Create namespace 'bashaway'
echo "Creating namespace 'bashaway'..."
kubectl create namespace bashaway 
