#include<iostream>
#include<string>
using namespace std;

class File
{
protected:
    string filnname;
    int filesize;
public:
    File(string name, int size) :filnname(name), filesize(size) {};
    virtual ~File() {};
    virtual void UpdateFile(int encoder, string newname) = 0;
    virtual void UpdataFile(int encoder, int newsize) = 0;
    virtual void show() = 0;
};

class ChangeEncode_name : public File
{
    int fileEncoder;
public:
    ChangeEncode_name(string name, int size, int encoder) :File(name, size), fileEncoder(encoder) {};
    void UpdateFile(int encoder, string newname)
    {
        fileEncoder = encoder;
        filnname = newname;
    }
    void UpdataFile(int encoder, int newsize)
    {
        fileEncoder = encoder;
        filesize = newsize;
    }
    void show()
    {
        cout << "change_encodeAndsize:" << filnname << " " << filesize << " ";
        switch (fileEncoder)
        {
        case 0:
            cout << "ASCII";
            break;
        case 1:
            cout << "UNICODE";
            break;
        case 2:
            cout << "UTF8";
            break;
        case 3:
            cout << "ANSI";
            break;
        }
        cout << endl;
    }
};

class ChangeEncode_size :public File
{
    int fileEncoder;
public:
    ChangeEncode_size(string name, int size, int encoder) :File(name, size), fileEncoder(encoder) {};
    void UpdataFile(int encoder, int newsize)
    {
        fileEncoder = encoder;
        filesize = newsize;
    }
    void UpdateFile(int encoder, string newname)
    {
        fileEncoder = encoder;
        filnname = newname;
    }
    void show()
    {
        cout << "change_encodeAndsize:" << filnname << " " << filesize << " ";
        switch (fileEncoder)
        {
        case 0:
            cout << "ASCII";
            break;
        case 1:
            cout << "UNICODE";
            break;
        case 2:
            cout << "UTF8";
            break;
        case 3:
            cout << "ANSI";
            break;
        }
        cout << endl;
    }
};

int main()
{
    string filename;
    int filesize;
    int encoder;
    cin >> filename >> filesize >> encoder;
    char ch;
    cin >> ch;
    if (ch == 'N')
    {
        ChangeEncode_name file(filename, filesize, encoder);
        cin >> filename >> encoder;
        file.UpdateFile(encoder, filename);
        file.show();
    }
    if (ch == 'S')
    {
        ChangeEncode_size file(filename, filesize, encoder);
        cin >> filesize >> encoder;
        file.UpdataFile(encoder, filesize);
        file.show();
    }
}
