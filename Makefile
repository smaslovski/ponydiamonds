.DEFAULT_GOAL := all

%:
	make -C src $@
	find ./src -name '*.bin' -exec mv \{\} . \;
