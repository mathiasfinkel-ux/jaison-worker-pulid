FROM runpod/worker-comfyui:5.8.5-base

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/lldacing/ComfyUI_PuLID_Flux_ll.git && \
    pip install -r ComfyUI_PuLID_Flux_ll/requirements.txt && \
    pip install facenet-pytorch --no-deps
