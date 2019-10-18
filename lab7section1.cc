#include <iostream>
#include <algorithm>
using namespace std;

extern int add(int a, int b);

extern int factorial(int x);
extern int fact(int x);

int main(){
	cout << add(3, 7) << endl;
	cout << factorial(4) << endl;
	cout << fact(4) << endl;
	/* Compiles to:
	 * mov r1, #7
	 * mov r0, #3
	 * bl _Z3addii
	 */
	int a[] = {2, 6, 1, 8, 5};
	sort(begin(a), end(a));
	for (int i = sizeof(a)/sizeof(*a) - 1; i >= 0; --i)
		cout << a[i] << " ";
	cout << endl;

	return 0;
}
