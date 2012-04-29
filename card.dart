class card extends lib{
  
  var observe_inc = 0;
  
  void generateCard(int player){
       var bingo_card = "";
       for(int inc = 0; inc < player; inc++){
       bingo_card= bingo_card + """
                  <div id='card_$inc' class='card_container'>
                      <ul id='b-row' class='card-row'>
                          <li>B</li>
                          ${this.generateRow(1, 15, false)}
                      </ul>
                      <ul id='i-row' class='card-row'>
                          <li>I</li>
                          ${this.generateRow(16, 30, false)}
                      </ul>
                      <ul id='n-row' class='card-row'>
                          <li>N</li>
                          ${this.generateRow(31, 45, true)}
                      </ul>
                      <ul id='g-row' class='card-row'>
                          <li>G</li>
                          ${this.generateRow(46, 60, false)}
                      </ul>
                      <ul id='o-row' class='card-row'>
                          <li>O</li>
                          ${this.generateRow(61, 75, false)}
                      </ul>
                      <h3 align='center' style="margin:0px;">Card Number ${inc+1}</h3>
                  </div>
                  """;
                  this.observe_inc = 0;
       }
        document.query('#bingo_card').innerHTML = bingo_card;
  }
  
  generateRow(int min, int max, free){
    var row = "";
    int x = 0;
    var row_arr = new List(5);
    while(x < 5){
      if(free && x == 2){
        row = row + "<li id='col_free' class='free' style='background:#FF0'>FREE</li>";
        row_arr[x] = 0;
        x++;
      }else{
        var random_num = this.rand();
        var duplicate = false;
        for(int i = 0; i < 5;i++){
          if(random_num == row_arr[i]){ duplicate = true; }
        }
        if(!duplicate && random_num > min && random_num <= max){
          row = row + "<li id='col_${this.observe_inc}' class='entry'>$random_num</li>";
          row_arr[x] = random_num;
          x++;
          this.observe_inc++;
        }
      }
      
    }
    return row;
  }
  
}
