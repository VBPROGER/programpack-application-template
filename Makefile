SHELL := /usr/bin/env bash
PROGRAMPACK = python3 -m programpack
.SILENT: sbuild srun sconvert sdeconvert shelp

sbuild:
	rm -f app.zip
	cd application; zip 'app.zip' -r .; mv app.zip ../app.zip
	chmod 777 app.zip
srun:
	$(PROGRAMPACK) run $(ARGS)
sconvert:
	$(PROGRAMPACK) convert 'app.zip' $(ARGS)
sdeconvert:
	$(PROGRAMPACK) deconvert 'app.zip' $(ARGS)
shelp:
	$(PROGRAMPACK) --help