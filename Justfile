_default:
    @just --list --unsorted

# Install additional tools
setup:
    cargo install --git https://github.com/getzola/zola.git --tag v0.15.3
    cargo install lychee

# Build the website
build:
    zola build
    lychee public/**/*.{html,css,js,xml}
