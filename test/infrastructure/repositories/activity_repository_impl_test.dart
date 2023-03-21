import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_my_life_in_order/domain/entities/activity.dart';
import 'package:mocktail/mocktail.dart';

import 'package:get_my_life_in_order/infrastructure/repositories/activity_repository_impl.dart';
import 'package:get_my_life_in_order/infrastructure/utilities/id_generator.dart';

class MockIdGenerator extends Mock implements IdGenerator {}

void main() {
  group('Activities', () {
    test('added activities should be returned on get all', () {
      final idGen = MockIdGenerator();
      when(() => idGen.getNewId()).thenReturn("1");
      final repo = ActivityRepositoryImpl(idGen);
      repo.addActivity("test");
      final acts = repo.getAll().getOrElse((l) => <Activity>[].build());
      expect(acts[0].name , "test");
    });

  });
  group('ID', () {
    test('should generate id', () {
      final idGen = MockIdGenerator();
      when(() => idGen.getNewId()).thenReturn("1");
      final repo = ActivityRepositoryImpl(idGen);
      repo.addActivity("test");
      final acts = repo.getAll().getOrElse((l) => <Activity>[].build());
      expect(acts[0].id , "1");
    });

    test('if id already exists generate again', () {
      final idGen = MockIdGenerator();
      final ids = ['1', '1', '2'];
      when(() => idGen.getNewId()).thenAnswer((_) => ids.removeAt(0));
      final repo = ActivityRepositoryImpl(idGen);
      repo.addActivity("test");
      repo.addActivity("test 2");
      final acts = repo.getAll().getOrElse((l) => <Activity>[].build());
      expect(acts[0].id , "1");
      expect(acts[1].id , "2");
    });
  });
}