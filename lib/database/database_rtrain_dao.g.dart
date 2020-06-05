// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_rtrain_dao.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final int id;
  final String userName;
  final String userImg;
  User({@required this.id, @required this.userName, @required this.userImg});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      userImg: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_img']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || userImg != null) {
      map['user_img'] = Variable<String>(userImg);
    }
    return map;
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      userName: serializer.fromJson<String>(json['userName']),
      userImg: serializer.fromJson<String>(json['userImg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userName': serializer.toJson<String>(userName),
      'userImg': serializer.toJson<String>(userImg),
    };
  }

  User copyWith({int id, String userName, String userImg}) => User(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        userImg: userImg ?? this.userImg,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('userName: $userName, ')
          ..write('userImg: $userImg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(userName.hashCode, userImg.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.userName == this.userName &&
          other.userImg == this.userImg);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> userName;
  final Value<String> userImg;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.userName = const Value.absent(),
    this.userImg = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    @required String userName,
    @required String userImg,
  })  : userName = Value(userName),
        userImg = Value(userImg);
  static Insertable<User> custom({
    Expression<int> id,
    Expression<String> userName,
    Expression<String> userImg,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userName != null) 'user_name': userName,
      if (userImg != null) 'user_img': userImg,
    });
  }

  UsersCompanion copyWith(
      {Value<int> id, Value<String> userName, Value<String> userImg}) {
    return UsersCompanion(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userImg: userImg ?? this.userImg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (userImg.present) {
      map['user_img'] = Variable<String>(userImg.value);
    }
    return map;
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedTextColumn _userName;
  @override
  GeneratedTextColumn get userName => _userName ??= _constructUserName();
  GeneratedTextColumn _constructUserName() {
    return GeneratedTextColumn(
      'user_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userImgMeta = const VerificationMeta('userImg');
  GeneratedTextColumn _userImg;
  @override
  GeneratedTextColumn get userImg => _userImg ??= _constructUserImg();
  GeneratedTextColumn _constructUserImg() {
    return GeneratedTextColumn(
      'user_img',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, userName, userImg];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name'], _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('user_img')) {
      context.handle(_userImgMeta,
          userImg.isAcceptableOrUnknown(data['user_img'], _userImgMeta));
    } else if (isInserting) {
      context.missing(_userImgMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class RunningProgram extends DataClass implements Insertable<RunningProgram> {
  final int id;
  final String programName;
  RunningProgram({@required this.id, @required this.programName});
  factory RunningProgram.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return RunningProgram(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      programName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}program_name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || programName != null) {
      map['program_name'] = Variable<String>(programName);
    }
    return map;
  }

  factory RunningProgram.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RunningProgram(
      id: serializer.fromJson<int>(json['id']),
      programName: serializer.fromJson<String>(json['programName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'programName': serializer.toJson<String>(programName),
    };
  }

  RunningProgram copyWith({int id, String programName}) => RunningProgram(
        id: id ?? this.id,
        programName: programName ?? this.programName,
      );
  @override
  String toString() {
    return (StringBuffer('RunningProgram(')
          ..write('id: $id, ')
          ..write('programName: $programName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, programName.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RunningProgram &&
          other.id == this.id &&
          other.programName == this.programName);
}

class RunningProgramsCompanion extends UpdateCompanion<RunningProgram> {
  final Value<int> id;
  final Value<String> programName;
  const RunningProgramsCompanion({
    this.id = const Value.absent(),
    this.programName = const Value.absent(),
  });
  RunningProgramsCompanion.insert({
    this.id = const Value.absent(),
    @required String programName,
  }) : programName = Value(programName);
  static Insertable<RunningProgram> custom({
    Expression<int> id,
    Expression<String> programName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (programName != null) 'program_name': programName,
    });
  }

  RunningProgramsCompanion copyWith(
      {Value<int> id, Value<String> programName}) {
    return RunningProgramsCompanion(
      id: id ?? this.id,
      programName: programName ?? this.programName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (programName.present) {
      map['program_name'] = Variable<String>(programName.value);
    }
    return map;
  }
}

class $RunningProgramsTable extends RunningPrograms
    with TableInfo<$RunningProgramsTable, RunningProgram> {
  final GeneratedDatabase _db;
  final String _alias;
  $RunningProgramsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _programNameMeta =
      const VerificationMeta('programName');
  GeneratedTextColumn _programName;
  @override
  GeneratedTextColumn get programName =>
      _programName ??= _constructProgramName();
  GeneratedTextColumn _constructProgramName() {
    return GeneratedTextColumn(
      'program_name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, programName];
  @override
  $RunningProgramsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'running_programs';
  @override
  final String actualTableName = 'running_programs';
  @override
  VerificationContext validateIntegrity(Insertable<RunningProgram> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('program_name')) {
      context.handle(
          _programNameMeta,
          programName.isAcceptableOrUnknown(
              data['program_name'], _programNameMeta));
    } else if (isInserting) {
      context.missing(_programNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RunningProgram map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RunningProgram.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RunningProgramsTable createAlias(String alias) {
    return $RunningProgramsTable(_db, alias);
  }
}

class ProgramStep extends DataClass implements Insertable<ProgramStep> {
  final int id;
  final int runningProgramId;
  final int day;
  final int distance;
  final int calories;
  final bool isRest;
  final bool stepFinish;
  final DateTime finishDate;
  ProgramStep(
      {@required this.id,
      @required this.runningProgramId,
      @required this.day,
      this.distance,
      this.calories,
      @required this.isRest,
      @required this.stepFinish,
      this.finishDate});
  factory ProgramStep.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ProgramStep(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      runningProgramId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}running_program_id']),
      day: intType.mapFromDatabaseResponse(data['${effectivePrefix}day']),
      distance:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}distance']),
      calories:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}calories']),
      isRest:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_rest']),
      stepFinish: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}step_finish']),
      finishDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}finish_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || runningProgramId != null) {
      map['running_program_id'] = Variable<int>(runningProgramId);
    }
    if (!nullToAbsent || day != null) {
      map['day'] = Variable<int>(day);
    }
    if (!nullToAbsent || distance != null) {
      map['distance'] = Variable<int>(distance);
    }
    if (!nullToAbsent || calories != null) {
      map['calories'] = Variable<int>(calories);
    }
    if (!nullToAbsent || isRest != null) {
      map['is_rest'] = Variable<bool>(isRest);
    }
    if (!nullToAbsent || stepFinish != null) {
      map['step_finish'] = Variable<bool>(stepFinish);
    }
    if (!nullToAbsent || finishDate != null) {
      map['finish_date'] = Variable<DateTime>(finishDate);
    }
    return map;
  }

  factory ProgramStep.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProgramStep(
      id: serializer.fromJson<int>(json['id']),
      runningProgramId: serializer.fromJson<int>(json['runningProgramId']),
      day: serializer.fromJson<int>(json['day']),
      distance: serializer.fromJson<int>(json['distance']),
      calories: serializer.fromJson<int>(json['calories']),
      isRest: serializer.fromJson<bool>(json['isRest']),
      stepFinish: serializer.fromJson<bool>(json['stepFinish']),
      finishDate: serializer.fromJson<DateTime>(json['finishDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'runningProgramId': serializer.toJson<int>(runningProgramId),
      'day': serializer.toJson<int>(day),
      'distance': serializer.toJson<int>(distance),
      'calories': serializer.toJson<int>(calories),
      'isRest': serializer.toJson<bool>(isRest),
      'stepFinish': serializer.toJson<bool>(stepFinish),
      'finishDate': serializer.toJson<DateTime>(finishDate),
    };
  }

  ProgramStep copyWith(
          {int id,
          int runningProgramId,
          int day,
          int distance,
          int calories,
          bool isRest,
          bool stepFinish,
          DateTime finishDate}) =>
      ProgramStep(
        id: id ?? this.id,
        runningProgramId: runningProgramId ?? this.runningProgramId,
        day: day ?? this.day,
        distance: distance ?? this.distance,
        calories: calories ?? this.calories,
        isRest: isRest ?? this.isRest,
        stepFinish: stepFinish ?? this.stepFinish,
        finishDate: finishDate ?? this.finishDate,
      );
  @override
  String toString() {
    return (StringBuffer('ProgramStep(')
          ..write('id: $id, ')
          ..write('runningProgramId: $runningProgramId, ')
          ..write('day: $day, ')
          ..write('distance: $distance, ')
          ..write('calories: $calories, ')
          ..write('isRest: $isRest, ')
          ..write('stepFinish: $stepFinish, ')
          ..write('finishDate: $finishDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          runningProgramId.hashCode,
          $mrjc(
              day.hashCode,
              $mrjc(
                  distance.hashCode,
                  $mrjc(
                      calories.hashCode,
                      $mrjc(
                          isRest.hashCode,
                          $mrjc(
                              stepFinish.hashCode, finishDate.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ProgramStep &&
          other.id == this.id &&
          other.runningProgramId == this.runningProgramId &&
          other.day == this.day &&
          other.distance == this.distance &&
          other.calories == this.calories &&
          other.isRest == this.isRest &&
          other.stepFinish == this.stepFinish &&
          other.finishDate == this.finishDate);
}

class ProgramStepsCompanion extends UpdateCompanion<ProgramStep> {
  final Value<int> id;
  final Value<int> runningProgramId;
  final Value<int> day;
  final Value<int> distance;
  final Value<int> calories;
  final Value<bool> isRest;
  final Value<bool> stepFinish;
  final Value<DateTime> finishDate;
  const ProgramStepsCompanion({
    this.id = const Value.absent(),
    this.runningProgramId = const Value.absent(),
    this.day = const Value.absent(),
    this.distance = const Value.absent(),
    this.calories = const Value.absent(),
    this.isRest = const Value.absent(),
    this.stepFinish = const Value.absent(),
    this.finishDate = const Value.absent(),
  });
  ProgramStepsCompanion.insert({
    this.id = const Value.absent(),
    @required int runningProgramId,
    @required int day,
    this.distance = const Value.absent(),
    this.calories = const Value.absent(),
    @required bool isRest,
    this.stepFinish = const Value.absent(),
    this.finishDate = const Value.absent(),
  })  : runningProgramId = Value(runningProgramId),
        day = Value(day),
        isRest = Value(isRest);
  static Insertable<ProgramStep> custom({
    Expression<int> id,
    Expression<int> runningProgramId,
    Expression<int> day,
    Expression<int> distance,
    Expression<int> calories,
    Expression<bool> isRest,
    Expression<bool> stepFinish,
    Expression<DateTime> finishDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (runningProgramId != null) 'running_program_id': runningProgramId,
      if (day != null) 'day': day,
      if (distance != null) 'distance': distance,
      if (calories != null) 'calories': calories,
      if (isRest != null) 'is_rest': isRest,
      if (stepFinish != null) 'step_finish': stepFinish,
      if (finishDate != null) 'finish_date': finishDate,
    });
  }

  ProgramStepsCompanion copyWith(
      {Value<int> id,
      Value<int> runningProgramId,
      Value<int> day,
      Value<int> distance,
      Value<int> calories,
      Value<bool> isRest,
      Value<bool> stepFinish,
      Value<DateTime> finishDate}) {
    return ProgramStepsCompanion(
      id: id ?? this.id,
      runningProgramId: runningProgramId ?? this.runningProgramId,
      day: day ?? this.day,
      distance: distance ?? this.distance,
      calories: calories ?? this.calories,
      isRest: isRest ?? this.isRest,
      stepFinish: stepFinish ?? this.stepFinish,
      finishDate: finishDate ?? this.finishDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (runningProgramId.present) {
      map['running_program_id'] = Variable<int>(runningProgramId.value);
    }
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    if (distance.present) {
      map['distance'] = Variable<int>(distance.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    if (isRest.present) {
      map['is_rest'] = Variable<bool>(isRest.value);
    }
    if (stepFinish.present) {
      map['step_finish'] = Variable<bool>(stepFinish.value);
    }
    if (finishDate.present) {
      map['finish_date'] = Variable<DateTime>(finishDate.value);
    }
    return map;
  }
}

class $ProgramStepsTable extends ProgramSteps
    with TableInfo<$ProgramStepsTable, ProgramStep> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProgramStepsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _runningProgramIdMeta =
      const VerificationMeta('runningProgramId');
  GeneratedIntColumn _runningProgramId;
  @override
  GeneratedIntColumn get runningProgramId =>
      _runningProgramId ??= _constructRunningProgramId();
  GeneratedIntColumn _constructRunningProgramId() {
    return GeneratedIntColumn(
      'running_program_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dayMeta = const VerificationMeta('day');
  GeneratedIntColumn _day;
  @override
  GeneratedIntColumn get day => _day ??= _constructDay();
  GeneratedIntColumn _constructDay() {
    return GeneratedIntColumn(
      'day',
      $tableName,
      false,
    );
  }

  final VerificationMeta _distanceMeta = const VerificationMeta('distance');
  GeneratedIntColumn _distance;
  @override
  GeneratedIntColumn get distance => _distance ??= _constructDistance();
  GeneratedIntColumn _constructDistance() {
    return GeneratedIntColumn(
      'distance',
      $tableName,
      true,
    );
  }

  final VerificationMeta _caloriesMeta = const VerificationMeta('calories');
  GeneratedIntColumn _calories;
  @override
  GeneratedIntColumn get calories => _calories ??= _constructCalories();
  GeneratedIntColumn _constructCalories() {
    return GeneratedIntColumn(
      'calories',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isRestMeta = const VerificationMeta('isRest');
  GeneratedBoolColumn _isRest;
  @override
  GeneratedBoolColumn get isRest => _isRest ??= _constructIsRest();
  GeneratedBoolColumn _constructIsRest() {
    return GeneratedBoolColumn(
      'is_rest',
      $tableName,
      false,
    );
  }

  final VerificationMeta _stepFinishMeta = const VerificationMeta('stepFinish');
  GeneratedBoolColumn _stepFinish;
  @override
  GeneratedBoolColumn get stepFinish => _stepFinish ??= _constructStepFinish();
  GeneratedBoolColumn _constructStepFinish() {
    return GeneratedBoolColumn('step_finish', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _finishDateMeta = const VerificationMeta('finishDate');
  GeneratedDateTimeColumn _finishDate;
  @override
  GeneratedDateTimeColumn get finishDate =>
      _finishDate ??= _constructFinishDate();
  GeneratedDateTimeColumn _constructFinishDate() {
    return GeneratedDateTimeColumn(
      'finish_date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        runningProgramId,
        day,
        distance,
        calories,
        isRest,
        stepFinish,
        finishDate
      ];
  @override
  $ProgramStepsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'program_steps';
  @override
  final String actualTableName = 'program_steps';
  @override
  VerificationContext validateIntegrity(Insertable<ProgramStep> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('running_program_id')) {
      context.handle(
          _runningProgramIdMeta,
          runningProgramId.isAcceptableOrUnknown(
              data['running_program_id'], _runningProgramIdMeta));
    } else if (isInserting) {
      context.missing(_runningProgramIdMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
          _dayMeta, day.isAcceptableOrUnknown(data['day'], _dayMeta));
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('distance')) {
      context.handle(_distanceMeta,
          distance.isAcceptableOrUnknown(data['distance'], _distanceMeta));
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories'], _caloriesMeta));
    }
    if (data.containsKey('is_rest')) {
      context.handle(_isRestMeta,
          isRest.isAcceptableOrUnknown(data['is_rest'], _isRestMeta));
    } else if (isInserting) {
      context.missing(_isRestMeta);
    }
    if (data.containsKey('step_finish')) {
      context.handle(
          _stepFinishMeta,
          stepFinish.isAcceptableOrUnknown(
              data['step_finish'], _stepFinishMeta));
    }
    if (data.containsKey('finish_date')) {
      context.handle(
          _finishDateMeta,
          finishDate.isAcceptableOrUnknown(
              data['finish_date'], _finishDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProgramStep map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ProgramStep.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProgramStepsTable createAlias(String alias) {
    return $ProgramStepsTable(_db, alias);
  }
}

class TrainingTimeData extends DataClass
    implements Insertable<TrainingTimeData> {
  final int id;
  final int programStepsId;
  final int seconds;
  final String type;
  final bool timeFinished;
  TrainingTimeData(
      {@required this.id,
      @required this.programStepsId,
      @required this.seconds,
      @required this.type,
      @required this.timeFinished});
  factory TrainingTimeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return TrainingTimeData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      programStepsId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}program_steps_id']),
      seconds:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}seconds']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      timeFinished: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}time_finished']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || programStepsId != null) {
      map['program_steps_id'] = Variable<int>(programStepsId);
    }
    if (!nullToAbsent || seconds != null) {
      map['seconds'] = Variable<int>(seconds);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || timeFinished != null) {
      map['time_finished'] = Variable<bool>(timeFinished);
    }
    return map;
  }

  factory TrainingTimeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TrainingTimeData(
      id: serializer.fromJson<int>(json['id']),
      programStepsId: serializer.fromJson<int>(json['programStepsId']),
      seconds: serializer.fromJson<int>(json['seconds']),
      type: serializer.fromJson<String>(json['type']),
      timeFinished: serializer.fromJson<bool>(json['timeFinished']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'programStepsId': serializer.toJson<int>(programStepsId),
      'seconds': serializer.toJson<int>(seconds),
      'type': serializer.toJson<String>(type),
      'timeFinished': serializer.toJson<bool>(timeFinished),
    };
  }

  TrainingTimeData copyWith(
          {int id,
          int programStepsId,
          int seconds,
          String type,
          bool timeFinished}) =>
      TrainingTimeData(
        id: id ?? this.id,
        programStepsId: programStepsId ?? this.programStepsId,
        seconds: seconds ?? this.seconds,
        type: type ?? this.type,
        timeFinished: timeFinished ?? this.timeFinished,
      );
  @override
  String toString() {
    return (StringBuffer('TrainingTimeData(')
          ..write('id: $id, ')
          ..write('programStepsId: $programStepsId, ')
          ..write('seconds: $seconds, ')
          ..write('type: $type, ')
          ..write('timeFinished: $timeFinished')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          programStepsId.hashCode,
          $mrjc(
              seconds.hashCode, $mrjc(type.hashCode, timeFinished.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TrainingTimeData &&
          other.id == this.id &&
          other.programStepsId == this.programStepsId &&
          other.seconds == this.seconds &&
          other.type == this.type &&
          other.timeFinished == this.timeFinished);
}

class TrainingTimeCompanion extends UpdateCompanion<TrainingTimeData> {
  final Value<int> id;
  final Value<int> programStepsId;
  final Value<int> seconds;
  final Value<String> type;
  final Value<bool> timeFinished;
  const TrainingTimeCompanion({
    this.id = const Value.absent(),
    this.programStepsId = const Value.absent(),
    this.seconds = const Value.absent(),
    this.type = const Value.absent(),
    this.timeFinished = const Value.absent(),
  });
  TrainingTimeCompanion.insert({
    this.id = const Value.absent(),
    @required int programStepsId,
    @required int seconds,
    @required String type,
    this.timeFinished = const Value.absent(),
  })  : programStepsId = Value(programStepsId),
        seconds = Value(seconds),
        type = Value(type);
  static Insertable<TrainingTimeData> custom({
    Expression<int> id,
    Expression<int> programStepsId,
    Expression<int> seconds,
    Expression<String> type,
    Expression<bool> timeFinished,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (programStepsId != null) 'program_steps_id': programStepsId,
      if (seconds != null) 'seconds': seconds,
      if (type != null) 'type': type,
      if (timeFinished != null) 'time_finished': timeFinished,
    });
  }

  TrainingTimeCompanion copyWith(
      {Value<int> id,
      Value<int> programStepsId,
      Value<int> seconds,
      Value<String> type,
      Value<bool> timeFinished}) {
    return TrainingTimeCompanion(
      id: id ?? this.id,
      programStepsId: programStepsId ?? this.programStepsId,
      seconds: seconds ?? this.seconds,
      type: type ?? this.type,
      timeFinished: timeFinished ?? this.timeFinished,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (programStepsId.present) {
      map['program_steps_id'] = Variable<int>(programStepsId.value);
    }
    if (seconds.present) {
      map['seconds'] = Variable<int>(seconds.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (timeFinished.present) {
      map['time_finished'] = Variable<bool>(timeFinished.value);
    }
    return map;
  }
}

class $TrainingTimeTable extends TrainingTime
    with TableInfo<$TrainingTimeTable, TrainingTimeData> {
  final GeneratedDatabase _db;
  final String _alias;
  $TrainingTimeTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _programStepsIdMeta =
      const VerificationMeta('programStepsId');
  GeneratedIntColumn _programStepsId;
  @override
  GeneratedIntColumn get programStepsId =>
      _programStepsId ??= _constructProgramStepsId();
  GeneratedIntColumn _constructProgramStepsId() {
    return GeneratedIntColumn(
      'program_steps_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _secondsMeta = const VerificationMeta('seconds');
  GeneratedIntColumn _seconds;
  @override
  GeneratedIntColumn get seconds => _seconds ??= _constructSeconds();
  GeneratedIntColumn _constructSeconds() {
    return GeneratedIntColumn(
      'seconds',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeFinishedMeta =
      const VerificationMeta('timeFinished');
  GeneratedBoolColumn _timeFinished;
  @override
  GeneratedBoolColumn get timeFinished =>
      _timeFinished ??= _constructTimeFinished();
  GeneratedBoolColumn _constructTimeFinished() {
    return GeneratedBoolColumn('time_finished', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, programStepsId, seconds, type, timeFinished];
  @override
  $TrainingTimeTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'training_time';
  @override
  final String actualTableName = 'training_time';
  @override
  VerificationContext validateIntegrity(Insertable<TrainingTimeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('program_steps_id')) {
      context.handle(
          _programStepsIdMeta,
          programStepsId.isAcceptableOrUnknown(
              data['program_steps_id'], _programStepsIdMeta));
    } else if (isInserting) {
      context.missing(_programStepsIdMeta);
    }
    if (data.containsKey('seconds')) {
      context.handle(_secondsMeta,
          seconds.isAcceptableOrUnknown(data['seconds'], _secondsMeta));
    } else if (isInserting) {
      context.missing(_secondsMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('time_finished')) {
      context.handle(
          _timeFinishedMeta,
          timeFinished.isAcceptableOrUnknown(
              data['time_finished'], _timeFinishedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingTimeData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TrainingTimeData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TrainingTimeTable createAlias(String alias) {
    return $TrainingTimeTable(_db, alias);
  }
}

abstract class _$RtrainDatabase extends GeneratedDatabase {
  _$RtrainDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  $RunningProgramsTable _runningPrograms;
  $RunningProgramsTable get runningPrograms =>
      _runningPrograms ??= $RunningProgramsTable(this);
  $ProgramStepsTable _programSteps;
  $ProgramStepsTable get programSteps =>
      _programSteps ??= $ProgramStepsTable(this);
  $TrainingTimeTable _trainingTime;
  $TrainingTimeTable get trainingTime =>
      _trainingTime ??= $TrainingTimeTable(this);
  RtrainBaseDao _rtrainBaseDao;
  RtrainBaseDao get rtrainBaseDao =>
      _rtrainBaseDao ??= RtrainBaseDao(this as RtrainDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, runningPrograms, programSteps, trainingTime];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$RtrainBaseDaoMixin on DatabaseAccessor<RtrainDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $RunningProgramsTable get runningPrograms => attachedDatabase.runningPrograms;
  $ProgramStepsTable get programSteps => attachedDatabase.programSteps;
  $TrainingTimeTable get trainingTime => attachedDatabase.trainingTime;
}
