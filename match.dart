import 'dart:io';

class Team {
  String name;
  List<int> scores = [];
  double runRate = 0.0;

  Team({required this.name});

  void addScore(int run) {
    scores.add(run);
  }

  int getTotalRuns() {
    return scores.reduce((value, element) => value + element);
  }

  void calculateRunRate() {
    int totalOvers = 2;
    runRate = getTotalRuns() / totalOvers;
  }
}

void main() {
  print("PSL 2 Overs Match");
  print(" Khul Ke Khel Pyare Kb Tak Tu Darega");
  print("=====================================");

  Team karachiKings = Team(name: "Karachi Kings");
  Team lahoreQalanders = Team(name: "Lahore Qalanders");

  print("Karachi Kings Batting:");
  print("=============================");
  inputScores(karachiKings);
  print("Lahore Qalanders Batting:");
  print("=============================");
  inputScores(lahoreQalanders);

  karachiKings.calculateRunRate();
  lahoreQalanders.calculateRunRate();

  displayResults(karachiKings, lahoreQalanders);
}

void inputScores(Team team) {
  for (int over = 1; over <= 2; over++) {
    print("Over $over for ${team.name}. Enter runs for each ball (separated by space):");
    String? input = stdin.readLineSync();
    List<int> runs = input!.split(' ').map((run) => int.tryParse(run) ?? 0).toList();
    runs.forEach((run) => team.addScore(run));
  }
}

void displayResults(Team team1, Team team2) {
  print("\nFinal Scores:");
  print("${team1.name}: ${team1.getTotalRuns()} runs, Run Rate: ${team1.runRate.toStringAsFixed(2)}");
  print("${team2.name}: ${team2.getTotalRuns()} runs, Run Rate: ${team2.runRate.toStringAsFixed(2)}");

  if (team1.getTotalRuns() > team2.getTotalRuns()) {
    print("${team1.name} wins!");
  } else if (team1.getTotalRuns() < team2.getTotalRuns()) {
    print("${team2.name} wins!");
  } else {
    print("The match is a tie!");
  }
}
