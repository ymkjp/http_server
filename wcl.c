#include <stdio.h>
#include <stdlib.h>

static void do_wc_l(FILE *f);

int
main(int argc, char *argv[])
{
    int i;

    for (i = 1; i < argc; i++) {
        FILE *f;

        f = fopen(argv[i], "r");
        if (!f) {
            perror(argv[i]);
            exit(1);
        }
        do_wc_l(f);

        fclose(f);
    }
    exit(0);
}

static void
do_wc_l(FILE *f)
{
    int c;
    unsigned long n;
    int prev = '\n';

    n = 0;
    while ((c = fgetc(f)) != EOF) {
        if (c == '\n') {
            n++;
        }
        prev = c;
    }
    if (prev != '\n') {
        n++;
    }
    printf("%lu\n", n);
}
