int pole[4] = { 7, 2, 3, 5 };
 
int main() {
    int i,tmp;
    for(i=0; i<4; i++) {
       tmp = pole[i];
       tmp += 1;
       pole[i] = tmp;
    }
	 return 0;
}
