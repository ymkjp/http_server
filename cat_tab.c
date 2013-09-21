#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

static void do_cat(FILE *f, int escape);

int
main(int argc, char *argv[])
{
    int opt;
    int escape = 0;
    int i;

    /* オプションを解析するループ */
    while ((opt = getopt(argc, argv, "e")) != -1) {
        switch (opt) {
            /* -e オプションを処理する */
            case 'e':
                escape = 1;
                break;
            /* 知らないオプションを渡された場合 */
            case '?':
                fprintf(stderr, "Usage: %s [-e LINES] [FILE ...]\n", argv[0]);
                exit(1);
        }
    }
    /* getopt_long() のループを抜けた時点でオプションでない最初の引数を optind が指している。
     * optind から処理を始めればオプション以外の引数だけを処理できる。
     * */
    argc -= optind;
    argv += optind;
    if (argc == 0) {
        do_cat(stdin, escape);
    } else {
        for (i = 0; i < argc; i++) {
            FILE *f;

            f = fopen(argv[i], "r");
            if (!f) {
                perror(argv[i]);
                exit(1);
            }
            do_cat(f, escape);
            fclose(f);
        }
    
    }
    exit(0);
}

static void
do_cat(FILE *f, int escape)
{
    int c;

    if (escape) {
        while ((c = fgetc(f)) != EOF) {
            switch (c) {
                case '\t':
                    if (fputs("\\t", stdout) == EOF) exit(1);
                    break;
                case '\n':
                    if (fputs("$\n", stdout) == EOF) exit(1);
                    break;
                default:
                    if (putchar(c) < 0) exit(1);
                    break;
            }
        }
    }
    else {
        while ((c = fgetc(f)) != EOF) {
            if (putchar(c) < 0) exit(1);
        }
    }
}
