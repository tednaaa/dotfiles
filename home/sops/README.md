# Secrets

[sops-nix](https://github.com/Mic92/sops-nix) decrypts `secrets/` on login.

## Public repo

- edit secrets with `sops` only, never commit them decrypted
- a leaked `~/.config/sops/age/keys.txt` decrypts all git history - change the passwords
- keep a copy of `keys.txt` in Bitwarden

## Key

> Put the printed public key in `.sops.yaml`

```fish
mkdir -p ~/.config/sops/age
age-keygen -o ~/.config/sops/age/keys.txt
```

- `<file>` - the file to keep secret, like `~/.ssh/config`
- `<name>` - its name in the repo, like `ssh_config` (secrets/ssh_config)

---

## Edit secret

```fish
sops home/sops/secrets/<name>

nixos-rebuild
```

## New secret

### Encrypt the file into the repo:

```fish
cp <file> home/sops/secrets/<name>
sops encrypt -i home/sops/secrets/<name>
```

### backup your file before rebuild:

```fish
mv <file> <file>.old

nixos-rebuild
```
