#include <iostream>
#include <windows.h> 
#include <conio.h>   
using namespace std;

void setTextColor(int color) {
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(hConsole, color);
}

void gotoxy(int x, int y) {
    COORD coord;
    coord.X = x;
    coord.Y = y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}
 string ten;
 string nguoi_gui;
 string str = "dat";
void displayLoginScreen() {
    int centerX = 80;
   
    setTextColor(14); 
    //gotoxy(vitri canh, dong)+ vi tri tro chuot
    gotoxy(centerX - 15, 5+6);  cout << "*******************************";
    gotoxy(centerX - 15, 6+6);  cout << "*                             *";
    gotoxy(centerX - 15, 7+6);  cout << "*******************************";

    setTextColor(10); 
    gotoxy(centerX - 6, 6+6); cout << "WHO ARE YOU ?";

    setTextColor(2); 
    gotoxy(centerX - 10, 9+6);  cout << "Ten: ";
    gotoxy(centerX - 18, 10+6); cout << "Nguoi gui file: ";

    setTextColor(7);
    gotoxy(centerX - 2, 9+6);  cin >> ten;
    gotoxy(centerX - 2, 10+6); cin >> nguoi_gui;
    setTextColor(7);
}
void displayMenu(int currentSelection) {
    system("cls"); 
    int centerX = 82;
    gotoxy(centerX - 15, 5+4);
    setTextColor(4);
    if(str!=nguoi_gui) {
    	cout<<"toi ten dat , tai sao su dung khong xem nguon ? :))"<<endl;
	}
	else {
		setTextColor(8);
	cout<<"mung la ban biet toi"<<endl;
}
	gotoxy(centerX - 15, 5+5);
    cout<<"HELLO "<<ten<<".luu y: ctrinh so khai"<<endl;
    string menuItems[3] = {"1. creation date", "2. you hate me", "3. you love me"};
    
    for (int i = 0; i < 3; i++) {
        if (i == currentSelection) {
            setTextColor(10); 
        } else {
            setTextColor(7); 
        }
        if(i==0) {
        	gotoxy(centerX - 15, 5+6);
		}
		else if(i==1){
			gotoxy(centerX - 15, 5+7);
		}
		else if(i==2){
			gotoxy(centerX - 15, 5+8);
		}
        cout << menuItems[i] << endl;
    }
    setTextColor(7);
}
void navigateMenu() {
    int currentSelection = 0; 
    char key;
    setTextColor(14); 
    int centerX = 80;
    gotoxy(centerX - 15, 5+6);
    do {
        displayMenu(currentSelection);  
        key = getch();  
        if (key == 72) { // phim mui ten len
            currentSelection--;
            if (currentSelection < 0) currentSelection = 2;
        } else if (key == 80) { //phim mui ten len
            currentSelection++;
            if (currentSelection > 2) currentSelection = 0; 
        }
    } while (key != 13);  //phim enter
    system("cls");
    gotoxy(centerX - 15, 5+4);
    cout << "You selected: " << currentSelection + 1 << endl;
    switch (currentSelection) {
        case 0:
        	gotoxy(centerX - 15, 5+5);
        	setTextColor(15);
            cout << "07/10/2024 2h28'" << endl;
            break;
        case 1:
        	gotoxy(centerX - 15, 5+5);
        	setTextColor(6);
            cout << "WTF Bro,why ???" << endl;
            break;
        case 2:
        	gotoxy(centerX - 15, 5+5);
        	setTextColor(5);
            cout << "oh no bro,you are not gay ? -.-" << endl;
            break;
    }
}
int main() {
    system("cls"); 
    displayLoginScreen();
    navigateMenu();
    getch(); 
    return 0;
}
