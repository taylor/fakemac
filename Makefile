CFLAGS=-fPIC -O2 -Wall -Werror -Wstrict-prototypes
LDFLAGS=-ldl
PREFIX=/usr/local

all: libfakemac.so

libfakemac.so: libfakemac.c
	$(CC) -shared -o libfakemac.so libfakemac.c $(CFLAGS) $(LDFLAGS)

install: all
	sed "s!<PREFIX>!$(PREFIX)!" fakemac.sh.tmpl > fakemac
	install -m 555 fakemac $(PREFIX)/bin/fakemac
	install -m 444 libfakemac.so $(PREFIX)/lib/libfakemac.so

clean:
	rm -f libfakemac.so
	rm -f fakemac
