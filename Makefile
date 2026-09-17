POWERSHELL ?= powershell.exe

.PHONY: build clean open

build:
	$(POWERSHELL) -NoProfile -ExecutionPolicy Bypass -File scripts/build.ps1

clean:
	$(POWERSHELL) -NoProfile -ExecutionPolicy Bypass -File scripts/build.ps1 -Clean

open:
	$(POWERSHELL) -NoProfile -ExecutionPolicy Bypass -File scripts/build.ps1 -Open
