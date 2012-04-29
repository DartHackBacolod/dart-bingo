class board {
  
  void generateBoard(get_pattern){
    
    var bingo_board="""<table cellspacing="10"><tr><td><table id='board_container' border='1' cellpadding='5'>
           <tr id='b-row'>
              <td><strong>B</strong></td>
              ${this.generateRow(1, 15)}
           </tr>
           <tr id='i-row'>
              <td><strong>I</strong></td>
              ${this.generateRow(16, 30)}
           </tr>
           <tr id='n-row'>
              <td><strong>N</strong></td>
              ${this.generateRow(31, 45)}
           </tr>
           <tr id='g-row'>
              <td><strong>G</strong></td>
              ${this.generateRow(46, 60)}
           </tr>
           <tr id='o-row'>
              <td><strong>O</strong></td>
              ${this.generateRow(61, 75)}
           </tr>
        </table></td><td align='center' valign="top"><h2>Pattern of the Day</h2><img src="${getPatternImage(get_pattern)}" /></td></tr></table>
        """;
        document.query('#bingo_board').innerHTML = bingo_board;
  }
  
  generateRow(int min, int max){
    var row = "";
    for(int i = min;i <= max;i++){
     row = row + "<td id='col_$i' style='background:#FFF;'>$i</td>"; 
    }
    return row;
  }
  
  getPatternImage(String id){
    var src = "";
    switch (id) {
      case "C":
        src = "images/letter-C.gif";
        break;
      case "E":
        src = "images/letter-E.gif";
        break;
      case "F":
        src = "images/letter-F.gif";
        break;
      case "N":
        src = "images/letter-N.gif";
        break;
      case "O":
        src = "images/letter-O.gif";
        break;
      default:
        src = "images/full-house.gif";
        break;
    }
    
    return src;
    
  }
  
}
