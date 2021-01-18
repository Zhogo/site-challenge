#With the help of https://gist.github.com/bertvv/e77e3a5d24d8c2a9bcc4

MD = markdown
FLAG = --html4tags

#sourcefiles and target folders
SRCDIR = markdown
TARDIR = html/content

#select all source files to be converted to html
SRC = $(wildcard $(SRCDIR)/*.md)

# Convert the list of source files (Markdown files in directory markdown/)
# into a list of output files (html in directory html/content).
TAR := $(patsubst %.md,%.html,$(subst $(SRCDIR),$(TARDIR),$(SRC)))

all: $(TAR)

$(TARDIR)/%.html : $(SRCDIR)/%.md
	$(MD) $(FLAG) $< > $@

.PHONY : clean

clean:
	rm -f $(TARDIR)/*.html