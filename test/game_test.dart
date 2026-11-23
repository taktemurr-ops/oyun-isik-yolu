import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_isik_yolu/oyun_isik_yolu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(isikYoluConfig.title.length, 33);
    expect(isikYoluConfig.tagline.length, 33);
    for (final s in isikYoluConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(isikYoluConfig.gameId, isikYoluId);
    expect(isikYoluRules.gameId, isikYoluId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(isikYoluRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: isikYoluId, optionalMechanics: isikYoluRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(isikYoluRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
