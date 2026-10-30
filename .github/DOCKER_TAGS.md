# Docker Image Tags Reference

This document describes the Docker image tagging strategy for the helloworld project.

## Tag Naming Convention

All images use the format: `snowdreamtech/helloworld:TAG`

Where `TAG` follows these patterns:

- **Variant-specific tags**: `TAG-variant` (e.g., `nightly-alpine`, `1.2.0-alpine`)
- **Default tags** (Debian only): `TAG` (e.g., `nightly`, `latest`, `1.2.0`)

## Supported Registries

All tags are pushed to two registries:

- **DockerHub**: `snowdreamtech/helloworld:TAG`
- **GitHub Container Registry**: `ghcr.io/snowdreamtech/helloworld:TAG`

## Tag Scenarios

### 1. Branch Builds (dev/main)

#### Push to `dev` branch

```bash
git push origin dev
```

**Generated tags:**

```
snowdreamtech/helloworld:dev-alpine
snowdreamtech/helloworld:dev-debian
snowdreamtech/helloworld:dev              # ← Debian (default)
snowdreamtech/helloworld:dev-rocky
```

#### Push to `main` branch

```bash
git push origin main
```

**Generated tags:**

```
snowdreamtech/helloworld:main-alpine
snowdreamtech/helloworld:latest-alpine
snowdreamtech/helloworld:main-debian
snowdreamtech/helloworld:latest-debian
snowdreamtech/helloworld:main             # ← Debian (default)
snowdreamtech/helloworld:latest           # ← Debian (default)
snowdreamtech/helloworld:main-rocky
snowdreamtech/helloworld:latest-rocky
```

---

### 2. Release Tags (Semantic Versioning)

#### Alpine Release

```bash
git tag alpine-v1.2.0
git push origin alpine-v1.2.0
```

**Generated tags:**

```
snowdreamtech/helloworld:1.2.0-alpine
snowdreamtech/helloworld:latest-alpine
```

#### Debian Release

```bash
git tag debian-v1.2.0
git push origin debian-v1.2.0
```

**Generated tags:**

```
snowdreamtech/helloworld:1.2.0-debian
snowdreamtech/helloworld:latest-debian
snowdreamtech/helloworld:1.2.0           # ← Debian (default)
snowdreamtech/helloworld:latest           # ← Debian (default)
```

#### Rocky Release

```bash
git tag rocky-v1.2.0
git push origin rocky-v1.2.0
```

**Generated tags:**

```
snowdreamtech/helloworld:1.2.0-rocky
snowdreamtech/helloworld:latest-rocky
```

---

### 3. Nightly Builds (Scheduled)

**Trigger:** Automatically every day at 17:00 UTC

**Generated tags:**

```
# Alpine
snowdreamtech/helloworld:nightly-alpine
snowdreamtech/helloworld:20260427-alpine

# Debian (with default tags)
snowdreamtech/helloworld:nightly-debian
snowdreamtech/helloworld:20260427-debian
snowdreamtech/helloworld:nightly          # ← Debian (default)
snowdreamtech/helloworld:20260427         # ← Debian (default)

# Rocky
snowdreamtech/helloworld:nightly-rocky
snowdreamtech/helloworld:20260427-rocky
```

---

## Tag Priority

Tags are generated with the following priority (higher number = higher priority):

| Priority | Type | Example Tags | Trigger |
|----------|------|--------------|---------|
| 1000 | Nightly | `nightly`, `nightly-alpine` | Schedule |
| 900 | Date | `20260427`, `20260427-alpine` | Schedule |
| 800 | Version | `1.2.0-alpine`, `1.2.0` | Tag push |
| 600 | Branch | `dev-alpine`, `main-debian` | Branch push |
| 200 | Latest | `latest`, `latest-alpine` | Main/Tag |

---

## Default Variant (Debian)

Debian is designated as the **default variant** (`is_latest: true`), which means:

✅ **Debian gets BOTH suffixed AND unsuffixed tags:**

```
snowdreamtech/helloworld:nightly-debian   # Variant-specific
snowdreamtech/helloworld:nightly          # Default (no suffix)

snowdreamtech/helloworld:1.2.0-debian    # Variant-specific
snowdreamtech/helloworld:1.2.0           # Default (no suffix)

snowdreamtech/helloworld:latest-debian    # Variant-specific
snowdreamtech/helloworld:latest           # Default (no suffix)
```

❌ **Alpine and Rocky get ONLY suffixed tags:**

```
snowdreamtech/helloworld:nightly-alpine   # Variant-specific only
snowdreamtech/helloworld:nightly-rocky    # Variant-specific only
```

---

## Usage Examples

### Pull the latest Debian image (default)

```bash
docker pull snowdreamtech/helloworld:latest
# or
docker pull snowdreamtech/helloworld:latest-debian
```

### Pull the latest Alpine image

```bash
docker pull snowdreamtech/helloworld:latest-alpine
```

### Pull the latest Rocky image

```bash
docker pull snowdreamtech/helloworld:latest-rocky
```

### Pull a specific version

```bash
# Alpine 1.2.0
docker pull snowdreamtech/helloworld:1.2.0-alpine

# Debian 1.2.0 (two ways)
docker pull snowdreamtech/helloworld:1.2.0-debian
docker pull snowdreamtech/helloworld:1.2.0

# Rocky 1.2.0
docker pull snowdreamtech/helloworld:1.2.0-rocky
```

### Pull nightly builds

```bash
# Alpine nightly
docker pull snowdreamtech/helloworld:nightly-alpine

# Debian nightly (two ways)
docker pull snowdreamtech/helloworld:nightly-debian
docker pull snowdreamtech/helloworld:nightly

# Rocky nightly
docker pull snowdreamtech/helloworld:nightly-rocky
```

---

## Tag Lifecycle

### Development Flow

```
1. Push to dev → helloworld:dev-alpine, helloworld:dev-debian, helloworld:dev, helloworld:dev-rocky
2. Push to main → helloworld:main-alpine, helloworld:latest-alpine, helloworld:main-debian, helloworld:latest-debian, helloworld:main, helloworld:latest, helloworld:main-rocky, helloworld:latest-rocky
3. Create tag → helloworld:VERSION-variant, helloworld:latest-variant (+ unsuffixed for Debian)
```

### Release Flow (with Release Please)

```
1. Merge PR to main → Release Please creates release PR
2. Merge release PR → Release Please creates tags (alpine-vX.Y.Z, debian-vX.Y.Z, rocky-vX.Y.Z)
3. Tag push triggers build → Images published with version tags
```

---

## Matrix Configuration

The workflow uses a matrix strategy with three variants:

```yaml
matrix:
  include:
    - variant: alpine
      version: "1.2.0"
      is_latest: false

    - variant: debian
      version: "1.2.0"
      is_latest: true    # ← Default variant

    - variant: rocky
      version: "1.2.0"
      is_latest: false
```

Only the variant with `is_latest: true` receives unsuffixed tags.

---

## Metadata Action Configuration

The key configuration that enables this tagging strategy:

```yaml
images: |
  name=ghcr.io/snowdreamtech/helloworld,enable=true
  name=snowdreamtech/helloworld,enable=true
flavor: |
  latest=false
  prefix=
  suffix=-${{ matrix.variant }}  # ← Adds variant suffix to all tags
```

For Debian (is_latest), additional rules generate unsuffixed tags:

```yaml
type=raw,enable=${{ matrix.is_latest }},priority=1000,prefix=,suffix=,pattern=nightly
```

This creates both `nightly-debian` (from flavor suffix) and `nightly` (from this rule).
