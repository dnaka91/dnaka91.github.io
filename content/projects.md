+++
title = "Projects"
slug = "projects"
description = """
These are all my publicly available projects, categorized by their kind. They are not in any specific order. Feel free to try them out, and if you find any issues, please open an issue on the respective issue tracker.
"""

[extra]
icon = "rocket-launch"
no_reading_time = true
toc = true
+++

<!-- markdownlint-disable link-fragments no-bare-urls no-inline-html -->

## 📦 Libraries

Software libraries that can be used by others (mostly Rust crates).

<div class="xl:grid grid-cols-2 gap-x-4">
{% project(
    name="chronver",
    emoji="⏰",
    license="MIT",
    ci="CI",
    crate=true
) %}
    chronver
{% end %}

{% project(
    name="obws",
    emoji="🕹️",
    license="MIT",
    ci="CI",
    crate=true,
    coverage=true
) %}
    obws
{% end %}

{% project(
    name="unidirs",
    emoji="🗃",
    license="MIT",
    ci="CI",
    crate=true
) %}
    unidirs
{% end %}
</div>

## 🚀 Servers

Server components that can be run locally or hosted somewhere.

<div class="xl:grid grid-cols-2 gap-x-4">
{% project(
    name="asgard",
    emoji="🌋",
    license="AGPL-3.0",
    homepage="https://asgard.dnaka91.rocks",
    ci="CI"
) %}
    asgard
{% end %}

{% project(
    name="findstream",
    emoji="📼",
    license="AGPL-3.0",
    homepage="https://findstream.dnaka91.rocks",
    ci="CI"
) %}

Findstream is a better search for [Twitch](https://twitch.tv) that allows to search directly in
stream titles. This doesn't matter for specific games but is very helpful for variety categories
like _Art_ or _Science & Technology_ where many different kind of stream are grouped together in a
single category.

For example, you can search for _Rust_ in _Science & Technology_ with this project, allowing you to
filter within the category itself which Twitch doesn't support currently.

{% end %}

{% project(
    name="marmalade",
    emoji="🍞",
    license="AGPL-3.0",
    homepage="https://marmalade.dnaka91.rocks",
    ci="CI"
) %}
    marmalade
{% end %}
</div>

## 🧰 Tools

Utility applications, mostly for the command line.

<div class="xl:grid grid-cols-2 gap-x-4">
{% project(
    name="cargo-hatch",
    emoji="🐣",
    license="AGPL-3.0"
) %}
    cargo-hatch
{% end %}

{% project(
    name="ipwall",
    emoji="🧱",
    license="AGPL-3.0",
    ci="CI"
) %}

Ipwall is a very simple tool to download a selection of IP blacklists and apply them to your
_iptables/ipset_ rules. It uses the [FireHOL](https://iplists.firehol.org/) level 1-3 blacklists but
can be configured to include additional lists as well.

It is meant as a companion to [Veto](#ballot-box-veto) to apply common bad IP blocks in addition to
the dynamic blocking of it.

{% end %}

{% project(
    name="otti",
    emoji="🦦",
    license="AGPL-3.0",
    ci="CI"
) %}
    otti
{% end %}

{% project(
    name="twitchat",
    emoji="🗨",
    license="AGPL-3.0",
    homepage="https://dnaka91.github.io/twitchat",
    ci="CI"
) %}
    twitchat
{% end %}

{% project(
    name="veto",
    emoji="🗳",
    license="AGPL-3.0",
    ci="CI"
) %}

Veto is a log file based IP blocker that runs as a service on the system, tracks one or more log
files and blocks IPs based on the log lines and rules defined by the user.

I started with this project as I was using fail2ban previously but noticed during load tests that it
took about 60% of my server's CPU and I wanted something more lean and fast.

{% end %}

{% project(
    name="wholesum",
    emoji="🥧",
    license="AGPL-3.0",
    ci="CI"
) %}
    wholesum
{% end %}
</div>

## 🤖 Bots

Chat bots, usually for **Discord**.

<div class="xl:grid grid-cols-2 gap-x-4">
{% project(
    name="octolicious",
    emoji="🍭",
    license="AGPL-3.0",
    ci="CI"
) %}
    octolicious
{% end %}

{% project(
    name="togglebot",
    emoji="🤖",
    license="AGPL-3.0",
    ci="CI"
) %}
    togglebot
{% end %}
</div>

## 🫖 Others

Pretty much anything else that doesn't fit into the other categories.

<div class="xl:grid grid-cols-2 gap-x-4">
{% project(
    name="amelio",
    emoji="",
    license="AGPL-3.0",
    homepage="https://amelio.dnaka91.rocks",
    branch="master",
    ci="CI",
    ci_branch="master"
) %}

Amelio is a group project for the IUBH University in Germany. It is a ticket system that helps to
report and track errors in study media.

{% end %}

{% project(
    name="beatfly",
    emoji="",
    license="AGPL-3.0",
    branch="master"
) %}

BeatFly is a university project that showcases an application for a radio station. It doesn't have
a server to communicate with, so it emulates one acting like a fully working app. Main features
include playing music (obviously) and reviewing and wishing songs.

This app uses the latest Android features (at time of creation) and is completely written in
🍵 Kotlin. Among the used libraries are AndroidX, Dagger, Moshi, Glide and others.

{% end %}
</div>
