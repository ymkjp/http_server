
#include <stdio.h>
#include <stdlib.h>

/* まず、 getopt_long() のプロトタイプ宣言を取り込むために
 * 定数 _GNU_SOURCE を定義して getopt.h をインクルードする
 * */
#define _GNU_SOURCE
#include <getopt.h>

static void do_head(FILE *f, long nlines);

#define DEFAULT_N_LINES 10

/* struct option の配列を指す静的変数 longopts を定義すると同時に、構造体の配列を代入している。
 * また、配列末尾を getopt_long() に教えるため、全メンバを 0 にした要素を最後に置く。
 * */
static struct option longopts[] = {
    {"lines", required_argument, NULL, 'n'},
    {"help",  no_argument,       NULL, 'n'},
    {0, 0, 0, 0}
};


int
main(int argc, char *argv[])
{
    int opt;
    long nlines = DEFAULT_N_LINES;

    /* オプションを解析するループ。
     * 引数の意味を確認して納得しておく必要がある。
     * 特に、第3引数が "n:" であって "hn:" でないことに注意。
     * longopts では --help のときに 'h' を返すよう設定しているが、そういう文字をここで書く必要はない。
     * あくまで、解析したいショートオプションだけを記述する。
     * */
    while ((opt = getopt_long(argc, argv, "n", longopts, NULL)) != -1) {
        switch (opt) {
            /* -n オプションと --lines オプションを処理する。
             * オプションのパラメータは optarg に入っているので、これを処理して行数を得ておく。
             * */
            case 'n':
                nlines = atoi(optarg);
                break;
            /* --help オプションを処理する。
             * --help オプションで出力される「Usage （コマンドの使い方）」をどれくらい詳しくするかは人によってさまざま。
             *  ヘルプは標準出力に出力するのが便利。
             * */
            case 'h':
                fprintf(stdout, "Usage: %s [-n LINES] [FILE ...]\n", argv[0]);
                exit(0);
            /* 知らないオプションを渡された場合 */
            case '?':
                fprintf(stderr, "Usage: %s [-n LINES] [FILE ...]\n", argv[0]);
                exit(1);
        }
    }
    /* getopt_long() のループを抜けた時点でオプションでない最初の引数を optind が指している。
     * optind から処理を始めればオプション以外の引数だけを処理できる。
     * */
    if (optind == argc) {
        do_head(stdin, nlines);
    } else {
        int i;

        /* 同上 */
        for (i = optind; i < argc; i++) {
            FILE *f;

            f = fopen(argv[i], "r");
            if (!f) {
                perror(argv[i]);
                exit(1);
            }
            do_head(f, nlines);
            fclose(f);
        }
    
    }
    exit(0);
}

static void
do_head(FILE *f, long nlines)
{
    int c;

    if (nlines <= 0) return;
    while ((c = getc(f)) != EOF) {
        if (putchar(c) < 0) exit(1);
        if (c == '\n') {
            nlines--;
            if (nlines == 0) return;
        }
    }
}
