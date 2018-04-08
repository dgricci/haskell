% Environnement Haskell pour pandoc  
% Didier Richard  
% 12/03/2017

---

revision:
    - 0.0.1 : 10/07/2016  
    - 0.0.2 : 10/08/2016  
    - 0.0.3 : 10/09/2016  
    - 0.0.4 : 20/10/2016  
    - 0.0.5 : 08/04/2018  

---

# Building #

```bash
$ docker build -t dgricci/haskell:$(< VERSION) .
$ docker tag dgricci/haskell:$(< VERSION) dgricci/haskell:latest
```

## Behind a proxy (e.g. 10.0.4.2:3128) ##

```bash
$ docker build \
    --build-arg http_proxy=http://10.0.4.2:3128/ \
    --build-arg https_proxy=http://10.0.4.2:3128/ \
    -t dgricci/haskell:$(< VERSION) .
$ docker tag dgricci/haskell:$(< VERSION) dgricci/haskell:latest
```

## Build command with arguments default values ##

```bash
$ docker build \
    --build-arg CABAL_VERSION=2.2 --build-arg GHC_VERSION=8.4.2 \
    --build-arg HAPPY_VERSION=1.19.5 --build-arg ALEX_VERSION=3.1.7 \
    -t dgricci/haskell:$(< VERSION) .
$ docker tag dgricci/haskell:$(< VERSION) dgricci/haskell:latest
```

# Use #

See `dgricci/jessie` README for handling permissions with dockers volumes.

```bash
$ docker run -it --rm -e USER_ID=$UID -e USER_NAME=$USER dgricci/haskell:$(< VERSION)
GHCi, version 8.4.1.20180329: http://www.haskell.org/ghc/  :? for help
Prelude> :quit
Leaving GHCi.
```

__Et voilà !__


_fin du document[^pandoc_gen]_

[^pandoc_gen]: document généré via $ `pandoc -V fontsize=10pt -V geometry:"top=2cm, bottom=2cm, left=1cm, right=1cm" -s -N --toc -o haskell.pdf README.md`{.bash}
