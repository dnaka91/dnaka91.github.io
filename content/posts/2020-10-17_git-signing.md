+++
title = "Create a Ed25519 GPG key with sub-keys for Git signing"
description = """
How to create a GPG key with Ed25519 elliptic curve and sub-keys for each of your device to sign
your Git commits.
"""

[taxonomies]
tags = ["gpg", "git", "github"]

[extra]
toc = true
image = "7BhTfoKsheQ"
+++

## Why signing

Why should you even sign your commits you might ask.

## GPG output bloat

The output of GPG contains a lot of bloat. For brevity and readability of this article they have
been truncated from the following instructions. The truncated messages are the following.

A version and license header appearing at the beginning of every output:

```txt
gpg (GnuPG/MacGPG2) 2.2.17; Copyright (C) 2019 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

During creation of the keys, GPG will output the following message one or more times:

```txt
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
```

## Create a new key

First of all we need to create a new basic GPG key. Also, we want to use ECC as it provides better
security and smaller key sizes. As the **Curve 25519** is still considered experimental in GPG, we
have to enter the `--expert` mode to be able to select it.

The command `--full-gen-key` tells the program that we want to select everything by hand instead of
using defaults.

```bash
gpg --expert --full-gen-key
```

First we are asked what kind of key we want. Here we select `9` as we want to use **ECC** for
signing as well as encryption.

```txt
Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
   (7) DSA (set your own capabilities)
   (8) RSA (set your own capabilities)
   (9) ECC and ECC
  (10) ECC (sign only)
  (11) ECC (set your own capabilities)
  (13) Existing key
Your selection? 9
```

Now we need to select which ECC curve we want to use. As mentioned before, we would like a key with
**Curve 25519** so we pick `1`.

```txt
Please select which elliptic curve you want:
   (1) Curve 25519
   (3) NIST P-256
   (4) NIST P-384
   (5) NIST P-521
   (6) Brainpool P-256
   (7) Brainpool P-384
   (8) Brainpool P-512
   (9) secp256k1
Your selection? 1
```

GPG keys usually have an expiration time. Of course we can also create a key without any expiration
time, although I can only recommend that if you export it to a flash drive or other offline media.

I personally pick **5 years** for my keys because it is a good balance between security and
convenience of updating the expiration from time to time.

```txt
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 5y
Key expires at Sun Oct 27 09:44:35 2024 JST
Is this correct? (y/N) y
```

As the last step creating our key, we have to provide our user ID. This is a combination of name,
email and an optional comment. As **name** you should put your full real name but if you really
want you can just pick a nickname or anything else. The **email** should be the same address that
you use for committing messages on **git**.
Lastly the **comment** is completely optional and I personally leave it empty in most cases.

After we filled out everything, we have the chance to update our information again or confirm with
`o` (that's the letter `O`, not the number `0`).

In this step GPG will ask us to provide a password for the new key to secure it. The password can
be left empty, but I strongly recommend to pick a good and strong password.

```txt
GnuPG needs to construct a user ID to identify your key.

Real name: Test user
Email address: test@example.com
Comment:
You selected this USER-ID:
    "Test user <test@example.com>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? o
```

After a short moment (ECC key generation is much quicker than for example RSA) the key is generated
and GPG prints out some information about our key.

This content provides a ton of information and we can verify our key was created as expected. At
this step I will not go into the details of this output. If you are interested in the meaning, you
can find plenty of articles.

```txt
gpg: key 77ADE9F988183CAE marked as ultimately trusted
gpg: revocation certificate stored as '/.../E84092ACA29DAFD0B8072DC277ADE9F988183CAE.rev'
public and secret key created and signed.

pub   ed25519 2019-10-29 [SC] [expires: 2024-10-27]
      713F3A6119BCB10CB40CC57CA4C47F5C36B4D9A4
