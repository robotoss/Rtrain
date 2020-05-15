part of 'database_rtrain_dao.dart';

@UseDao(tables: [Users, RunningPrograms, ProgramSteps, TrainingTime])
class RtrainBaseDao extends DatabaseAccessor<RtrainDatabase>
    with _$RtrainBaseDaoMixin {
  final RtrainDatabase db;

  RtrainBaseDao(this.db) : super(db);

  ///
  /// User
  ///

  Future<List<User>> getUser() async =>
      await (select(users)..where((tbl) => tbl.id.equals(0))).get();

  Future insertUser(User user) => into(users).insert(user);

  Future deleteUser(User user) => delete(users).delete(user);

  ///
  /// Test
  ///
}
