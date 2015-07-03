CPANM       = cpanm
CARTON      = carton
CARTON_EXEC = $(CARTON) exec --
PROVE       = $(CARTON_EXEC) prove

# Tasks

all: install-deps test

test:
	$(PROVE) t/

install-carton:
	which carton >/dev/null 2>&1 || $(CPANM) --notest Carton

install-deps: install-carton
	$(CARTON) install

# Travis build phases

travis-install: install-deps

travis-script: test
