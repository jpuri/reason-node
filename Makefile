build:
	jbuilder build

run: build
	./_build/install/default/bin/examples

test:
	jbuilder runtest

.PHONY: coverage
coverage: clean
	BISECT_ENABLE=YES jbuilder build
	jbuilder runtest
	bisect-ppx-report -ignore-missing-files -I _build/default/ -html coverage/ \
	    _build/default/tests/bisect*.out
	@echo See ./coverage/index.html

clean:
	rm -f _build/default/tests/bisect*.out
	rm -rf _build *.install
