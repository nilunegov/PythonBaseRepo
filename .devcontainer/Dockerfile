# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/devcontainers/python:3.13-bookworm

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

USER root

ENV LANG=ru_RU.UTF-8 \
    LC_ALL=ru_RU.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    UV_PROJECT_ENVIRONMENT=/opt/python/venv \
    UV_CACHE_DIR=/opt/python/uv-cache \
    PATH="/opt/python/venv/bin:$PATH"

RUN rm -f /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    tzdata \
    locales \
    ca-certificates \
    curl \
    && sed -i 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen \
    && ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && echo "Europe/Moscow" > /etc/timezone \
    && update-ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /opt/python/venv /opt/python/uv-cache \
    && chown -R vscode:vscode /opt/python

USER vscode
