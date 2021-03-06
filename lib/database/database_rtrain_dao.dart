import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:r_train/data/model/program_with_time.dart';
import 'database_rtrain.dart';

import 'package:path/path.dart' as p;

part 'database_rtrain_dao.g.dart';
part 'database_methods.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db_rtrain.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(
    tables: [Users, RunningPrograms, ProgramSteps, TrainingTime],
    daos: [RtrainBaseDao])
class RtrainDatabase extends _$RtrainDatabase {
  RtrainDatabase() : super(_openConnection());

  //Database version
  @override
  int get schemaVersion => 1;
}
