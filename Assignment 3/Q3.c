#include <stdio.h>
#include <stdlib.h>
#include <string.h>

	typedef struct Book {
	    char * title;
	    float price;
	} Book;

	void Display(Book library[], int n);
	float AveragePrice(Book library[], int n);
	void Add(Book * library[], int* n);

	int main() {
	    int n = 2;
	    int* ptr_n = &n;
	    printf("Enter number of books: ");
	    scanf("%d", &n);
	    
	    printf("Creating %d books.\n", n);
	    Book *library = malloc(n * sizeof(Book));
	    
	    for (int i = 0; i < n; i++) {
	        library[i].title = "poop";
	        library[i].price = (3*i+5)*3.14+10;
	    }
	    
	    Display(library, n);
	    printf("Average Price: %0.2f\n\n", AveragePrice(library, n));
	    Add(&library, ptr_n);
	    Display(library, n);
	    printf("New Average Price: %0.2f\n\n", AveragePrice(library, n));
	    return 0;
	}

	void Display(Book library[], int n) {
	    for (int i = 0; i < n; i++) {
	        printf("%d: %s for %0.2f\n", i+1, library[i].title, library[i].price);
	    }
	}

	float AveragePrice(Book library[], int n) {
	    float sum = 0;
	    for (int i = 0; i < n; i++) {
	        sum = sum + library[i].price;
	    }
	    return (sum/n);
	}

	void Add(Book * library[], int* n) {
	    char title[1024];
	    float price;
	    printf("Please enter a title: ");
	    scanf("%s", title);
	    
	    printf("Please enter a price: ");
	    scanf("%f", &price);
	    
	    *n = *n + 1;
	    Book *newLibrary = malloc((*n) * sizeof(Book));
        
        for (int i = 0; i < *n-1; i++) {
            newLibrary[i].title = (*library)[i].title;
            newLibrary[i].price = (*library)[i].price;
        }
        
        printf("%s = %f\n", title, price);
	    newLibrary[*n-1].title = title;
        newLibrary[*n-1].price = price;
        free(*library);

	    *library = newLibrary;
	    
	}

