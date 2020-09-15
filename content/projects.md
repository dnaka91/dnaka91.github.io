+++
title = "Projects"
slug = "projects"

[extra]
icon = "rocket"
no_reading_time = true
+++

## MarkDown Publisher

[mdpub_home]: https://mdpub.netlify.com
[mdpub_repo]: https://github.com/dnaka91/mdpub

**[ 🦀 Rust <!-- • [Homepage][mdpub_home] • [Repository][mdpub_repo] --> ]**

**M**ark**D**own **Pub**lisher (mdpub for short) helps republishing articles of personal blogs on
different Markdown based logging platforms. It takes single Markdown files which contains the a
post, then updates all links and lastly publishes the article again on Medium or dev.to or on both.

This is a helpful tool for anyone who wants to publish posts on their own website but still want to
get effects of publishing on other platforms to become more known.

## Senstate - Rust client

[senstate_repo]: https://github.com/dnaka91/senstate-rs
[senstate_crate]: https://crates.io/crates/senstate
[senstate_docs]: https://docs.rs/senstate/0.0.1/senstate/

**[ 🦀 Rust • [Repository][senstate_repo] • [Crate][senstate_crate] • [Docs][senstate_docs] ]**

[Senstate](https://github.com/senstate/platform) is a debugging dashboard build by a friend of
mine. To support his project and also to strengthen my Rust skills, I'm building the client library
for this project.

## Senstate - Go client

[senstate_go_repo]: https://github.com/dnaka91/senstate-go
[senstate_go_docs]: https://godoc.org/github.com/dnaka91/senstate-go

**[ 🐹 Go • [Repository][senstate_go_repo] • [Docs][senstate_go_docs] ]**

Similar to the [rust client](#senstate-rust-client), this is the client library (but for Go) to
connect and use the [Senstate](https://github.com/senstate/platform) debugging dashboard. It is
a little more advanced than the rust version, as I'm stronger in Go currently and is likely to
receive updates first.

## CRC Check

[crccheck_repo]: https://github.com/dnaka91/crccheck

**[ 🐹 Go • [Repository][crccheck_repo] ]**

CRC Check is a tool to validate CRC32 hashsum within file names. It scans the current directory for
any files that contain a hash, calculates the hash from their content and compares both hashes to
verify the content wasn't modified.

It optionally can update the hash if it doesn't match.

## BeatFly

[beatfly_repo]: https://github.com/dnaka91/beatfly

**[ 🤖 Android • [Repository][beatfly_repo] ]**

BeatFly is a university project that showcases an application for a radio station. It doesn't have
a server to communicate with, so it emulates one acting like a fully working app. Main features
include playing music (obviously) and reviewing and wishing songs.

This app uses the latest Android features (at time of creation) and is completely written in
🍵 Kotlin. Among the used libraries are AndroidX, Dagger, Moshi, Glide and others.
