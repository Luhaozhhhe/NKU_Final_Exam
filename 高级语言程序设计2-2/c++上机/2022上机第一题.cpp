#include<iostream>
using namespace std;
class Complex
{
    public:
    int real;
    int imag;
    public:
    Complex(int r=0,int i=0):real(r),imag(i){};
    Complex operator+(Complex &c);
    Complex operator-(Complex &c);
    Complex operator*(Complex &c);
    friend ostream &operator<<(ostream &out,Complex c);
};
Complex Complex::operator+(Complex &c)
{
    Complex temp;
    temp.real=real+c.real;
    temp.imag=imag+c.imag;
    return temp;
}
Complex Complex::operator-(Complex &c)
{
    Complex temp;
    temp.real=real-c.real;
    temp.imag=imag-c.imag;
    return temp;
}
Complex Complex::operator*(Complex &c)
{
    Complex temp;
    temp.real=real*c.real-imag*c.imag;
    temp.imag=real*c.imag+imag*c.real;
    return temp;
}
ostream &operator<<(ostream &out,Complex c)
{
    if(c.imag==0)
    {
        out<<c.real;
    }
    else if(c.real==0)
    {
        out<<c.imag<<"i";
    }
    else if(c.imag<0)
    {
        out<<c.real<<c.imag<<"i";
    }
    else
    
    out<<c.real<<"+"<<c.imag<<"i";
    return out;
}
int main()
{
    int a1,b1,a2,b2 = 0;
    cin>>a1>>b1>>a2>>b2;
    Complex c1(a1,b1),c2(a2,b2);
    cout<<c1+c2<<endl;
    cout<<c1-c2<<endl;
    cout<<c1*c2<<endl;
}