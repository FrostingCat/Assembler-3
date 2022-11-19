#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>

// вариант 30
// Разработать программу численного интегрирования функции y = a + bx^3
// (задаётся действительными числами а,b) в определённом
// диапазоне целых (задаётся так же) методом трапеций (точность
// вычислений = 0.0001).


void get(int *a, int *b, FILE* file) {
    for (int i = 0; i < 2; i++) {
        fscanf(file, "%d", &a[i]);
    }
    for (int i = 0; i < 2; i++) {
        fscanf(file, "%d", &b[i]);
    }
}
// y = ab[0] + ab[1] * x^3
void count(int *ab, int *pred, int gen) {
    //int start = clock();
    double n = 10;
    int a = pred[0];
    int b = pred[1];
    double step = (b - a) / n;
    double fa = ab[0] + ab[1] * a * a * a;
    double fb = ab[0] + ab[1] * b * b * b;
    double x = a + step;
    double res1 = (fa + fb) / 2;
    FILE *output;
    output = fopen("output.txt", "w");

    for (int i = 1; i < n; i++) {
        x = a + i * step;
        res1 = ab[0] + ab[1] * x * x * x;
    }

    double res2 = 0;
    n *= 2;

    while (fabs(res2 - res1) > 0.0001) {
        res1 = res2;
        step = (b - a) / n;
        res2 = (fa + fb) / 2;
        x = a + step;
        
        for (int i = 1; i < n; i++) {
            x = a + i * step;
            res2 = ab[0] + ab[1] * x * x * x;
        }
        
        n *= 2;
    }
    if (gen) {
        fprintf(output,"a = %d, b = %d\nintegral [%d; %d]\nresult = %lf", ab[0], ab[1], pred[0], pred[1], res2);
    } else {
        fprintf(output,"result = %lf", res2);
    }
    
    fclose(output);
    //int end = clock();
    //printf("%lf", (double)(end - start) / CLOCKS_PER_SEC);
}

void generate(int *ab, int *prod) {
    srand(time(NULL));
    
    ab[0] = rand() % 10;
    ab[1] = rand() % 10;
    prod[0] = rand() % 5;
    prod[1] = 5 + (rand() % 20);
}

int main(int argc, char *argv[]) {
    int *ab = malloc(8);
    int *pred = malloc(8);
    int gen = 0;

    if (argc != 1) {
        if (!strcmp(argv[1], "file")) {
            FILE *File;
            File = fopen("file.txt", "r");
            if (File == NULL) {
                perror("Error opening file");
                return(-1);
            }
            get(ab, pred, File);
        } else if (!strcmp(argv[1], "gen")) {
            generate(ab, pred);
            gen = 1;
        } else {
            printf("error");
            return(-1);
        }
    } else {
        printf("error");
        return(-1);
    }

    count(ab, pred, gen);
    
    free(ab);
    free(pred);
    
    return 0;
} 
