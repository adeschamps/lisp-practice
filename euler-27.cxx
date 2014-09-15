#include <iostream>
#include <set>

bool prime (int n)
{
  if (n <= 0) return false;
  static std::set<int> primes;
  static int max = 1;

  if (n <= max) return primes.count(n) == 1;

  prime (n - 1);

  for (int p : primes)
    if (n % p == 0)
      {
	max = n;
	return false;
      }

  primes.insert(n);
  return true;
}

int count_primes (int a, int b)
{
  int n;
  for (n = 0; prime(n*n + a*n + b); ++n);
  return n;
}

int main ()
{
  // for (int n = 0; n < 20; ++n)
  //   std::cout << n << "\t" << prime(n) << '\n';

  int range = 1000;

  int max_count = 0;
  int best_a;
  int best_b;

  for (int a = 1-range; a != range; ++a)
    for (int b = 1-range; b != range; ++b)
      {
	int count = count_primes (a, b);
	if (count > max_count)
	  {
	    max_count = count;
	    best_a = a;
	    best_b = b;
	  }
      }

  std::cout << "max_count: " << max_count << '\n';

  std::cout << "a:   " << best_a << '\n'
	    << "b:   " << best_b << '\n'
	    << "a*b: " << best_a * best_b << '\n';
}
