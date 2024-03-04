// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mpflutter_wechat_editable/mpflutter_wechat_editable.dart';

class FormWidgetsMPDemo extends StatefulWidget {
  const FormWidgetsMPDemo({super.key});

  @override
  State<FormWidgetsMPDemo> createState() => _FormWidgetsMPDemoState();
}

class _FormWidgetsMPDemoState extends State<FormWidgetsMPDemo> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool? brushedTeeth = false;
  bool enableFeature = false;
  final ctl = TextEditingController(text: "Hello");
  final focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form widgets'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        // Container(
                        //   height: 44,
                        //   width: 300,
                        //   color: Colors.blueGrey,
                        //   child: MPFlutter_Wechat_EditableInput(
                        //     controller: ctl,
                        //     cursorColor: Colors.white,
                        //     style: const TextStyle(
                        //         fontSize: 16, color: Colors.white),
                        //     textAlign: TextAlign.center,
                        //     autofocus: true,
                        //     keyboardType: TextInputType.text,
                        //     textInputAction: TextInputAction.newline,
                        //     onFocus: () {
                        //       print("onFocus");
                        //     },
                        //     onBlur: () {
                        //       print("onBlur");
                        //     },
                        //     onChanged: (value) {
                        //       print("onChanged:" + value);
                        //     },
                        //     onEditingComplete: () {
                        //       print("onEditingComplete");
                        //     },
                        //     onSubmitted: (value) {
                        //       print("onSubmitted:" + value);
                        //       FocusScope.of(context).requestFocus(focusNode2);
                        //     },
                        //   ),
                        // ),
                        // const SizedBox(height: 66),
                        // Container(
                        //   height: 44,
                        //   width: 300,
                        //   color: Colors.pink,
                        //   child: MPFlutter_Wechat_EditableInput(
                        //     focusNode: focusNode2,
                        //     obscureText: true,
                        //   ),
                        // ),
                        MPFlutterTextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Enter a title...',
                            labelText: 'Title',
                          ),
                          onChanged: (value) {
                            setState(() {
                              title = value;
                            });
                          },
                        ),
                        MPFlutterTextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: 'Enter a description...',
                            labelText: 'Description',
                          ),
                          textInputAction: TextInputAction.newline,
                          onChanged: (value) {
                            description = value;
                          },
                          maxLines: 5,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: 'Enter a description...',
                            labelText: 'Description',
                          ),
                          textInputAction: TextInputAction.newline,
                          onChanged: (value) {
                            description = value;
                          },
                          maxLines: 5,
                        ),
                        MPFlutterTextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: 'Enter a description...',
                            labelText: 'Description',
                          ),
                          textInputAction: TextInputAction.newline,
                          onChanged: (value) {
                            description = value;
                          },
                          maxLines: 5,
                        ),
                        MPFlutterTextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: 'Enter a description...',
                            labelText: 'Description',
                          ),
                          textInputAction: TextInputAction.newline,
                          onChanged: (value) {
                            description = value;
                          },
                          maxLines: 5,
                        ),
                        _FormDatePicker(
                          date: date,
                          onChanged: (value) {
                            setState(() {
                              date = value;
                              ctl.text = date.toString();
                            });
                          },
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Estimated value',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Text(
                              intl.NumberFormat.currency(
                                      symbol: "\$", decimalDigits: 0)
                                  .format(maxValue),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Slider(
                              min: 0,
                              max: 500,
                              divisions: 500,
                              value: maxValue,
                              onChanged: (value) {
                                setState(() {
                                  maxValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: brushedTeeth,
                              onChanged: (checked) {
                                setState(() {
                                  brushedTeeth = checked;
                                });
                              },
                            ),
                            Text('Brushed Teeth',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Enable feature',
                                style: Theme.of(context).textTheme.bodyLarge),
                            Switch(
                              value: enableFeature,
                              onChanged: (enabled) {
                                setState(() {
                                  enableFeature = enabled;
                                });
                              },
                            ),
                          ],
                        ),
                      ].expand(
                        (widget) => [
                          widget,
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  State<_FormDatePicker> createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        TextButton(
          child: const Text('Edit'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}
