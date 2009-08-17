SOLUTIONSPOLICY = .solutionspolicy

SUBDIRS = book problems fall09

.PHONY: clean veryclean

clean veryclean:
	for dir in $(SUBDIRS); do \
	    $(MAKE) -C $$dir $@; \
	done

.PHONY: showsolutions

showsolutions:
	echo '\showsolutions' > $(SOLUTIONSPOLICY)

.PHONY: hidesolutions

hidesolutions:
	echo '\hidesolutions' > $(SOLUTIONSPOLICY)

.PHONY: asksolutions

asksolutions:
	-rm -f $(SOLUTIONSPOLICY)

