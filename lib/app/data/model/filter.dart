import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Filter{

  String description;
  IconData icon;
  bool clicked = false;

  Filter.mock(this.description, this.icon);
  Filter();

  List<Filter> mock(){
  List<Filter> filters = new List<Filter>();
  Filter filter = Filter.mock("Arte", Icons.border_color);
  filters.add(filter);
  filter = Filter.mock("Restaurante", Icons.fastfood);
  filters.add(filter);
  filter = Filter.mock("Bar", Icons.local_drink);
  filters.add(filter);
  filter = Filter.mock("Arte", Icons.border_color);
  filters.add(filter);
  filter = Filter.mock("Restaurante", Icons.fastfood);
  filters.add(filter);
  filter = Filter.mock("Bar", Icons.local_drink);
  filters.add(filter);
  return filters;

  }

}