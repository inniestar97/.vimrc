#include <iostream>
#include <algorithm>

using namespace std;

int N;
long long weight[1000];
int main(void) {
    cin.tie(NULL); cout.tie(NULL);
    ios::sync_with_stdio(false);
    
    cin >> N;
    for (size_t i = 0; i < N; i++) {
        cin >> weight[i];
    }

    sort(weight, weight + N, less<>());

    // for (size_t i = 0; i < N; i++) {
    //     cout << weight[i] << " ";
    // }
    // cout << endl;

    long long int maximum = 0;
    for (size_t i = 0; i < N; i++) {
        if (maximum + 1 < weight[i]) {
            break;
        }

        maximum += weight[i];
    }

    cout << maximum + 1 << endl;

    return 0;
}
