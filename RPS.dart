import 'dart:io';

List<String>moves= ['rock','paper','scissors'];

/// Gets a player's name or uses a default if left blank
String getPlayerName(String label, String defaultName){
  stdout.write('Enter $label name:');
  String? name = stdin.readLineSync();
  if(name ==null || name.trim().isEmpty){
    print('(No name entered. using "$defaultName".)');
    return defaultName;
  }
  return name.trim();
}

///Returns the move in lowercase if valid, or null if not.
String? checkMove(String? move){
  if(move == null) return null;
  String clean = move.trim().toLowerCase();
  return moves.contains(clean) ? clean : null;
}

///Keeps asking until the player gives a valid move.
String getMove(String player){
  String? move;
  while (move==null){
    stdout.write('$player, enter your move(rock/paper/scissors):');
    move=checkMove(stdin.readLineSync());
    if(move==null)print('Invalid move. Please type rock,paper, or scissors.');

  }
  return move;
}


///Returns the winner's name, or null if it's draw.
String? decideWinner(String p1, String m1, String p2, String m2){
  if (m1 == m2) return null;
  if((m1=='rock'&&m2=='scissors') || (m1=='paper'&&m2== 'rock') || (m1 =='scissors'&&m2=='paper')){
    return p1;

  }
  return p2;
}

void main(){
  print("=====ROCK, PAPER, SCISSORS=====");
  String p1 = getPlayerName('Player 1', 'Player 1');
  String p2 = getPlayerName('Player 2','Player 2');
  int score1= 0, score2 =0, round =1;
  String again = 'y';

  do{
    print('\n---Round $round---');
    String m1 = getMove(p1);
    print('');
    for (int i=0; i<30; i++) print('');
    String m2 = getMove(p2);


    String? winner = decideWinner(p1, m1, p2, m2);
    if(winner == null){
      print("Result: It's a draw!");
    }else{
      print('Result:$winner wins the round!');
      winner == p1 ? score1++ :score2++;

    }

    print('Score -> $p1: $score1, $p2: $score2');
    stdout.write('\nPlay again? (y/n): ');
    String? answer = stdin.readLineSync();
    again = answer ==null ? 'n': answer.trim().toLowerCase();
    round++;
  }while(again == 'y');


  print('\n====FINAL SCORE ====');
  print('$p1: $score1 | $p2: $score2');
  String overall= score1 > score2? p1: (score2 > score1? p2: "It's a tie!!");
  print('Overall winner: $overall');
  
}
