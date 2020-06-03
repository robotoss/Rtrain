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
  /// Test
  ///
}
