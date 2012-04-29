class game extends card{
  
  void draw(int player_num, get_pattern){
    var x = 0;
    var inc = 0;
    
    while(x < 1){
      var random_num = this.rand();
      
      if(random_num > 0 && random_num < 76){
        var myDiv = document.query("#board_container #col_$random_num");
        if(random_num.toString() == myDiv.innerHTML){
          document.query("#board_container #col_$random_num").style.background = "#FF0";
          document.query("#board_container #col_$random_num").innerHTML = "<strong>$random_num</strong>";
          
          var letter = "";
          if(random_num >= 1 && random_num <= 15){
            letter = "B";
          }else if(random_num >= 16 && random_num <= 30){
            letter = "I";
          }else if(random_num >= 31 && random_num <= 45){
            letter = "N";
          }else if(random_num >= 46 && random_num <= 60){
            letter = "G";
          }else if(random_num >= 61 && random_num <= 75){
            letter = "O";
          }
          
          document.query("#status").innerHTML = "Letter $letter, Number $random_num";
          for(int chk = 0; chk < player_num;chk++){
            for(int incChk = 0; incChk < 24;incChk++){
              var elem = document.query("#card_$chk #col_$incChk");
              if(elem.innerHTML == random_num.toString()){
                elem.style.background = "#FF0";
              }
            }
          }
          x++;
        }
      } 
    }
    
    //PER CARD CHECK
    var status = "";
    var winner = false;
    for(int chk_win = 0; chk_win < player_num;chk_win++){
      if(this.checker(chk_win, get_pattern)){
        window.alert("Card Number ${chk_win+1} BINGO!!!!");
        status = status + "Card Number ${chk_win+1}<br />";
        document.query("#draw").style.display = "none";
        winner = true;
      }
    }
    
    if(winner == true){
      document.query("#status").innerHTML = status + @"Congratulations!! You won 1 Sack of Rice!";
    }
    
  }
  
  checker(int card_num, get_pattern){
    if(get_pattern == "full"){
    for(int winChk = 0; winChk < 24;winChk++){
      var elem = document.query("#card_$card_num #col_$winChk");
      if(elem.style.background != "rgb(255, 255, 0)"){
        return false;
      }
    }
    return true;
    }else{
      var bingo_pattern = this.getPattern(get_pattern);
      
      for(int increm = 0; increm < bingo_pattern.length; increm++){
        var get_index = bingo_pattern[increm];
        var elem = document.query("#card_$card_num #col_$get_index");
        if(elem.style.background != "rgb(255, 255, 0)"){
          return false;
        }
      }
      
      return true;
    }
  }
  
}
