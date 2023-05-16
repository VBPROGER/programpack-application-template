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
sdepsinstall:
	git clone https://github.com/VBPROGER/programpack.git -b experimental && mv programpack programpack-exp-branch;
	cd programpack-exp-branch;
	make sinstall && make sclean;
	cd ..;
	true && rm -rf programpack-exp-branch;
