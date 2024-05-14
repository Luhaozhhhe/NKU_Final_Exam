#include <iostream>
using namespace std;

template <class T>
class A
{
private:
    T *arr;
    int len;

public:
    A(T a[], int L)
    {
        this->arr = a;
        this->len = L;
    }
    void sortAndShow()
    {
        this->mysort();
        this->show();
    }
    void show()
    {
        int n = len;
        while (n--)
        {
            cout << arr[len - n - 1]<<" ";
        }
        cout<<endl;
    }
    void mysort()
    {
        T temp;
        for (int i = 0; i < len - 1; i++)
        {
            for (int j = 0; j < len - 1 - i; j++)
            {
                if (arr[j] > arr[j + 1])
                {
                    temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }
    T avg()
    {
        T max = arr[0];
        T min = arr[0];
        T sum = 0;
        for (int i = 0; i < len; i++)
        {
            max = arr[i] > max ? arr[i] : max;
            min = arr[i] < min ? arr[i] : min;
            sum += arr[i];
        }
        return (sum - max - min) / (len - 2);
    }
};

int main()
{
    // double a[3] = {20.3, 37.5, 15.2};
    // int b[7] = {1,2,3,3,5,6,7};
    // char c[4] = {'A','B','C','D'};
    int a[50];
    double b[50];
    char c[50];
    int cnta, cntb, cntc;
    // 根据输入的是什么数据类型来判断选这三个的哪一个
    cin >> cnta;
    for (int i = 0; i < cnta; i++)
    {
        cin >> a[i];
    }

    cin >> cntb;
    for (int i = 0; i < cntb; i++)
    {
        cin >> b[i];
    }
    cin >> cntc;
    for (int i = 0; i < cntc; i++)
    {
        cin >> c[i];
    }

    A<int> g1(a, cnta); // 主要注意这句话的格式
    g1.sortAndShow();
    cout << g1.avg() << endl;
    A<double> g2(b, cntb);
    g2.sortAndShow();
    cout << g2.avg() << endl;
    A<char> g3(c, cntc);
    g3.sortAndShow();
    cout << g3.avg() << endl;
    return 0;
}