#include<iostream>
using namespace std;
struct Node
{
    int data;
    Node *next;
    Node():data(0),next(nullptr){};
    Node(int a):data(a),next(nullptr){};
};
class Link
{
public:
    Node *head;
    Link():head(nullptr){};
    ~Link();
    void Insert(int a);
    Link &operator+=(const Link& other);
    void Print();
};
void Link::Insert(int a)
{
    Node* newnode = new Node(a);
    if(!head)
    {
        head = newnode;
        return;
    }
    Node* temp = head;
    while(temp->next)
    {
        temp = temp->next;
    }
    temp->next = newnode;
}

Link& Link::operator+=(const Link& other)
{   
    if(!other.head)
    {
        return *this;
    }
    Node* temp2 = other.head;
    if(!this->head)
    {
        while(temp2)
        {
            this->Insert(temp2->data);
            temp2 = temp2->next;
        }
        return *this;
    }
    Node* temp1 = this->head;
    Node* curr = head;
    while(temp1&&temp2)
    {
        Node* newnode = new Node(temp2->data);
        temp1 = temp1->next;
        curr->next = newnode;
        newnode->next = temp1;
        curr = temp1;
        temp2 = temp2->next;
    }
    if(!temp1)
    {
        while(temp2)
        {
            this->Insert(temp2->data);
            temp2 = temp2->next;
        }
        return *this;
    }
    return *this;
}
void Link::Print()
{
    Node *temp = head;
    while(temp)
    {
        cout<<temp->data<<" ";
        temp = temp->next;
    }
    cout<<endl;
}
Link::~Link()
{
    Node* temp = head;
    while(temp)
    {
        head = head->next;
        delete temp;
        temp = head;
    }
}
int main()
{
    Link l1,l2;
    int n = 5;
    while(n--)
    {
        
        l1.Insert(n);
    }
    l1.Print();
    n = 10;
    while(n--)
    {
        l2.Insert(3-n);
    }
    l2.Print();
    l1+=l2;
    l1.Print();
}

