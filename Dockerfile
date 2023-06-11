# Get latest stable coreOS container
from quay.io/fedora/fedora-coreos:stable

# Installation configuration through rpm-ostree
RUN cd /etc/yum.repos.d/ && curl -LO https://pkgs.tailscale.com/stable/fedora/tailscale.repo && \
  rpm-ostree install tailscale && rpm-ostree cleanup -m && \
  systemctl enable tailscaled && \
  ostree container commit 
