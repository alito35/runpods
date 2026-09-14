FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

# Upgrade build tools so pip can parse wheel metadata properly
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# Install vLLM and huggingface_hub using extra index fallback for PyTorch/CUDA wheels
RUN pip install --no-cache-dir \
    vllm==0.6.3 \
    huggingface_hub \
    --extra-index-url https://download.pytorch.org/whl/cu124

# Optional: Install flashinfer if needed without compiling from source
RUN pip install --no-cache-dir flashinfer-python -i https://flashinfer.ai/whl/cu124/torch2.4/ || true

ENV PYTHONUNBUFFERED=1




