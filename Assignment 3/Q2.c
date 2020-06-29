#include <stdio.h> 
#define SIZE 5
void swap(int *p, int *q) 
{ 
	int temp = *p; 
	*p = *q; 
	*q = temp; 
} 

void selectionSort(int arr[], int n) 
{ 
	int a, b, min; 
	for (a = 0; a < n-1; a++) 
	{ 
		// Find the minimum element in unsorted array 
		min = a; 
		for (b = a+1; b < n; b++) 
		if (arr[b] < arr[min]) 
			min= b; 
// Swap the found minimum element with the first element 
			swap(&arr[min], &arr[a]); 
	} 
} 

void DisplayArray(int arr[], int size) 
{  
 	int *ptr;
    int counter;
      ptr = &arr[0]; 

    counter = 0;
	printf("Sorted array elements using Arithmetic pointer \n");
    while(counter < SIZE)
    {
        printf("arr[%d] = %d \n", counter, *ptr);

       
        ptr++;

        counter++;
    }
} 
int main() 
{ 

	int arr[] = {1, 13, 5, 17, 11}; 
	int n = sizeof(arr)/sizeof(arr[0]); 
	selectionSort(arr, n); 
	DisplayArray(arr, n); 
	return 0; 
} 
