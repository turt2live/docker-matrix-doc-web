FROM nginx:mainline-alpine

# These can be overridden at runtime
ENV SPEC_REPO=https://github.com/matrix-org/matrix-doc.git
RUN SPEC_FETCH=master
ENV SPEC_BRANCH=master

RUN apk add --no-cache git python3 python3-dev dos2unix \
    && python3 -m ensurepip \
    && pip3 install --no-cache-dir --upgrade --force-reinstall pip \
    && pip3 install --upgrade pip setuptools

RUN cd /usr/bin \
  && ln -sf easy_install-3 easy_install \
  && ln -sf idle3 idle \
  && ln -sf pydoc3 pydoc \
  && ln -sf python3 python \
  && ln -sf python3-config python-config \
  && ln -sf pip3 pip

COPY build-spec.sh /build-spec.sh
RUN dos2unix /build-spec.sh && chmod +x /build-spec.sh

EXPOSE 80
ENTRYPOINT [ "/build-spec.sh" ]
