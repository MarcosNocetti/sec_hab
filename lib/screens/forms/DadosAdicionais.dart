import 'package:flutter/material.dart';

class DadosAdicionais extends StatefulWidget {
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  const DadosAdicionais(
      {Key? key, required this.onNextPressed, required this.onPreviousPressed})
      : super(key: key);

  @override
  _DadosAdicionaisState createState() => _DadosAdicionaisState();
}

class _DadosAdicionaisState extends State<DadosAdicionais> {
  final _formKey = GlobalKey<FormState>();
  final items = [
    'Escolha uma opção',
    'Ensino fundamental completo',
    'Ensino fundamental incompleto',
    'Ensino medio completo',
    'Ensino fundamental incompleto'
  ];
  late String _cpf;
  late String _nome;
  String dataNascimento = '01/01/2000';
  int idade = 0;
  String selectedValue = 'Escolha uma opção';

  String calcularIdade(String dataNascimento) {
    DateTime hoje = DateTime.now();
    List<String> dataNascimentoSplit = dataNascimento.split('/');
    int dia = int.parse(dataNascimentoSplit[0]);
    int mes = int.parse(dataNascimentoSplit[1]);
    int ano = int.parse(dataNascimentoSplit[2]);
    DateTime dataNascimentoDate = DateTime(ano, mes, dia);
    int idade = hoje.year - dataNascimentoDate.year;
    if (hoje.month < dataNascimentoDate.month ||
        (hoje.month == dataNascimentoDate.month &&
            hoje.day < dataNascimentoDate.day)) {
      idade--;
    }
    return idade.toString();
  }

  void atualizaDataNascimento(String novaData) {
    setState(() {
      dataNascimento = novaData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f2f5),
      appBar: AppBar(
        backgroundColor: const Color(0xfff0f2f5),
        centerTitle: true,
        title: const Text('Titular do Cadastro'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Pais',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Este campo é obrigatório';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _cpf = value;
                  },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Naturalidade',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Este campo é obrigatório';
                  }
                  return null;
                },
                onChanged: (value) {
                  _nome = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Nome do Pai',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Este campo é obrigatório';
                  }
                  return null;
                },
                onChanged: (value) {
                  _nome = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Nome da Mae',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Este campo é obrigatório';
                  }
                  return null;
                },
                onChanged: (value) {
                  _nome = value;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: DropdownButton<String>(
                value: selectedValue,
                onChanged: (newValue) =>
                    setState(() => selectedValue = newValue!),
                items: items
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                    .toList(),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 42,
                underline: const SizedBox(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: DropdownButton<String>(
                value: selectedValue,
                onChanged: (newValue) =>
                    setState(() => selectedValue = newValue!),
                items: items
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                    .toList(),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 42,
                underline: const SizedBox(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: DropdownButton<String>(
                value: selectedValue,
                onChanged: (newValue) =>
                    setState(() => selectedValue = newValue!),
                items: items
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                    .toList(),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 42,
                underline: const SizedBox(),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('CPF: $_cpf');
                            print('Nome: $_nome');
                            widget.onPreviousPressed();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.blue,
                        ),
                        child: const Text('Anterior'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('CPF: $_cpf');
                            print('Nome: $_nome');
                            widget
                                .onNextPressed(); // Chama a função do botão "Próximo" do SliderPage
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                        ),
                        child: const Text('Próximo'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
