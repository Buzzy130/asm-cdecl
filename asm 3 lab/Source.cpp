#include <iostream>
#include <string>

using namespace std;


extern "C" {
    char FindMax(char* string, int len);//ищет максимальный символ
    char FindMin(char* string, int len);//ищет минимальный символ
}

int main() {
    setlocale(LC_ALL, "russian");
    string input;
    cout << "Введите строку: ";
    getline(cin, input);

    int len = input.length();
    char* str = new char[len + 1];
    strcpy_s(str, len + 1, input.c_str());
    char max;
    char min;
    max = FindMax(str, len - 1);
    min = FindMin(str, len - 1);
    cout << "Максимальный символ: " << max << endl;
    cout << "Минимальный символ: " << min << endl;

    delete[] str;
    return 0;
}