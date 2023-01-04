void main() {

  // List all patients over the age of 20
  // Count the patients by their profession
  // Count the patients who live in SP
  
  final pacients = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];

  var pacientsMap = pacients.map((p) {
    final splittedString = p.split('|');
    final newPacient = <String, dynamic> {
      'name': splittedString[0],
      'age': int.tryParse(splittedString[1]) ?? 0,
      'occupation': splittedString[2],
      'city': splittedString[3]
    };

    return newPacient;
  });


  var pacientsOver20 = 
      pacientsMap
      .where((p) => p['age'] > 20)
      .map((p) => p['name']);

  print('pacients over than 20');
  print(pacientsOver20);
  print('-----------------------');

  var pacientsByProfession = pacientsMap.fold({'desenvolvedor': 0, 'estudante': 0, 'dentista': 0, 'jornalista': 0 }, (acc, p) {
     int? value = acc[p['occupation']];
     acc[p['occupation'] as String] = value! + 1;
     return acc;
  });

  print('pacients by profession');
  print(pacientsByProfession);

  print('----------------------------');

  var pacientsResidentsOnSp = pacientsMap.where((p) => p['city'] == 'SP');
  print('pacients who live in SP');
  print(pacientsResidentsOnSp.length);
}
