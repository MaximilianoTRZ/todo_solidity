# Todo Mock CRUD App - Introductory solidity app 

In this app you can ```create```, ```read```, ```update``` and ```soft delete``` a Task.

Task is an struct which is a custom data type defined by:

```
struct Task {
  uint id;
  string name;
  string description;
}
```