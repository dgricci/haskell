## Dockerfile for a haskell environment
## Cf. https://github.com/freebroccolo/docker-haskell/blob/master/8.2/Dockerfile
FROM       dgricci/jessie:0.0.4
MAINTAINER Didier Richard <didier.richard@ign.fr>

## different versions - use argument when defined otherwise use defaults
ARG CABAL_VERSION
ENV CABAL_VERSION   ${CABAL_VERSION:-2.2}
ARG GHC_VERSION
ENV GHC_VERSION     ${GHC_VERSION:-8.4.2}
ARG HAPPY_VERSION
ENV HAPPY_VERSION   ${HAPPY_VERSION:-1.19.5}
ARG ALEX_VERSION
ENV ALEX_VERSION    ${ALEX_VERSION:-3.1.7}

RUN \
    echo 'deb http://ppa.launchpad.net/hvr/ghc/ubuntu trusty main' > /etc/apt/sources.list.d/ghc.list && \
    # hvr keys - Cf. https://launchpad.net/~hvr/+archive/ubuntu/ghc?field.series_filter=trusty
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F6F88286 && \
    apt-get -qy update && \
    apt-get -qy --no-install-suggests --no-install-recommends install \
        cabal-install-$CABAL_VERSION \
        ghc-$GHC_VERSION \
        happy-$HAPPY_VERSION \
        alex-$ALEX_VERSION && \
    rm -rf /var/lib/apt/lists/*

ENV PATH /root/.cabal/bin:/root/.local/bin:/opt/cabal/$CABAL_VERSION/bin:/opt/ghc/$GHC_VERSION/bin:/opt/happy/$HAPPY_VERSION/bin:/opt/alex/$ALEX_VERSION/bin:$PATH

## run ghci by default unless a command is specified
CMD ["ghci"]

