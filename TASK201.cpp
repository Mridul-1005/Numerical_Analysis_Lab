#include <bits/stdc++.h>
using namespace std;
int main()
{
    float a[100][100], x[100], r;

    int i,j,k,n;

    n = 3;

    for(int i=0;i<n;i++){
        for(int j=0;j<=n;j++){
            float p;
            if(i == 0){
                p = 5;
                a[i][3] = 106.8;
            }
             if(i == 1){
                p = 8;
                a[i][3] = 177.2;
            }
             if(i == 2){
                p = 11;
                a[i][3] = 279.2;
            }

            if(j == 0) a[i][j] = p*p;
            if(j == 1) a[i][j] = p;
            if(j == 2) a[i][j] = 1;
        }
    }

    for(int i=0;i<n-1;i++){
        if(a[i][i] == 0.0){
            cout << "Error\n";
            return 0;
        }

        for(int j = i+1;j<n;j++){
            r = a[j][i]/a[i][i];
            for(int k = 0; k<=n;k++){
                a[j][k] = a[j][k] - r*a[i][k];
            }
        }
    }

    x[n-1] = a[n-1][n]/a[n-1][n-1];

    for(int i=n-2; i>=0; i--){
        x[i] = a[i][n];

        for(int j= i+1; j<n;j++){
            x[i] = x[i] - a[i][j]*x[j];
        }

        x[i] = x[i]/a[i][i];
    }

    for(int i=0;i<n;i++){
        cout << "x" << i+1 << ": " << x[i] << endl;
    }

    float t = 6.0;
    float vel = 0;
    for(int i=0;i<3;i++){
            float sum = 1;
        for(j = 0;j<2-i;j++){
            sum*=t;
        }
        vel += sum*x[i];
    }

    cout << vel << endl;
}
