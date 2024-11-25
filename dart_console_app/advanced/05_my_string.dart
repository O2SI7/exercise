class MyString {
  // Internal storage for the string
  String _data;

  // Constructor
  MyString([String initial = ""]) : _data = initial;

  // Assign: replaces the current string with a new one
  void assign(String str) {
    // TODO: Implement
  }

  // Access character at position (const access)
  String at(int index) {
    // TODO: Implement
    return '';
  }

  // Access operator []
  String operator [](int index) {
    // TODO: Implement
    return '';
  }

  // Front: returns the first character
  String front() {
    // TODO: Implement
    return '';
  }

  // Back: returns the last character
  String back() {
    // TODO: Implement
    return '';
  }

  // Empty: checks if the string is empty
  bool empty() {
    // TODO: Implement
    return false;
  }

  // Size: returns the number of characters
  int size() {
    // TODO: Implement
    return 0;
  }

  // Length: alias for size()
  int length() {
    return size();
  }

  // Clear: clears the string
  void clear() {
    // TODO: Implement
  }

  // Insert: inserts a substring at a specific position
  void insert(int pos, String str) {
    // TODO: Implement
  }

  // Erase: erases part of the string
  void erase(int pos, [int? count]) {
    // TODO: Implement
  }

  // Push back: appends a character to the end
  void push_back(String char) {
    // TODO: Implement
  }

  // Pop back: removes the last character
  void pop_back() {
    // TODO: Implement
  }

  // Append: appends another string
  void append(String str) {
    // TODO: Implement
  }

  // Operator + : appends another string
  void operator +(String str) {
    append(str);
  }

  // Replace: replaces part of the string
  void replace(int pos, int count, String str) {
    // TODO: Implement
  }

  // Copy: copies part of the string into a buffer
  int copy(List<String> buffer, int count, int pos) {
    // TODO: Implement
    return 0;
  }

  // Resize: resizes the string
  void resize(int newSize, [String fill = ' ']) {
    // TODO: Implement
  }

  // Swap: swaps the content with another MyString
  void swap(MyString other) {
    // TODO: Implement
  }

  // Find: finds the first occurrence of a substring
  int find(String str, [int startPos = 0]) {
    // TODO: Implement
    return -1;
  }

  // Compare: compares this string with another
  int compare(String str) {
    // TODO: Implement
    return 0;
  }

  // Starts with: checks if the string starts with a substring
  bool starts_with(String str) {
    // TODO: Implement
    return false;
  }

  // Ends with: checks if the string ends with a substring
  bool ends_with(String str) {
    // TODO: Implement
    return false;
  }

  // Contains: checks if the string contains a substring
  bool contains(String str) {
    // TODO: Implement
    return false;
  }

  // Substr: returns a substring
  String substr(int pos, [int? count]) {
    // TODO: Implement
    return '';
  }

  // stoi: converts the string to an integer
  int stoi() {
    // TODO: Implement
    return 0;
  }

  // toString: returns the full string (for debugging or output)
  @override
  String toString() {
    return _data;
  }
}
