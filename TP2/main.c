#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

typedef struct {
    uint8_t r;
    uint8_t g;
    uint8_t b;
} Pixel;

typedef struct {
    int width;
    int height;
    Pixel *data;
} Image;

Image load_ppm(const char *filename) {
    FILE *file = fopen(filename, "rb");
    char magic_number[3];
    Image img;
    int max_val;

    fscanf(file, "%2s %d %d %d", magic_number, &img.width, &img.height, &max_val);
    fgetc(file);

    img.data = malloc(img.width * img.height * sizeof(Pixel));
    fread(img.data, sizeof(Pixel), img.width * img.height, file);

    fclose(file);
    return img;
}

void free_image(Image *img) {
    free(img->data);
    img->data = NULL;
}

void to_grayscale_float(Image *img) {
    // on boucle sur tous les pixels de l'image, donc si 4x4 on boucle 16 fois
    for (int i = 0; i < img->width * img->height; i++) {
        float gray_float = 0.299f * img->data[i].r + 0.587f * img->data[i].g+ 0.114f * img->data[i].b;
        uint8_t gray = (uint8_t)gray_float; //convertir en entier
        img->data[i].r = gray;
        img->data[i].g = gray;
        img->data[i].b = gray;
    }
}

void to_grayscale_fixed(Image *img) {
    for (int i = 0; i < img->width * img->height; i++) {
        uint32_t gray_fixed = (19595U * img->data[i].r + 38470U * img->data[i].g + 7471U * img->data[i].b) >> 16;
        uint8_t gray = (uint8_t)gray_fixed;
        img->data[i].r = gray;
        img->data[i].g = gray;
        img->data[i].b = gray;
    }
}

int main(int argc, char *argv[]) {
    //verif des arguments
    if (argc != 2) { 
        fprintf(stderr, "Usage: %s <image.ppm>\n", argv[0]);
        return 1;
    }

    //chargement de l'image
    Image img = load_ppm(argv[1]);
    if (img.data == NULL) {
        fprintf(stderr, "erreur echec du chargement de l'image.\n");
        return 1;
    }

    printf("image chargee : %d x %d pixels\n", img.width, img.height);

    // sauvegarde de l'image originale pour les tests (100 itérations)
    const int iterations = 100;
    size_t pixel_count = (size_t)img.width * img.height;
    size_t data_size = pixel_count * sizeof(Pixel);
    
    Pixel *original_data = malloc(data_size);
    if (original_data == NULL) {
        fprintf(stderr, "Erreur : allocation memoire impossible.\n");
        free_image(&img);
        return 1;
    }
    memcpy(original_data, img.data, data_size); //copie de l'image originale dans original_data

    struct timespec start, end;
    double elapsed_ms;

    // Test 1 avec virgule flottante
    clock_gettime(CLOCK_MONOTONIC, &start); //démarrage de la clock
    for (int i = 0; i < iterations; i++) { //on tourne 100 fois le test
        to_grayscale_float(&img);
    }
    clock_gettime(CLOCK_MONOTONIC, &end); //arret de l'horloge

    // généré avec l'IA : conversion des sec/nsec directement en millisecondes
    elapsed_ms = (end.tv_sec - start.tv_sec) * 1000.0 + (end.tv_nsec - start.tv_nsec) / 1000000.0;
    printf("Temps moyen virgule flottante         : %.6f ms\n", elapsed_ms / iterations);

    // Test 2 : Virgule fixe, la meme chose que au dessus, je commente pas

    memcpy(img.data, original_data, data_size); //restaure l'image originale en couleurs avant de relancer le traitement
    
    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int i = 0; i < iterations; i++) {
        to_grayscale_fixed(&img);
    }
    clock_gettime(CLOCK_MONOTONIC, &end); 

    // généré avec l'ia : conversion des sec/nsec directement en millisecondes
    elapsed_ms = (end.tv_sec - start.tv_sec) * 1000.0 + (end.tv_nsec - start.tv_nsec) / 1000000.0;
    printf("Temps moyen virgule fixe : %.6f ms\n", elapsed_ms / iterations);

    // livération de la mémoire 
    free(original_data);
    free_image(&img);
    printf("Memoire liberee avec succes.\n");

    return 0;
}