uid                      Test user <test@example.com>
sub   cv25519 2019-10-29 [E] [expires: 2024-10-27]
```

With all these steps completed, we have our GPG key created with **ECC/Curve 25519** instead of the
**RSA** default. The key can already be used like this for signing with **Git** and uploaded to
**GitHub**.

As a further security measure it is recommended to add additional subkeys if you have more than one
device where you want to use the key.

## Add subkeys

Adding subkeys is a good measure to further secure your key. This is especially important when using
multiple devices. Consider you have 3 devices, one of it a smartphone, and your key is copied on all
of these. Then somebody steals your phone and may get access to its data.

Now your key may be in the hand of a thief and he can impersonate you wherever you use it. You need
to revoke your key as soon as possible. Now your identity is safe but you have to create a new key
completely from scratch. That means you would have multiple entries on the key servers and need to
replace your key on every machine.

With **subkeys** you don't have to do this. A subkey belong, as the name already suggests, to your
main key but can be shared to different devices individually. The goal is to create a subkey for
each device and copy only this key to the device. Then when the device is compromised, we can simply
revoke the single subkey but can continue to use the main key and other subkeys.

So lets get started and add some subkeys by using the `--edit-key` command. Copy the key ID from
the previous output and run the following command. Again we use the `--expert` mode to be able to
select **Curve 25519**.

```bash
gpg --expert --edit-key 713F3A6119BCB10CB40CC57CA4C47F5C36B4D9A4
```

GPG outputs some information about the key and changes into interactive mode. Here we can type
`help` at any time to get a list of available commands.

```txt
Secret key is available.

sec  ed25519/A4C47F5C36B4D9A4
     created: 2019-10-29  expires: 2024-10-27  usage: SC
     trust: ultimate      validity: ultimate
ssb  cv25519/2858AB2B62165AD8
     created: 2019-10-29  expires: 2024-10-27  usage: E
[ultimate] (1). Test user <test@example.com>

gpg>
```

We can add new subkeys with the `addkey` command, so lets do so.

```bash
gpg> addkey
```

Similar to when we were creating the main key, GPG asks us again what kind of key we want to create.
This time we have different options though. Interesting for us are the options `10` to `12`. We can
create keys for **sign only**, **encrypt only** or **set our own capabilities**.

We want to use this key mainly for commit signing in **Git** so we pick a **sign only** key with
number `10`.

```txt
Please select what kind of key you want:
   (3) DSA (sign only)
   (4) RSA (sign only)
   (5) Elgamal (encrypt only)
   (6) RSA (encrypt only)
   (7) DSA (set your own capabilities)
   (8) RSA (set your own capabilities)
  (10) ECC (sign only)
  (11) ECC (set your own capabilities)
  (12) ECC (encrypt only)
  (13) Existing key
Your selection? 10
```

Next we can pick the **curve** again and as we want to use **Curve 25519** we pick `1` here as well.

```txt
Please select which elliptic curve you want:
   (1) Curve 25519
   (3) NIST P-256
   (4) NIST P-384
   (5) NIST P-521
   (6) Brainpool P-256
   (7) Brainpool P-384
   (8) Brainpool P-512
   (9) secp256k1
Your selection? 1
```

Subkeys can have their own expiry date, independent of the main key. Again, I recommend 5 years for
the key for the same reasons as mentioned before. GPG tells us the exact expiration date and we
confirm with `y`.

```txt
Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0) 5y
Key expires at Sun Oct 27 09:49:56 2024 JST
Is this correct? (y/N) y
```

Lastly we are asked if we really want to create this additional key and confirm with `y`.

```txt
Really create? (y/N) y
```

Now the subkey is created and added. GPG prints us the current state of our key so we can verify
everything went well. The `usage: S` tells us that this key can only be used for **signing**.

```txt
sec  ed25519/A4C47F5C36B4D9A4
     created: 2019-10-29  expires: 2024-10-27  usage: SC
     trust: ultimate      validity: ultimate
ssb  cv25519/2858AB2B62165AD8
     created: 2019-10-29  expires: 2024-10-27  usage: E
ssb  ed25519/746FDF7E8D328496
     created: 2019-10-29  expires: 2024-10-27  usage: S
[ultimate] (1). Test user <test@example.com>

gpg>
```

Before we finish let's add another key by repeating the steps above. This is to showcase that a later step is working but you can add as many subkeys as you need.

```txt
sec  ed25519/A4C47F5C36B4D9A4
     created: 2019-10-29  expires: 2024-10-27  usage: SC
     trust: ultimate      validity: ultimate
ssb  cv25519/2858AB2B62165AD8
     created: 2019-10-29  expires: 2024-10-27  usage: E
