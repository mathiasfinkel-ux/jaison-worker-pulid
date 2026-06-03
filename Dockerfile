FROM runpod/worker-comfyui:5.8.5-base

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/lldacing/ComfyUI_PuLID_Flux_ll.git && \
    pip install --no-cache-dir --timeout=120 --retries=10 -r ComfyUI_PuLID_Flux_ll/requirements.txt && \
    pip install --no-cache-dir --timeout=120 --retries=10 facenet-pytorch --no-deps && \
    rm -rf /root/.cache /tmp/*
