class lib {
  
  rand(){
    Date now = new Date.now();
    var get_random = now.seconds;
    var x = ((Math.random()*Math.random()*get_random)*100).toInt();
    return x;
  }
  
  getPattern(String id){
    var set_pattern = new List();
    switch (id) {
      case "C":
        set_pattern = [0,1,2,3,4,5,9,10,13,14,18,19,23];
        break;
      case "E":
        set_pattern = [0,1,2,3,4,5,7,9,10,13,14,18,19,23];
        break;
      case "F":
        set_pattern = [0,1,2,3,4,5,7,10,14,19];
        break;
      case "N":
        set_pattern = [0,1,2,3,4,6,17,19,20,21,22,23];
        break;
      case "O":
        set_pattern = [1,2,3,5,9,10,13,14,18,20,21,22];
        break;
      default:
        break;
    }
    
    return set_pattern;
    
  }
  
}
