#include <limits.h>
#include <stdio.h>

int min(int x, int y) { return (x < y) ? x : y; }

int minJumps(int arr[], int n)
{
  // jumps[n-1] will hold the result
  int jumps[n];
  int i, j;

  if (n == 0 || arr[0] == 0)
   return INT_MAX;

  jumps[0] = 0;

  // Find the minimum number of jumps to reach arr[i]
  // from arr[0], and assign this value to jumps[i]
  for (i = 1; i < n; i++) {
     jumps[i] = INT_MAX;
     for (j = 0; j < i; j++) {
         if (i <= j + arr[j] && jumps[j] != INT_MAX) {
           jumps[i] = min(jumps[i], jumps[j] + 1);
           break;
         }
      }
   }
return jumps[n - 1];
}

int main()
{
 int n;
  scanf("%d", &n);
  
  int arr[n];
  for(int i=0; i<n; i++) 
    scanf("%d", &arr[i]);

  printf("Minimum number of jumps to reach end is %d ",minJumps(arr, n));

  return 0;
}
