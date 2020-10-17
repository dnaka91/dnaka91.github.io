+++
title = "Projects"
slug = "projects"

[extra]
icon = "rocket"
no_reading_time = true
+++

## 📼 Findstream

[findstream_home]: https://findstream.dnaka91.rocks
[findstream_repo]: https://github.com/dnaka91/findstream

**[ 🦀 Rust • [Homepage][findstream_home] • [Repository][findstream_repo] ]**

Findstream is a better search for [Twitch](https://twitch.tv) that allows to search directly in
stream titles. This doesn't matter for specific games but is very helpful for variety categories
like _Art_ or _Science & Technology_ where many different kind of stream are grouped together in a
single category.

For example, you can search for _Rust_ in _Science & Technology_ with this project, allowing you to
filter within the category itself which Twitch doesn't support currently.

## 🗳 Veto

[veto_repo]: https://github.com/dnaka91/veto

**[ 🦀 Rust • [Repository][veto_repo] ]**

Veto is a log file based IP blocker that runs as a service on the system, tracks one or more log
files and blocks IPs based on the log lines and rules defined by the user.

I started with this project as I was using fail2ban previously but noticed during load tests that it
took about 60% of my server's CPU and I wanted something more lean and fast.

## 🧱 Ipwall

[ipwall_repo]: https://github.com/dnaka91/ipwall

**[ 🦀 Rust • [Repository][ipwall_repo] ]**

Ipwall is a very simple tool to download a selection of IP blacklists and apply them to your
_iptables/ipset_ rules. It uses the [FireHOL](https://iplists.firehol.org/) level 1-3 blacklists but
can be configured to include additional lists as well.

It is meant as a companion to [Veto](#ballot-box-veto) to apply common bad IP blocks in addition to
the dynamic blocking of it.

<!--
## 🌋 Crator

[crator_home]: https://crator.dnaka91.rocks
[crator_repo]: https://github.com/dnaka91/crator

**[ 🦀 Rust • [Homepage][crator_home] • [Repository][crator_repo] ]**
-->

## Amelio

[amelio_home]: https://amelio.dnaka91.rocks
[amelio_repo]: https://github.com/dnaka91/amelio

**[ 🦀 Rust • [Homepage][amelio_home] • [Repository][amelio_repo] ]**

Amelio is a group project for the IUBH University in Germany. It is a ticket system that helps to
report and track errors in study media.

<!--
## ⏱️ Chronver

[chronver_home]: https://chronver.org
[chronver_repo]: https://github.com/dnaka91/chronver

**[ 🦀 Rust • [Homepage][chronver_home] • [Repository][chronver_repo] ]**
-->

<!--
## MarkDown Publisher

[mdpub_home]: https://mdpub.dnaka91.rocks.com
[mdpub_repo]: https://github.com/dnaka91/mdpub

**[ 🦀 Rust • [Homepage][mdpub_home] • [Repository][mdpub_repo] ]**

**M**ark**D**own **Pub**lisher (mdpub for short) helps republishing articles of personal blogs on
different Markdown based logging platforms. It takes single Markdown files which contains the a
post, then updates all links and lastly publishes the article again on Medium or dev.to or on both.

This is a helpful tool for anyone who wants to publish posts on their own website but still want to
get effects of publishing on other platforms to become more known.
-->

## CRC Check

[crccheck_repo]: https://github.com/dnaka91/crccheck-rs

**[ 🦀 Rust • [Repository][crccheck_repo] ]**

CRC Check is a tool to validate CRC32 hashsum within file names. It scans the current directory for
any files that contain a hash, calculates the hash from their content and compares both hashes to
verify the content wasn't modified.

It optionally can update the hash if it doesn't match.

## BeatFly

[beatfly_repo]: https://github.com/dnaka91/beatfly

**[ 🤖 Android/Kotlin • [Repository][beatfly_repo] ]**

BeatFly is a university project that showcases an application for a radio station. It doesn't have
a server to communicate with, so it emulates one acting like a fully working app. Main features
include playing music (obviously) and reviewing and wishing songs.

This app uses the latest Android features (at time of creation) and is completely written in
🍵 Kotlin. Among the used libraries are AndroidX, Dagger, Moshi, Glide and others.

<!--
## Reciply

[reciply_repo]: https://github.com/dnaka91/reciply

**[ 🤖 Android • [Repository][reciply_repo] ]**
-->
