import 'package:moor/moor.dart';

// User data
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userName => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// Running program
class RunningPrograms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get programName => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// Running program steps
class ProgramSteps extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get runningProgramId => integer()();
  IntColumn get day => integer()();
  IntColumn get distance => integer()();
  IntColumn get calories => integer()();
  BoolColumn get stepFinish => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

// Training time
class TrainingTime extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get programStepsId => integer()();
  IntColumn get seconds => integer()();
  BoolColumn get timeFinished => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}
