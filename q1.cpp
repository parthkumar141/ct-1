//code 1
#include <iostream>

using namespace std;

int main()
{
    int arr[6] = {8,7,2,5,3,1};
    for (int i=0; i<6; i++) {
        for (int j=i+1; j<6; j++) {
            if (arr[i] + arr[j] == 10) {
            cout<<"pair found"<<"("<<arr[i]<<","<<arr[j]<<")";
            cout<<endl;
            }
            
        }
    }

    return 0;
}


