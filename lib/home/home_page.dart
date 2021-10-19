import 'package:api_documentacao/home/data_row_page.dart';
import 'package:api_documentacao/home/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF191d32),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child:  ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Visão geral",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.builder(context, 0.03)),
                  ),
                ),
                Text(
                  "O objetivo desta documentação é orientar o desenvolvedor sobre "
                  "como integrar com a API Universidades, descrevendo as "
                  "funcionalidades, os métodos a serem utilizados, listando informações "
                  "a serem enviadas e recebidas, e provendo exemplos.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: Responsive.builder(context, 0.017)),
                ),
                const SizedBox(height: 80,),

                Text(
                  "URL Default",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: Responsive.builder(context, 0.025)),
                ),
                const SizedBox(height: 20,),

                Card(
                  color: Colors.white.withOpacity(0.8),
                  child: ListTile(
                    title: const SelectableText(
                        "https://api-universidades.vercel.app"),
                    trailing: IconButton(
                        icon: const Icon(Icons.copy_all),
                        color: Colors.red,
                        onPressed: () {
                          Clipboard.setData(const ClipboardData(
                                  text: "https://api-universidades.vercel.app"))
                              .then((value) {
                            //only if ->
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.greenAccent,
                                content: Text(
                                  "Copiado com sucesso!",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                duration: Duration(milliseconds: 800),
                              ),
                            );
                          });
                        }),
                  ),
                ),
                const SizedBox(height: 60,),

                Text(
                  "Requisição",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: Responsive.builder(context, 0.025)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.indigoAccent,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                    title: Card(
                      color: Colors.white.withOpacity(0.8),
                      child: ListTile(
                        title: const SelectableText("/api/universidades"),
                        trailing: IconButton(
                            icon: const Icon(Icons.copy_all),
                            color: Colors.red,
                            onPressed: () {
                              Clipboard.setData(const ClipboardData(
                                      text: "/api/universidades"))
                                  .then((value) {
                                //only if ->
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.greenAccent,
                                    content: Text(
                                      "Copiado com sucesso!",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    duration: Duration(milliseconds: 800),
                                  ),
                                );
                              });
                            }),
                      ),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("GET",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: Responsive.builder(context, 0.022))),
                    ),
                  ),
                ),
                const SizedBox(height: 60,),

                Text(
                  "Resposta",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: Responsive.builder(context, 0.025)),
                ),
                const SizedBox(height: 20,),

                Card(
                  color: Colors.black.withOpacity(0.5),
                  child: ListTile(
                    title: SelectableText(textJson, style: const TextStyle(color: Colors.grey),),
                  ),
                ),
                const SizedBox(height: 20,),

                if(MediaQuery.of(context).size.width > 600)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DataTable(
                          headingRowColor: MaterialStateProperty.all(Colors.grey.shade800.withOpacity(0.4)),
                          dataRowColor: MaterialStateProperty.all(Colors.grey.shade600.withOpacity(0.4)),
                          columns: const [
                            DataColumn(label: Text('Propriedade', style: TextStyle(color: Colors.white70),)),
                            DataColumn(label: Text('Descrição', style: TextStyle(color: Colors.white70),)),
                            DataColumn(label: Text('Tipo', style: TextStyle(color: Colors.white70),)),
                          ],
                          rows: [
                            getDataRow(text1: 'id', text2: 'Identificador único', text3: 'INT'),
                            getDataRow(text1: 'full_name', text2: 'Nome Completo da Instituição', text3: 'String'),
                            getDataRow(text1: 'name', text2: 'Sigla da Instituição', text3: 'String'),
                            getDataRow(text1: 'ibge', text2: 'Código IBGE do município', text3: 'String'),
                            getDataRow(text1: 'city', text2: 'A cidade onde a Instituição está localizada', text3: 'String'),
                            getDataRow(text1: 'uf', text2: 'O estado onde a Instituição está localizada', text3: 'String'),
                            getDataRow(text1: 'zipcode', text2: 'CEP da Instituição', text3: 'String'),

                            if(MediaQuery.of(context).size.width < 1200)
                            ...[
                              getDataRow(text1: 'street', text2: 'A rua onde a Instituição está localizada', text3: 'String'),
                              getDataRow(text1: 'number', text2: 'Número da Instituição', text3: 'String'),
                              getDataRow(text1: 'neighborhood', text2: 'O bairro onde a Instituição está localizada', text3: 'String'),
                              getDataRow(text1: 'phone', text2: 'Telefone de contato', text3: 'String'),
                              getDataRow(text1: 'created_at', text2: 'Quando foi criado', text3: 'String'),
                              getDataRow(text1: 'updated_at', text2: 'Quando foi atualizado', text3: 'String'),
                            ]
                          ]
                      ),

                      if(MediaQuery.of(context).size.width == 1200)
                      DataTable(
                          headingRowColor: MaterialStateProperty.all(Colors.grey.shade800.withOpacity(0.4)),
                          dataRowColor: MaterialStateProperty.all(Colors.grey.shade600.withOpacity(0.4)),
                          columns: const [
                            DataColumn(label: Text('Propriedade', style: TextStyle(color: Colors.white70),)),
                            DataColumn(label: Text('Descrição', style: TextStyle(color: Colors.white70),)),
                            DataColumn(label: Text('Tipo', style: TextStyle(color: Colors.white70),)),
                          ],
                          rows: [
                            getDataRow(text1: 'street', text2: 'A rua onde a Instituição está localizada', text3: 'String'),
                            getDataRow(text1: 'number', text2: 'Número da Instituição', text3: 'String'),
                            getDataRow(text1: 'neighborhood', text2: 'O bairro onde a Instituição está localizada', text3: 'String'),
                            getDataRow(text1: 'phone', text2: 'Telefone de contato', text3: 'String'),
                            getDataRow(text1: 'created_at', text2: 'Quando foi criado', text3: 'String'),
                            getDataRow(text1: 'updated_at', text2: 'Quando foi atualizado', text3: 'String'),
                          ]
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                    onTap: () {
                      print(MediaQuery.of(context).size.width);
                    },
                    child: Text('Click aqui'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  final String textJson =
  """\n{
      "id": 1,
      "full_name": "UNIVERSIDADE FEDERAL DE MATO GROSSO",
      "name": "UFMT",
      "ibge": "5103403",
      "city": "CUIABA",
      "uf": "MT",
      "zipcode": "78060900",
      "street": "AVENIDA FERNANDO CORREA DA COSTA",
      "number": "2367",
      "neighborhood": "BOA ESPERANÇA",
      "phone": "(65) 3615 8302",
      "created_at": "2020-08-30T02:50:17.000Z",
      "updated_at": "2020-11-27T18:40:06.000Z"
}\n""";
}
