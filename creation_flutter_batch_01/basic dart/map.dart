void main() {
  // map

  List<Map<String, dynamic>> studentList = [
    {
      'name': 'dipon',
      'age': 20,
    },
    {
      'name': 'tayba',
      'age': 21,
    },
  ];

  studentList[0]['session'] = '2020-21';
  print(studentList[0]);

}
