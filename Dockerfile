# Base image -> https://github.com/runpod/containers/blob/main/official-templates/base/Dockerfile
# DockerHub -> https://hub.docker.com/r/runpod/base/tags
# Builder image ->
FROM python:3.11-slim-buster as builder

ARG WRK_DIR=/app
WORKDIR ${WRK_DIR}

# Copy dependencies and download model script
COPY builder/requirements.txt /requirements.txt
COPY /builder/download_model.py /download_model.py

# Create virtual environment
ENV VIRTUAL_ENV=/${WRK_DIR}
RUN python3.11 -m venv ${WRK_DIR}
ENV PATH="${WRK_DIR}/bin:$PATH"
ENV UV_HTTP_TIMEOUT=600

# Install dependencies
RUN python3.11 -m pip install uv && python3.11 -m uv pip install --no-cache-dir -r /requirements.txt 
RUN python3.11 /download_model.py

# Final image ->
FROM runpod/base:0.4.0-cuda11.8.0
COPY --from=builder /app/models/phi2/ /models/phi2/
COPY --from=builder /app/lib/python3.11/site-packages/ ./
ADD src .

CMD python3.11 -u /handler.py
