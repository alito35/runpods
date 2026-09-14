FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

# Install base dependencies
RUN pip install --no-cache-dir \
    vllm==0.6.3 \
    huggingface_hub

# Install pre-built flashinfer wheel without compiling from source
RUN pip install --no-cache-dir flashinfer-python -i https://flashinfer.ai/whl/cu124/torch2.4/ --no-build-isolation || true

ENV PYTHONUNBUFFERED=1

