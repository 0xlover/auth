.PHONY: build release clean

build:
	@go build -o build/auth ./cmd/auth

release:
	@GOARCH=amd64 GOOS=windows CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags="-static"' -o build/auth_windows_amd64.exe ./cmd/auth/
	@GOARCH=arm64 GOOS=windows CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags="-static"' -o build/auth_windows_arm64.exe ./cmd/auth/
	@GOARCH=amd64 GOOS=darwin CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags="-static"' -o build/auth_macos_amd64 ./cmd/auth/
	@GOARCH=arm64 GOOS=darwin CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags="-static"' -o build/auth_macos_arm64 ./cmd/auth/
	@GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags="-static"' -o build/auth_linux_amd64 ./cmd/auth/
	@GOARCH=arm64 GOOS=linux CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags="-static"' -o build/auth_linux_arm64 ./cmd/auth/
	@GOARCH=amd64 GOOS=freebsd CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags="-static"' -o build/auth_freebsd_amd64 ./cmd/auth/
	@GOARCH=arm64 GOOS=freebsd CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags="-static"' -o build/auth_freebsd_arm64 ./cmd/auth/
	@GOARCH=amd64 GOOS=openbsd CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags="-static"' -o build/auth_openbsd_amd64 ./cmd/auth/
	@GOARCH=arm64 GOOS=openbsd CGO_ENABLED=0 go build -trimpath -ldflags='-s -w -extldflags="-static"' -o build/auth_openbsd_arm64 ./cmd/auth/

clean:
	@if [ -n "$(ls build/* 2>/dev/null)" ]; then rm build/*; fi
