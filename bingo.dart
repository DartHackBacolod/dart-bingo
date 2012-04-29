#import('dart:html');
#source('board.dart');
#source('card.dart');
#source('game.dart');
#source('lib.dart');

class controls{
  
  void toggleWeb(){
    var avatar = document.query("#avatar");
    var webcam = document.query("#webcam-container");
    
    var display_avatar = avatar.style.display;
    
    if(display_avatar == "none"){
      avatar.style.display = "block";
      webcam.style.display = "none";
    }else{
      webcam.style.display = "block";
      avatar.style.display = "none";
    }
    
  }
  
}

void main() {
  var players = 0;
  var get_pattern = "full";
  document.query("#play").on.click.add((e) {
    document.query("#bingo_setter").style.display = "none";
    document.query("#game_container").style.display = "block";
    
    window.setTimeout((){ 
    var select_pattern = document.query("#bingo_pattern");
    get_pattern = select_pattern.value;
    var go_play = document.query("#num_players");
    players = Math.parseInt("${go_play.value}");
    new board().generateBoard(get_pattern);
    new card().generateCard(players); 
    document.query("#draw_button").style.display = "block";
    document.query("#talk-table").style.display = "block";
    }, 1000);
    
  });
  
  document.query("#draw").on.click.add((e){ new game().draw(players, get_pattern); });
  document.query("#toggle-web").on.click.add((e){ new controls().toggleWeb(); });
}