ssb  ed25519/746FDF7E8D328496
     created: 2019-10-29  expires: 2024-10-27  usage: S
ssb  ed25519/D99E5215D40089AC
     created: 2019-10-29  expires: 2024-10-27  usage: S
[ultimate] (1). Test user <test@example.com>
```

Finally we need to save our key with the `save` command. Until now we only modified the key in
memory so we have to persist our changes to disk. If something went wrong and you don't want to
save your changes, you can cancel with the `quit` command instead.

```bash
gpg> save
```

With all the steps done we updated our key, now including several subkeys. But unfortunately we are
not done yet.

## Exporting subkeys

After adding subkeys, the next step is to export and distribute them to our devices. Copy the IDs of
our keys from the previous instructions. The ID is directly after the key type, for example in
`ed25519/746FDF7E8D328496` the ID is `746FDF7E8D328496`.

The command `--export-secret-subkey` allows us to export the subkey. Be aware of the `!` directly
after the ID. This is important to only export the single key. Without it the command would simply
export all subkeys of the related main key.

```bash
gpg --export-secret-subkey 746FDF7E8D328496! > device_1.gpg
```

And lets do the same with our 2nd subkey,

```bash
gpg --export-secret-subkey D99E5215D40089AC! > device_2.gpg
```

## Import subkeys

After the long journey of creating a new key, adding subkeys and exporting them, we can transfer
them to our devices and import them. Importing is rather simple with the `--import` command.

```bash
gpg --import device_1.gpg
```

And that is all we have to do on our devices to use the subkeys. If you run the `--edit-key`
command here again, you will notice that the key only contains the public main key and a single
subkey. In case you published your key to a key server, you can update the key from the key server
afterwards. You may see the other subkeys appearing again, but they will contain a `#` which means
the private component is missing, and it can't be used without.

## Setting up Git

After importing our keys, we need to setup **Git** to always use the right key and sign all messages
by default. We can do so by changing the global config file with `git config --global`.

First we copy the ID of our subkey and set the signing key. The key should differ on setup as we use
a different key per device.

```bash
git config --global user.signingkey 746FDF7E8D328496
```

Then we tell **Git** to always sign all commits.

```bash
git config --global commit.gpgsign true
```

## Upload to GitHub (or other hosts)

Most Git hosts like **GitHub**, **Gitlab**, **Bitbucket**, **Gitea** and many others already support
signed commits and usually show a badge next to each commit.

Once we start pushing our signed work, without further setup the hosts will show our changes as
unverified. The platform simply doesn't know (yet) about our signature and can't verify it.

To tell the host about our our key, we need to give it our public key. First we have to export it
with the `--export` command. The `--armor` flag gives us an easy to copy output as the binary
output may contain some non-printable characters which makes it hard for us to copy and paste.

Here we need the ID of our master key.

```bash
gpg --armor --export A0757AAC786713298C9D33ED886E3D4DD9756974
```

The output should look similar to this. Make sure to copy the full message, including the **dashes**
and **BEGIN** and **END** parts, really everything.

