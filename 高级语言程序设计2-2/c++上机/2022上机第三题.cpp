#include<iostream>
#include<string>
using namespace std;


template <class T>
class list {
    struct node {
        T data;
        node* next;
    };
    
    node* head;
    node* tail;

public:
    list() : head(nullptr), tail(nullptr) {}

    void Insert(T item) {
        node* newNode = new node;
        newNode->data = item;
        newNode->next = head;
        head = newNode;
        if (tail == nullptr) {
            tail = head;
        }
    }

    void Append(T item) {
        node* newNode = new node;
        newNode->data = item;
        newNode->next = nullptr;
        if (tail == nullptr) {
            head = tail = newNode;
        } else {
            tail->next = newNode;
            tail = newNode;
        }
    }

    int count() {
        int count = 0;
        node* current = head;
        while (current != nullptr) {
            count++;
            current = current->next;
        }
        return count;
    }

    void htot() {
        if (head != nullptr && head != tail) {
            node* firstNode = head;
            head = head->next;
            tail->next = firstNode;
            firstNode->next = nullptr;
            tail = firstNode;
        }
    }

    void ttoh() {
        if (head != nullptr && head != tail) {
            node* lastNode = tail;
            node* current = head;
            while (current->next != tail) {
                current = current->next;
            }
            current->next = nullptr;
            tail = current;
            lastNode->next = head;
            head = lastNode;
        }
    }

    void display() {
        if (head == nullptr) {
            std::cout << "emptylist";
        } else {
            node* current = head;
            while (current != nullptr) {
                std::cout << current->data << " ";
                current = current->next;
            }
        }
        std::cout << std::endl;
    }

    void SortList() {
        if (head != nullptr && head != tail) {
            node* current = head;
            node* index = nullptr;
            T temp;

            while (current != nullptr) {
                index = current->next;
                while (index != nullptr) {
                    if (current->data > index->data) {
                        temp = current->data;
                        current->data = index->data;
                        index->data = temp;
                    }
                    index = index->next;
                }
                current = current->next;
            }
            display();
        }
    }
};
int main() {


    string listType;
    cin >> listType;

    int length;
    cin >> length;

    if (listType == "int") {
        list<int> link1;
        list<int> link2;
        for (int i = 0; i < length; i++) {
           
            int item;
            cin >> item;
            link1.Append(item);
            link2.Insert(item);
        }
        cout << link1.count() << endl;
    link1.display();

    link1.ttoh();
    link1.display();

    cout << link2.count() << endl;
    link2.display();

    link2.htot();
    link2.display();

    cout << "Sorted List: ";
   
    link1.SortList();
    } else if (listType == "char") 
    {       list<int> link1;
            list<int> link2;
        for (int i = 0; i < length; i++) {
            
            
            char item;
            cin >> item;
            link1.Append(item);
            link2.Insert(item);
        }
    cout << link1.count() << endl;
    link1.display();

    link1.ttoh();
    link1.display();

    cout << link2.count() << endl;
    link2.display();

    link2.htot();
    link2.display();

    cout << "Sorted List: ";
   
    link1.SortList();
          
    }

 

    return 0;
}

