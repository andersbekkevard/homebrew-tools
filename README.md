# homebrew-tools

Personal [Homebrew](https://brew.sh) tap.

```sh
brew tap andersbekkevard/tools
brew install andersbekkevard/tools/pdf2htmlex
```

## Formulae

### `pdf2htmlex`

A **relocatable, prebuilt native arm64 (Apple Silicon) darwin** bundle of
[pdf2htmlEX](https://github.com/pdf2htmlEX/pdf2htmlEX) `0.18.8.rc2`
(poppler 24.06.1 + fontforge 20230101, statically linked; remaining
Homebrew dylibs bundled into `lib/` with `@executable_path`-relative
install names, so the binary needs no `/opt/homebrew/*` libraries at
runtime).

This is a **binary pour**, not a from-source build. The upstream
pdf2htmlEX Homebrew formula has been broken/abandoned since 2019 and no
maintained arm64 build exists; this tap ships one. The bundle is produced
from the native build recipe documented at
`~/dev/external/pdf2htmlEX_v2/native/build.sh` in the author's
environment, then relocated (dylibs bundled + install names rewritten +
ad-hoc re-signed).

Apple Silicon only (`arm64`). Intel Macs are not supported.