```txt
-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEXbeZtxYJKwYBBAHaRw8BAQdAMbc4z3hmkA9QN6tZj6dHvRdelYIL2mhnZ85o
fCWcAYq0HVRlc3QgdXNlciA8dGVzdDFAZXhhbXBsZS5jb20+iJYEExYIAD4WIQSg
dXqseGcTKYydM+2Ibj1N2XVpdAUCXbeZtwIbAwUJCWYBgAULCQgHAgYVCgkICwIE
FgIDAQIeAQIXgAAKCRCIbj1N2XVpdGa9AQCyRLJLoA4Eq/jc+nq3qsp7iVPVVZzl
pnGVuN17ymZ/pAD9EZP86HUNU9pPJDQF7yHxEilBf0Yt3CWcN+TdhD51WAG4OARd
t5pKEgorBgEEAZdVAQUBAQdAhRLSNkd/K63R98R+nbJrc7DkyEKSKBOAz37z3t/9
DFEDAQgHiH4EGBYIACYWIQSgdXqseGcTKYydM+2Ibj1N2XVpdAUCXbeaSgIbDAUJ
CWYBgAAKCRCIbj1N2XVpdNaxAP90ysZPLAea/feZv9jCwu9j/R9Fuz3gyBanHr98
Mq1qDQEAoZ2bKLDqU2ktHQ6yPteTp+k5cAWqpWsR07C3sZgelQ+4MwRdt5pbFgkr
BgEEAdpHDwEBB0BHj6a3jc6reCRTJ+wdpHevPPhmaujxShFz7NA4Nryvdoj1BBgW
CAAmFiEEoHV6rHhnEymMnTPtiG49Tdl1aXQFAl23mlsCGwIFCQlmAYAAgQkQiG49
Tdl1aXR2IAQZFggAHRYhBHUG/jtKZzKd6hw0zDLOUMqnUztIBQJdt5pbAAoJEDLO
UMqnUztINdMBALrk9uynyUrYUmumNB8wIsCGLZktpwj0FNyvIj7tzMDzAQCMMglz
prPa9YLzaCvSM2pDLEb1rXGzfXp2cHGemfvvAPEhAP9x92Bx1sWwEcGXZQaSj6EJ
5qr1oisHDHWs5ChW2F+wLAD+MNmqljSGtOng6EA//BX1x6cX19Gxz4NBu5lqjkBi
/Aw=
=Vnz2
-----END PGP PUBLIC KEY BLOCK-----
```

Then open the account settings of your host of choice and search for a section labeled **GPG Keys**
or similar. You will find a section where you can add a new key by adding the copied key. Do so
and save your changes.

Now you should see your signed commits as verified in the commit history of your hosts web
interface.

### Updating the GPG key after adding more keys

In case you add more subkeys at a later point in time, you may need to re-upload your public key
to your host. The existing keys will still continue to work, but the host doesn't know yet about
your new key, so you have to tell it by overriding the old public key.

## Further tips

### Quick version

The previously shown commands are all entering into an interactive mode where you have to answer
several questions one by one. If you are a more advanced user and or simply want to save some time,
GPG offers some quick commands as well. The result is the sample as before.

First we have to create our initial main key. User ID, key type, usage and expiry can all be
provided in a single command.

```txt
gpg --quick-gen-key "Test user <test@example.com>" ed25519 default 5y
```

Here the output is slightly different. Note that we don't have an additional encryption subkey as
before in the interactive version.

```txt
gpg: key 993F4EBDD65F4388 marked as ultimately trusted
gpg: revocation certificate stored as '/.../0A7F74591D07505886BC1D3A993F4EBDD65F4388.rev'
public and secret key created and signed.

pub   ed25519 2019-10-29 [SC] [expires: 2024-10-27]
      0A7F74591D07505886BC1D3A993F4EBDD65F4388
uid                      Test user <test@example.com>
```

Let's add this key now to get the same results. Again we can provide all options directly in one
command and the main key ID is copied from the previous output.

```bash
gpg --quick-add-key A0757AAC786713298C9D33ED886E3D4DD9756974 cv25519 default 5y
```

Lastly we can add our signing subkeys. Repeat this step for as many keys as you want.

```bash
gpg --quick-add-key A0757AAC786713298C9D33ED886E3D4DD9756974 ed25519 default 5y
```

Now our key is ready and we can start exporting, distributing and upload the pubic key.

### Trying it out locally

If you don't have another device at hand but still want to follow all the instructions, you can
delete your complete key before importing a subkey. Please be sure to double check the key ID as
there is no way back, once you deleted your key.

With the `--delete-secret-and-public-key` command we can completely remove our key. This will ask
for the key's passphrase several times.

```bash
gpg --delete-secret-and-public-key A4C47F5C36B4D9A4
```

First **GPG** will ask us (2 times) if we really want to delete our secret key. We confirm with `y`
both times.

```txt
sec  ed25519/A4C47F5C36B4D9A4 2019-10-29 Test user <test@example.com>

Delete this key from the keyring? (y/N) y
This is a secret key! - really delete? (y/N) y
```

In the next step it will delete the public key but will ask us beforehand again. Again we confirm
with `y`.

```txt
pub  ed25519/A4C47F5C36B4D9A4 2019-10-29 Test user <test@example.com>

Delete this key from the keyring? (y/N) y
```
