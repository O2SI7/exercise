
void main(){
 List<int> items = [1,2,3];
 List<int> additems = [...items,4,5];

for (int i = 0; i < additems.length; i++) {
  print(additems[i]);
}

for (int additems in items) {
print(additems);
  
}
}