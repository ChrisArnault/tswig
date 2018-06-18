
PROJECT     = a
PACKAGE     = ca

SRCDIR      = src/
BINDIR      = linux/
APPDIR      = app/

WRAP        = $(SRCDIR)$(PROJECT)_wrap.c
SOURCES     = $(SRCDIR)$(PROJECT).c $(WRAP)
OBJS        = $(BINDIR)$(PROJECT).o $(BINDIR)$(PROJECT)_wrap.o
LIB         = $(BINDIR)lib$(PROJECT).so

CLASSES     = $(PACKAGE)/$(PROJECT).class $(PACKAGE)/$(PROJECT)JNI.class runme.class
RUN         = runme

JAVASOURCES = $(PACKAGE)/$(PROJECT).java $(PACKAGE)/$(PROJECT)JNI.java
GEN         = $(JAVASOURCES) $(WRAP)

CFLAGS      = -fpic -I/usr/lib/jvm/java-8-oracle/include -I/usr/lib/jvm/java-8-oracle/include/linux

clean:
	rm -f $(GEN) $(CLASSES)* $(BINDIR)* $(APPDIR)*.class
	ls -al . ca linux 

all: $(LIB)

$(GEN) : $(SRCDIR)$(PROJECT).i
	swig -java -package $(PACKAGE) -outdir $(PACKAGE) $(SRCDIR)$(PROJECT).i

$(BINDIR)$(PROJECT).o: $(SRCDIR)$(PROJECT).c
	gcc -o $@ -c $< $(CFLAGS) 

$(BINDIR)$(PROJECT)_wrap.o: $(SRCDIR)$(PROJECT)_wrap.c
	gcc -o $@ -c $< $(CFLAGS) 

$(LIB): $(OBJS)
	gcc -shared $(OBJS) -o $(LIB)

$(CLASSES) : $(JAVASOURCES)
	javac $(JAVASOURCES)

run : $(CLASSES) $(LIB)
	export LD_LIBRARY_PATH=`pwd`/$(BIN)
	export CLASSPATH=`pwd`:`pwd`/$(APPDIR)
	javac $(APPDIR)runme.java
	java $(APPDIR)runme
