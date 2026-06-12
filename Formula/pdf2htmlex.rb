# pdf2htmlex — relocatable prebuilt native arm64 (Apple Silicon) darwin
# bundle of pdf2htmlEX 0.18.8.rc2 (poppler 24.06.1 + fontforge 20230101).
#
# This is a BINARY POUR, not a from-source build. The upstream pdf2htmlEX
# Homebrew formula has been broken/abandoned since 2019 and no maintained
# arm64 build exists. The bundle ships the binary plus every Homebrew dylib
# it needs, copied into lib/ with @executable_path-relative install names
# and ad-hoc re-signed — so it depends on no /opt/homebrew/* libraries at
# runtime (verified with `otool -L`: zero /opt/homebrew references across
# the binary and all bundled dylibs). That is why this formula declares no
# dylib `depends_on`.
#
# Source build recipe (provenance): the binary is produced by
# ~/dev/external/pdf2htmlEX_v2/native/build.sh (upstream pdf2htmlEX master,
# zero source patches, modern Homebrew deps), then relocated. See
# pdf_viewer ADR 0011 for the full rationale.
#
# Apple Silicon only. Intel Macs are not supported.
class Pdf2htmlex < Formula
  desc "Convert PDF to HTML without losing text or format (native arm64 build)"
  homepage "https://github.com/pdf2htmlEX/pdf2htmlEX"
  url "https://github.com/andersbekkevard/homebrew-tools/releases/download/pdf2htmlex-v0.18.8.rc2-1/pdf2htmlEX-0.18.8.rc2-arm64-darwin.tar.gz"
  version "0.18.8.rc2"
  sha256 "0c8d326511400863eb5eb9c1f013a194e349877b81b0ac0d1e76e81cc14095d5"
  license "GPL-3.0-or-later"

  # Prebuilt arm64 bundle only.
  depends_on arch: :arm64
  depends_on :macos

  def install
    # Tarball top-level dir is pdf2htmlEX/{bin,lib,share}.
    bin.install Dir["pdf2htmlEX/bin/*"]
    lib.install Dir["pdf2htmlEX/lib/*"]
    (share/"pdf2htmlEX").install Dir["pdf2htmlEX/share/pdf2htmlEX/*"]
  end

  test do
    assert_match "pdf2htmlEX version 0.18.8.rc2", shell_output("#{bin}/pdf2htmlEX --version 2>&1")
  end
end
