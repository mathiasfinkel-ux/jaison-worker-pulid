FROM runpod/worker-comfyui:5.8.5-base

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/lldacing/ComfyUI_PuLID_Flux_ll.git && \
    pip install --no-cache-dir --timeout=120 --retries=10 -r ComfyUI_PuLID_Flux_ll/requirements.txt && \
    pip install --no-cache-dir --timeout=120 --retries=10 facenet-pytorch --no-deps && \
    rm -rf /root/.cache /tmp/*

RUN printf 'comfyui:\n  base_path: /runpod-volume/models/\n  checkpoints: diffusion_models/\n  vae: vae/\n  clip: clip/\n  text_encoders: clip/\n  clip_vision: clip_vision/\n  unet: diffusion_models/\n  diffusion_models: diffusion_models/\n  loras: loras/\n  controlnet: controlnet/\n  upscale_models: upscale_models/\n  embeddings: embeddings/\n  pulid: pulid/\n  insightface: insightface/\n  facexlib: facexlib/\n' > /comfyui/extra_model_paths.yaml
# rebuild
# rebuild
