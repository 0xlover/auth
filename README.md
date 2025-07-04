# Auth
> Single executable rest authentication api that doesn't fail.

The perfect tool to use just to "try an **idea** out" before handling authentication in a more scalable manner!

1. [Usage](#usage)
2. [Screenshots](#documentation)
3. [Installation](#installation)

## Features
* It will always spin up a **local** authentication API, no matter what!
* Extremely configurable with flags and environment variables.
* Portable being a single statically compiled executable with embedded sqlite3 migrations.
* Fast, some would even say, blazingly fast using the Chi router!
* Structured JSON responses and beautiful logging.
* Documented and curated understandable source code which truly isn't a given...
* Security first and extensively **audited** for SQL injections, BOLA and more!

## Usage
```
you@computer$ auth
```
```
Listening to requests on :6900/api
```
Hey, but I need 2FA TOTP!
```
you@computer$ auth -t
```

Use **flags**(prioritized) and/or **environment variables**(find them in .env.example) to change the program's behaviour!

### Flags
```
you@computer$ auth -h
```
```
Usage: auth [--port] [--prefix] [--rate-limit] [--extra-limit] [--pepper] [--bcrypt-cost] [--lock-time] [--attempts] [--jwt-secret] [--jwt-expiration] [--database] [--journal-mode] [--totp] [--totp-skew] [--totp-algorithm] [--totp-backup-lenght] [--smtp] [--smtp-address] [--smtp-port] [--smtp-user] [--smtp-password] [--smtp-from] [--origins] [--easter-egg] [--version]

Options:
  --port, -p             specifies the port to bind to [default: 6900, env: PORT]
  --prefix               speicifes a prefix [default: /api, env: PREFIX]
  --rate-limit, -r       specifies the base rate limit(1 hour window) [default: 60, env: RATE_LIMIT]
  --extra-limit, -e      specifies the rate limit for sensitive endpoints(1 hour window) [default: 10, env: EXTRA_LIMIT]
  --pepper               specifies a password pepper [env: PEPPER]
  --bcrypt-cost          specifies the bcrypt cost [default: 10, env: COST]
  --lock-time, -l        specifies the lock time after too many failed attempts in hours [default: 6, env: LOCK_TIME]
  --attempts, -a         specifies the maximum number of failed attempts before being locked out [default: 9, env: LOCK_ATTEMPTS]
  --jwt-secret, -c       specifies the JWT secret [default: d3f4ult_jwt$$_secret_cha:)nge_me?, env: JWT_SECRET]
  --jwt-expiration, -x   specifies the expiration time of JWTs in hours [default: 24, env: JWT_EXPIRATION]
  --database, -d         specifies the database [default: ./auth.db, env: DATABASE_PATH]
  --journal-mode, -j     specifies the sqlite3 database journal mode [default: DELETE, env: JOURNAL_MODE]
  --totp, -t             specifies whether to enable 2FA using TOTP or not [default: false, env: ENABLE_TOTP]
  --totp-skew            specifies the TOTP validation skew [default: 0, env: TOTP_SKEW]
  --totp-algorithm       specifies the TOTP algorithm to use [default: 1, env: TOTP_ALGORITHM]
  --totp-backup-lenght   specifies the TOTP backup codes lenght [default: 8, env: TOTP_BACKUP_LENGHT]
  --smtp, -s             specifies whether to enable emails using SMTP [default: false, env: ENABLE_SMTP]
  --smtp-address         specifies the SMTP server address [env: SMTP_ADDRESS]
  --smtp-port            specifies the SMTP server port [default: 25, env: SMTP_PORT]
  --smtp-user            specifies the SMTP server user [env: SMTP_USER]
  --smtp-password        specifies the SMTP server password [env: SMTP_PASSWORD]
  --smtp-from            specifies the SMTP from address [env: SMTP_FROM]
  --origins, -o          specifies the CORS origins as a comma separated list [env: CORS_ORIGINS]
  --easter-egg, -g       specifies whether to register the easter egg endpoint [default: false, env: EASTER_EGG]
  --version, -v          prints auth's version and exit
  --help, -h             display this help and exit
```
Yes, there are a LOT of flags in here!

# Documentation
Please read the reference that you can find at the /openapi endpoint or read the code!

<img src="./reference.png">
<img src="./client.png">

## Installation
Grab a [release](https://github.com/0xlover/auth/releases) for your architecture and operating system or do it another way.

### Use Go's package manager
```
go install github.com/0xlover/auth/cmd/auth@latest
```

### Compile from source
```
CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags="-static"' ./cmd/auth/
```

### Deploy with Docker
There's no real need for a Docker Compose files right now, but I will make them after the new release!
```
docker build -t 0xlover/auth .
```

### Debugging with Delve
It's an API, so you need to attach to the PID.
```
dlv attach $(pgrep auth)
```

## Contributions
You can check out [TODO](./TODO.md) and these will definitely get accepted after review.

## Future
Planning PostgreSQL, MySQL support and a lot more including CI/CD!