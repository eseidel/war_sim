import 'package:stats/stats.dart' as stats_package;
import 'package:war_sim/war_sim.dart';

void printAggregateStatistics(List<Stats> gameStats) {
  void printStats(String label, Iterable<int> values) {
    var stats = stats_package.Stats.fromData(values);
    print("$label: ${stats.withPrecision(3)}");
  }

  printStats("Rounds", gameStats.map((stats) => stats.roundCount));
  printStats("Wars", gameStats.map((stats) => stats.warCount));
}

List<Stats> runSimulations(Rules rules, int count) {
  final gameStats = <Stats>[];
  for (int i = 0; i < count; i++) {
    final sim = Simulator.newGame(rules);
    sim.playGame();
    gameStats.add(sim.state.stats);
  }
  return gameStats;
}

void main(List<String> arguments) {
  final rules = Rules();
  final gameStats = runSimulations(rules, 10000);
  printAggregateStatistics(gameStats);
}
