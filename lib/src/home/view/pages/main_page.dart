// Copyright 2021 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:andrious/src/view.dart';

import 'dart:html' as html;

import 'package:flutter/material.dart' hide Element;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin, StateSet {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          const UseCaseExample(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
