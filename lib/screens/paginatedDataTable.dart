import 'package:flutter/material.dart';
import 'package:flutter_firebase_and_provider_integration/model/StatusCodeModel.dart';
import '../constant.dart';

class PageDataTable extends StatefulWidget {
  const PageDataTable({Key? key}) : super(key: key);

  @override
  State<PageDataTable> createState() => _PageDataTableState();
}

class _PageDataTableState extends State<PageDataTable> {
  List<StatusCode> codeList = statusList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Row(
              children: [
                Text(
                  'Http Status Code List, total ',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  '${codeList.length}',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.amberAccent),
                ),
                const Text(' codes'),
              ],
            ),
            subtitle: Row(
              children: const [
                Text('Long Press', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold), ),
                Text(
                  ' on each row for more information',
                  style: TextStyle(
                    color: basicTextColor,
                  ),
                ),
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
                textTheme: const TextTheme(
                    caption: TextStyle(color: Colors.teal, fontSize: 18)),
                cardColor: fillColor,
                dividerColor: Colors.teal),
            child: Container(
              child: PaginatedDataTable(
                arrowHeadColor: darkTextColor,
                initialFirstRowIndex: 0,
                rowsPerPage: 8,
                columnSpacing: 30,
                showFirstLastButtons: true,
                horizontalMargin: 30,
                columns: getColumns(columns),
                source: _DataSource(context, codeList),
              ),
            ),
          )
        ],
      ),
    );
  }

  final columns = [
    'NO.',
    'Code',
    'Status',
    'Category',
  ];

  List<DataColumn> getColumns(List<String> columns) {
    return columns
        .map((String column) => DataColumn(
              label: Text(column),
            ))
        .toList();
  }
}

class _DataSource extends DataTableSource {
  _DataSource(this.context, this.codeList);

  BuildContext context;
  List<StatusCode> codeList;

  @override
  DataRow? getRow(int index) {
    StatusCode status = codeList[index];
    final cells = [
      (index + 1).toString(),
      status.code,
      status.status,
      status.category,
    ];

    void codeInfo(StatusCode status) {
      Navigator.pushNamed(context, '/code/' + status.code!);
    }

    return DataRow(
      cells: getCells(cells),
      onLongPress: () {
        codeInfo(status);
      },
    );
  }

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text(data, style: const TextStyle(fontSize: 16),))).toList();

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => codeList.length;

  @override
  int get selectedRowCount => 0;
}
