part of 'database_rtrain_dao.dart';

@UseDao(tables: [Users, RunningPrograms, ProgramSteps, TrainingTime])
class RtrainBaseDao extends DatabaseAccessor<RtrainDatabase>
    with _$RtrainBaseDaoMixin {
  final RtrainDatabase db;

  RtrainBaseDao(this.db) : super(db);

  ///
  /// User
  ///

  Future<User> getUser() {
    return (select(users)..where((t) => t.id.equals(0))).getSingle();
  }

  Future insertUser(User user) => into(users).insert(user);

  Future deleteUser(User user) => delete(users).delete(user);

  ///
  /// Programs
  ///

  Future<List<RunningProgram>> getAllPrograms() =>
      select(runningPrograms).get();

  Future insertRunningProgram(RunningProgram program) =>
      into(runningPrograms).insert(program);

  ///
  /// Programs steps
  ///

  Future<void> insertMultipleProgramsSteps(
      List<ProgramStep> programStepsList) async {
    await batch((batch) {
      batch.insertAll(programSteps, programStepsList);
    });
  }

  Future<List<ProgramStep>> getProgramsSteps() => select(programSteps).get();

  Future<ProgramWithTime> getProgramsStep(int stepId) async {
    ProgramWithTime _programmWithTime = ProgramWithTime();

    var steps = await (select(programSteps)
          ..where((tbl) => tbl.id.equals(stepId)))
        .get();
    _programmWithTime.programmInfo = steps[0];
    var times = await (select(trainingTime)
          ..where((tbl) => tbl.programStepsId.equals(steps[0].id)))
        .get();
    _programmWithTime.trainigTime = times;

    return _programmWithTime;
  }

  ///
  /// Programs time parts
  ///

  Future<void> insertMultipleTimeParts(
      List<TrainingTimeData> timePartsList) async {
    await batch((batch) {
      batch.insertAll(trainingTime, timePartsList);
    });
  }
}
