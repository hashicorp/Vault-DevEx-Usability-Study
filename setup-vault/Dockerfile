# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

FROM vault:latest

COPY entrypoint.sh /vault/entrypoint.sh

EXPOSE 8200

ENTRYPOINT [ "/vault/entrypoint.sh" ]