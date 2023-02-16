import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/db/todo_database.dart';

final databaseProvider = Provider((ref) => TodoDatabase());
