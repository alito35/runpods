FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

# 1. Upgrade build tools
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# 2. Upgrade PyTorch to 2.5+ to satisfy transformers dependencies
RUN pip install --no-cache-dir torch==2.5.1 --index-url https://download.pytorch.org/whl/cu124

# 3. Install vLLM and huggingface_hub
RUN pip install --no-cache-dir \
    vllm==0.6.3 \
    huggingface_hub

# 4. Optional: Flashinfer pre-built wheel
RUN pip install --no-cache-dir flashinfer-python -i https://flashinfer.ai/whl/cu124/torch2.5/ || true

ENV PYTHONUNBUFFERED=1






