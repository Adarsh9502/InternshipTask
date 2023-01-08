import 'package:flutter/material.dart';

class CustomMultiselectDropDown extends StatefulWidget {
  final Function(List<String>) selectedList;
  final List<String> listOFStrings;

  const CustomMultiselectDropDown(
      {super.key, required this.listOFStrings, required this.selectedList});

  @override
  createState() {
    return _CustomMultiselectDropDownState();
  }
}

class _CustomMultiselectDropDownState extends State<CustomMultiselectDropDown> {
  List<String> listOFSelectedItem = [];
  String selectedText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: ExpansionTile(
        iconColor: Colors.grey,
        title: Text(
          listOFSelectedItem.isEmpty
              ? "---Select (Max. 3)---"
              : listOFSelectedItem.toString(),
          style: TextStyle(
            color: listOFSelectedItem.isEmpty ? Colors.grey[700] : Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15.0,
          ),
        ),
        children: <Widget>[
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.listOFStrings.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: _ViewItem(
                    item: widget.listOFStrings[index],
                    selected: (val) {
                      selectedText = val;
                      if (listOFSelectedItem.contains(val)) {
                        listOFSelectedItem.remove(val);
                      } else {
                        if (listOFSelectedItem.length < 3) {
                          listOFSelectedItem.add(val);
                        }
                      }
                      widget.selectedList(listOFSelectedItem);
                      setState(() {});
                    },
                    itemSelected: listOFSelectedItem
                        .contains(widget.listOFStrings[index])),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ViewItem extends StatelessWidget {
  final String item;
  final bool itemSelected;
  final Function(String) selected;

  const _ViewItem(
      {required this.item, required this.itemSelected, required this.selected});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        dense: true,
        value: itemSelected,
        onChanged: (val) {
          selected(item);
        },
        activeColor: Colors.blue,
        title: Text(
          item,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 17.0,
          ),
        ));
  }
}
