FROM nginx:mainline-alpine

# These can be overridden at runtime
ENV SPEC_REPO=https://github.com/matrix-org/matrix-doc.git
RUN SPEC_FETCH=master
ENV SPEC_BRANCH=master

RUN apk add --no-cache git python py-pip dos2unix

COPY build-spec.sh /build-spec.sh
RUN dos2unix /build-spec.sh

EXPOSE 80
ENTRYPOINT [ "/build-spec.sh" ]
