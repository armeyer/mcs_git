SOLUTIONSPOLICY = .solutionspolicy
EDITNOTEPOLICY  = .editnotepolicy
PROBLEMSPOLICY  = .problemspolicy
PROBLEMSINBOOK  = .problemsinbook

SUBDIRS = book problems spring18 spring17 spring16 spring15 spring14 spring13 spring12 \
spring11 spring10 fall09 fall11 fall13 fall14 fall15 fall16 fall17 

.PHONY: clean veryclean

clean veryclean:
	for dir in $(SUBDIRS); do \
	    $(MAKE) -C $$dir $@; \
	done

.PHONY: showpolicy

showpolicy:
	@ cat $(SOLUTIONSPOLICY)
	@ cat $(EDITNOTEPOLICY)
	@ cat $(PROBLEMSPOLICY)
	@ cat $(PROBLEMSINBOOK)

.PHONY: shownotes

shownotes:
	echo '\showeditingnotestrue' > $(EDITNOTEPOLICY)

.PHONY: hidenotes

hidenotes:
	echo '\showeditingnotesfalse' > $(EDITNOTEPOLICY)

.PHONY: togglenotes

togglenotes:
	sed -i -e "s/false/true/;t;s/true/false/" $(EDITNOTEPOLICY)

.PHONY: showproblems

showproblems:
	echo '\showproblemstrue' > $(PROBLEMSPOLICY)

.PHONY: hideproblems

hideproblems:
	echo '\showproblemsfalse' > $(PROBLEMSPOLICY)

.PHONY: toggleproblems

toggleproblems:
	sed -i -e "s/false/true/;t;s/true/false/" $(PROBLEMSPOLICY)

.PHONY: showsolutions

showsolutions:
	echo '\showsolutions' > $(SOLUTIONSPOLICY)

.PHONY: staffsolutions

staffsolutions:
	echo '\staffsolutions' > $(SOLUTIONSPOLICY)

.PHONY: hidesolutions

hidesolutions:
	echo '\hidesolutions' > $(SOLUTIONSPOLICY)

.PHONY: togglesolutions

togglesolutions:
	sed -i -e "s/hide/show/;t;s/show/hide/" $(SOLUTIONSPOLICY)

.PHONY: asksolutions

asksolutions:
	-rm -f $(SOLUTIONSPOLICY)

.PHONY: showinbook

showinbook:
	echo '\problemsinbooktrue' > $(PROBLEMSINBOOK)

.PHONY: showinhandout

showinhandout:
	echo '\problemsinbookfalse' > $(PROBLEMSINBOOK)
