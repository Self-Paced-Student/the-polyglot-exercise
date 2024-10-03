// Define a function called `shuffle`
// that receives an array of integers (int[])
// and shuffles the elements
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Function to shuffle an array
void shuffle(int *array, size_t n) {
    if (n > 1) {
        size_t i;
        srand((unsigned int)time(NULL));  // Seed the random number generator
        for (i = n - 1; i > 0; i--) {
            size_t j = rand() % (i + 1);  // Random index from 0 to i

            // Swap array[i] with array[j]
            int temp = array[i];
            array[i] = array[j];
            array[j] = temp;
        }
    }
}

int main(int argc, char **argv) {
    int arr[] = {1, 2, 3, 4, 5};
    size_t n = sizeof(arr) / sizeof(arr[0]);

    printf("Original array:\n");
    for (size_t i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    shuffle(arr, n);

    printf("Shuffled array:\n");
    for (size_t i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
