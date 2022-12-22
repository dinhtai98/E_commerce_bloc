// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCardEntityCollection on Isar {
  IsarCollection<CardEntity> get cardEntitys => this.collection();
}

const CardEntitySchema = CollectionSchema(
  name: r'CardEntity',
  id: 8921433643831792852,
  properties: {
    r'cVV': PropertySchema(
      id: 0,
      name: r'cVV',
      type: IsarType.dateTime,
    ),
    r'cardHolderName': PropertySchema(
      id: 1,
      name: r'cardHolderName',
      type: IsarType.string,
    ),
    r'cardNumber': PropertySchema(
      id: 2,
      name: r'cardNumber',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 3,
      name: r'date',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _cardEntityEstimateSize,
  serialize: _cardEntitySerialize,
  deserialize: _cardEntityDeserialize,
  deserializeProp: _cardEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cardEntityGetId,
  getLinks: _cardEntityGetLinks,
  attach: _cardEntityAttach,
  version: '3.0.5',
);

int _cardEntityEstimateSize(
  CardEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cardHolderName.length * 3;
  bytesCount += 3 + object.cardNumber.length * 3;
  return bytesCount;
}

void _cardEntitySerialize(
  CardEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.cVV);
  writer.writeString(offsets[1], object.cardHolderName);
  writer.writeString(offsets[2], object.cardNumber);
  writer.writeDateTime(offsets[3], object.date);
}

CardEntity _cardEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CardEntity(
    cVV: reader.readDateTime(offsets[0]),
    cardHolderName: reader.readString(offsets[1]),
    cardNumber: reader.readString(offsets[2]),
    date: reader.readDateTime(offsets[3]),
  );
  object.id = id;
  return object;
}

P _cardEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cardEntityGetId(CardEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cardEntityGetLinks(CardEntity object) {
  return [];
}

void _cardEntityAttach(IsarCollection<dynamic> col, Id id, CardEntity object) {
  object.id = id;
}

extension CardEntityQueryWhereSort
    on QueryBuilder<CardEntity, CardEntity, QWhere> {
  QueryBuilder<CardEntity, CardEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CardEntityQueryWhere
    on QueryBuilder<CardEntity, CardEntity, QWhereClause> {
  QueryBuilder<CardEntity, CardEntity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CardEntityQueryFilter
    on QueryBuilder<CardEntity, CardEntity, QFilterCondition> {
  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> cVVEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cVV',
        value: value,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> cVVGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cVV',
        value: value,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> cVVLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cVV',
        value: value,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> cVVBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cVV',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardHolderNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardHolderNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardHolderNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardHolderNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardHolderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardHolderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardHolderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardHolderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardHolderNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardHolderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardHolderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardHolderName',
        value: '',
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardHolderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardHolderName',
        value: '',
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> cardNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> cardNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> cardNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition>
      cardNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CardEntityQueryObject
    on QueryBuilder<CardEntity, CardEntity, QFilterCondition> {}

extension CardEntityQueryLinks
    on QueryBuilder<CardEntity, CardEntity, QFilterCondition> {}

extension CardEntityQuerySortBy
    on QueryBuilder<CardEntity, CardEntity, QSortBy> {
  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> sortByCVV() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cVV', Sort.asc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> sortByCVVDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cVV', Sort.desc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> sortByCardHolderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardHolderName', Sort.asc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy>
      sortByCardHolderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardHolderName', Sort.desc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> sortByCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.asc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> sortByCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.desc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }
}

extension CardEntityQuerySortThenBy
    on QueryBuilder<CardEntity, CardEntity, QSortThenBy> {
  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> thenByCVV() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cVV', Sort.asc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> thenByCVVDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cVV', Sort.desc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> thenByCardHolderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardHolderName', Sort.asc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy>
      thenByCardHolderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardHolderName', Sort.desc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> thenByCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.asc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> thenByCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.desc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CardEntityQueryWhereDistinct
    on QueryBuilder<CardEntity, CardEntity, QDistinct> {
  QueryBuilder<CardEntity, CardEntity, QDistinct> distinctByCVV() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cVV');
    });
  }

  QueryBuilder<CardEntity, CardEntity, QDistinct> distinctByCardHolderName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardHolderName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QDistinct> distinctByCardNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CardEntity, CardEntity, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }
}

extension CardEntityQueryProperty
    on QueryBuilder<CardEntity, CardEntity, QQueryProperty> {
  QueryBuilder<CardEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CardEntity, DateTime, QQueryOperations> cVVProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cVV');
    });
  }

  QueryBuilder<CardEntity, String, QQueryOperations> cardHolderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardHolderName');
    });
  }

  QueryBuilder<CardEntity, String, QQueryOperations> cardNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardNumber');
    });
  }

  QueryBuilder<CardEntity, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }
}
