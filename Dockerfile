# Start from RunPod's official PyTorch base
FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

# Install fixed versions of vLLM and FlashInfer
RUN pip install --no-cache-dir \
    vllm==0.6.3 \
    flashinfer-python \
    huggingface_hub

# Set environment defaults
ENV PYTHONUNBUFFERED=1
