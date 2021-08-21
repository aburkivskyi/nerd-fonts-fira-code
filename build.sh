TERMUX_PKG_HOMEPAGE=https://github.com/ryanoasis/nerd-fonts
TERMUX_PKG_DESCRIPTION="Patched font Fira (Fura) Code from the nerd-fonts library"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.1.0
TERMUX_PKG_SRCURL=(https://github.com/ryanoasis/nerd-fonts/releases/download/v${TERMUX_PKG_VERSION}/FiraCode.zip
    https://github.com/ryanoasis/nerd-fonts/raw/v${TERMUX_PKG_VERSION}/LICENSE)
TERMUX_PKG_SHA256=(0b410b02ffb07a36a10459ff44f93438
    1b95f7668f3a4440b0d404e8dc3ccd9c)
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_post_get_source() {
    # find "${TERMUX_PKG_SRCDIR}" -name "*Windows Compatible*"
    find "." -iname "*Windows Compatible*" \
        -exec rm {} \;
}

termux_step_make_install() {
    install -d "${TERMUX_PREFIX}/share/fonts/OTF"
    install -d "${TERMUX_PREFIX}/share/fonts/TTF"
    find  "."  -iname  "*.otf" -exec \
        install -Dm644 {} "${TERMUX_PREFIX}/share/fonts/OTF/{}" \;
    find  "."  -iname  "*.ttf" -execdir \
        install -Dm644 {} /"${TERMUX_PREFIX}/share/fonts/TTF/{}" \;
}

termux_step_install_license() {
    install -Dm644 \
        -t "${TERMUX_PREFIX}/share/licenses/nerd-fonts" \
            "LICENSE"
}

