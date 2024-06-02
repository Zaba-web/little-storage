ARG USER=thevlang

FROM ${USER}/vlang:alpine-build AS builder

WORKDIR /opt/vlang

RUN git clone --depth 1 https://github.com/vlang/v /opt/vlang && make VFLAGS='-cc gcc' && v -version

FROM ${USER}/vlang:alpine-base AS runtime

ENV VFLAGS="-cc gcc"

RUN apk --no-cache add \
    gcc musl-dev git libc-dev postgresql-dev

COPY --from=builder /opt/vlang /opt/vlang

WORKDIR /appcode

COPY . .

EXPOSE 4000

RUN v install

ENTRYPOINT ["v", "run", "/appcode/src/"]
