FROM kong:2.2.1-alpine

COPY kong.conf /etc/kong/

USER root

COPY ./plugins/jwt-authorizer /custom-plugins/jwt-authorizer

WORKDIR /custom-plugins/jwt-authorizer

RUN luarocks make

USER kong
