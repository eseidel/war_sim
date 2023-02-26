import 'package:war_sim/war_sim.dart';

void main(List<String> arguments) {
  final rules = Rules();
  final sim = Simulator.newGame(rules);
  sim.playGame();
  final stats = sim.state.stats;
  print(
      "${sim.winner.name} won in ${stats.roundCount} rounds with ${stats.warCount} wars.");
}
