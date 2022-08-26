// code 2
#include<bits/stdc++.h>
using namespace std;
int main(){



    int n;
    cin>>n;
    int arr[n];
    for(int i=0;i<n;i++){
        cin>>arr[i];
    }
     
     for (int i = 1; i < n; i += 2)
        {
           
            if (arr[i - 1] > arr[i]) {
                swap(arr[i-1],arr[i]);
            }
 
            
            if (i + 1 < n && arr[i + 1] > arr[i]) {
                swap(arr[i+1],arr[i]);
            }
        }

for(auto ele:arr){
    cout<<ele<<" ";
}


	return 0;
}