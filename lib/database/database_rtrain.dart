import 'package:moor/moor.dart';

// User data
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userName => text()();
  TextColumn get userImg => text()();

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
  IntColumn get distance => integer().nullable()();
  IntColumn get calories => integer().nullable()();
  BoolColumn get isRest => boolean()();
  BoolColumn get stepFinish => boolean().withDefault(Constant(false))();
  DateTimeColumn get finishDate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Training time
class TrainingTime extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get programStepsId => integer()();
  IntColumn get seconds => integer()();
  TextColumn get type => text()();
  BoolColumn get timeFinished => boolean().withDefault(Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
