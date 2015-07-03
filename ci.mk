CPANM         = cpanm
CARTON        = carton
CARTON_EXEC   = $(CARTON) exec --
PROVE         = $(CARTON_EXEC) prove
COVER         = $(CARTON_EXEC) cover
COVER_OPTIONS = -ignore_re 'inc|blib|modules|^t/|^local/' -make 'make -f ci.mk test'

# Tasks

all: install-deps test

test:
	$(PROVE) t/

install-carton:
	which carton >/dev/null 2>&1 || $(CPANM) --notest Carton

install-deps: install-carton
	$(CARTON) install

coverage:
	$(COVER) $(COVER_OPTIONS) -test

coveralls: coverage
	$(COVER) -report coveralls

# Travis build phases

travis-install: install-deps

travis-script: test
