// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class User extends DataClass implements Insertable<User> {
  final String id;
  final String mail;
  final String fullName;
  final String accessToken;
  User(
      {@required this.id,
      @required this.mail,
      @required this.fullName,
      @required this.accessToken});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      mail: stringType.mapFromDatabaseResponse(data['${effectivePrefix}mail']),
      fullName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}full_name']),
      accessToken: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}access_token']),
    );
  }
  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return User(
      id: serializer.fromJson<String>(json['id']),
      mail: serializer.fromJson<String>(json['mail']),
      fullName: serializer.fromJson<String>(json['full_name']),
      accessToken: serializer.fromJson<String>(json['access_token']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<String>(id),
      'mail': serializer.toJson<String>(mail),
      'full_name': serializer.toJson<String>(fullName),
      'access_token': serializer.toJson<String>(accessToken),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<User>>(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      mail: mail == null && nullToAbsent ? const Value.absent() : Value(mail),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      accessToken: accessToken == null && nullToAbsent
          ? const Value.absent()
          : Value(accessToken),
    ) as T;
  }

  User copyWith(
          {String id, String mail, String fullName, String accessToken}) =>
      User(
        id: id ?? this.id,
        mail: mail ?? this.mail,
        fullName: fullName ?? this.fullName,
        accessToken: accessToken ?? this.accessToken,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('mail: $mail, ')
          ..write('fullName: $fullName, ')
          ..write('accessToken: $accessToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(mail.hashCode, $mrjc(fullName.hashCode, accessToken.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is User &&
          other.id == id &&
          other.mail == mail &&
          other.fullName == fullName &&
          other.accessToken == accessToken);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> mail;
  final Value<String> fullName;
  final Value<String> accessToken;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.mail = const Value.absent(),
    this.fullName = const Value.absent(),
    this.accessToken = const Value.absent(),
  });
  UsersCompanion copyWith(
      {Value<String> id,
      Value<String> mail,
      Value<String> fullName,
      Value<String> accessToken}) {
    return UsersCompanion(
      id: id ?? this.id,
      mail: mail ?? this.mail,
      fullName: fullName ?? this.fullName,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mailMeta = const VerificationMeta('mail');
  GeneratedTextColumn _mail;
  @override
  GeneratedTextColumn get mail => _mail ??= _constructMail();
  GeneratedTextColumn _constructMail() {
    return GeneratedTextColumn(
      'mail',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fullNameMeta = const VerificationMeta('fullName');
  GeneratedTextColumn _fullName;
  @override
  GeneratedTextColumn get fullName => _fullName ??= _constructFullName();
  GeneratedTextColumn _constructFullName() {
    return GeneratedTextColumn(
      'full_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _accessTokenMeta =
      const VerificationMeta('accessToken');
  GeneratedTextColumn _accessToken;
  @override
  GeneratedTextColumn get accessToken =>
      _accessToken ??= _constructAccessToken();
  GeneratedTextColumn _constructAccessToken() {
    return GeneratedTextColumn(
      'access_token',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, mail, fullName, accessToken];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(UsersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.mail.present) {
      context.handle(
          _mailMeta, mail.isAcceptableValue(d.mail.value, _mailMeta));
    } else if (mail.isRequired && isInserting) {
      context.missing(_mailMeta);
    }
    if (d.fullName.present) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableValue(d.fullName.value, _fullNameMeta));
    } else if (fullName.isRequired && isInserting) {
      context.missing(_fullNameMeta);
    }
    if (d.accessToken.present) {
      context.handle(_accessTokenMeta,
          accessToken.isAcceptableValue(d.accessToken.value, _accessTokenMeta));
    } else if (accessToken.isRequired && isInserting) {
      context.missing(_accessTokenMeta);
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
  Map<String, Variable> entityToSql(UsersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.mail.present) {
      map['mail'] = Variable<String, StringType>(d.mail.value);
    }
    if (d.fullName.present) {
      map['full_name'] = Variable<String, StringType>(d.fullName.value);
    }
    if (d.accessToken.present) {
      map['access_token'] = Variable<String, StringType>(d.accessToken.value);
    }
    return map;
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class Walkthrough extends DataClass implements Insertable<Walkthrough> {
  final String id;
  final bool hasSeen;
  Walkthrough({@required this.id, @required this.hasSeen});
  factory Walkthrough.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Walkthrough(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      hasSeen:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}has_seen']),
    );
  }
  factory Walkthrough.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Walkthrough(
      id: serializer.fromJson<String>(json['id']),
      hasSeen: serializer.fromJson<bool>(json['hasSeen']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<String>(id),
      'hasSeen': serializer.toJson<bool>(hasSeen),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Walkthrough>>(bool nullToAbsent) {
    return WalkthroughsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      hasSeen: hasSeen == null && nullToAbsent
          ? const Value.absent()
          : Value(hasSeen),
    ) as T;
  }

  Walkthrough copyWith({String id, bool hasSeen}) => Walkthrough(
        id: id ?? this.id,
        hasSeen: hasSeen ?? this.hasSeen,
      );
  @override
  String toString() {
    return (StringBuffer('Walkthrough(')
          ..write('id: $id, ')
          ..write('hasSeen: $hasSeen')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, hasSeen.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Walkthrough && other.id == id && other.hasSeen == hasSeen);
}

class WalkthroughsCompanion extends UpdateCompanion<Walkthrough> {
  final Value<String> id;
  final Value<bool> hasSeen;
  const WalkthroughsCompanion({
    this.id = const Value.absent(),
    this.hasSeen = const Value.absent(),
  });
  WalkthroughsCompanion copyWith({Value<String> id, Value<bool> hasSeen}) {
    return WalkthroughsCompanion(
      id: id ?? this.id,
      hasSeen: hasSeen ?? this.hasSeen,
    );
  }
}

class $WalkthroughsTable extends Walkthroughs
    with TableInfo<$WalkthroughsTable, Walkthrough> {
  final GeneratedDatabase _db;
  final String _alias;
  $WalkthroughsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hasSeenMeta = const VerificationMeta('hasSeen');
  GeneratedBoolColumn _hasSeen;
  @override
  GeneratedBoolColumn get hasSeen => _hasSeen ??= _constructHasSeen();
  GeneratedBoolColumn _constructHasSeen() {
    return GeneratedBoolColumn(
      'has_seen',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, hasSeen];
  @override
  $WalkthroughsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'walkthroughs';
  @override
  final String actualTableName = 'walkthroughs';
  @override
  VerificationContext validateIntegrity(WalkthroughsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.hasSeen.present) {
      context.handle(_hasSeenMeta,
          hasSeen.isAcceptableValue(d.hasSeen.value, _hasSeenMeta));
    } else if (hasSeen.isRequired && isInserting) {
      context.missing(_hasSeenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Walkthrough map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Walkthrough.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(WalkthroughsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.hasSeen.present) {
      map['has_seen'] = Variable<bool, BoolType>(d.hasSeen.value);
    }
    return map;
  }

  @override
  $WalkthroughsTable createAlias(String alias) {
    return $WalkthroughsTable(_db, alias);
  }
}

abstract class _$BlindWindDatabase extends GeneratedDatabase {
  _$BlindWindDatabase(QueryExecutor e)
      : super(const SqlTypeSystem.withDefaults(), e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  $WalkthroughsTable _walkthroughs;
  $WalkthroughsTable get walkthroughs =>
      _walkthroughs ??= $WalkthroughsTable(this);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as BlindWindDatabase);
  WalkthroughDao _walkthroughDao;
  WalkthroughDao get walkthroughDao =>
      _walkthroughDao ??= WalkthroughDao(this as BlindWindDatabase);
  @override
  List<TableInfo> get allTables => [users, walkthroughs];
}
