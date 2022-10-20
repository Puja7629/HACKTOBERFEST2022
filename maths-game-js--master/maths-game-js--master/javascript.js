var playing = false;
var score;
var action;
var timeremaining;
var correctAnswer;

// if we click on the start/reset
document.getElementById("startreset").onclick = function(){
    //if we are playing
    if(playing == true){
        location.reload();
    }else{
        //if we are not playing//change node to playing
        
        playing = true;
         //set score 0
        score=0;
        document.getElementById("scorevalue").innerHTML=score;
        //show countdown box
        show("timeremaining");
        timeremaining = 60;
         document.getElementById("timeremainingvalue").innerHTML = timeremaining;
        //hide the game of the box
        hide("gameover");
       
        
        //change button text reset
        document.getElementById("startreset").innerHTML = "Reset Game";
        //start countdown
        
        startCountdown();
         //generate new question and multiple answer
        generateQA();
        
        
    }
    
}
 //Clicking on an answer box  
for(i=1;i<5;i++){
    document.getElementById("box"+i).onclick = function(){
    //check if we are playing
    if(playing == true){
        if(this.innerHTML == correctAnswer){
            //correct Answer
            
            //increase score by 1
            score++;
            document.getElementById("scorevalue").innerHTML = score;
             //hide wrong box and show correct box
            hide("wrong");
            show("correct");
            setTimeout(function(){
                hide("correct");
            },1000);
            //generate new q&a
            generateQA();
           }else{
               //wrong answer
               hide("correct");
               show("wrong");
               setTimeout(function(){
                   hide("wrong");
               },1000);
           }
    }
    
}
}

//functions

//start counter
function startCountdown(){
    action = setInterval(function(){
        timeremaining -= 1;
         document.getElementById("timeremainingvalue").innerHTML = timeremaining;
        if(timeremaining == 0){
            //gameover
            stopCountdown();
           show("gameover");
            document.getElementById("gameover").innerHTML = "<p>Game over!</p><p> your score is " + score +"</p>";
            hide("timeremaining");
            hide("correct");
            hide("wrong");
            playing = false;
 document.getElementById("startreset").innerHTML = "Start Game";
            
        }
    },1000);
}   
//stop the counter
function stopCountdown(){
        clearInterval(action);
}
//hide an element
function hide(Id){
    document.getElementById(Id).style.display = "none";
}
// show an element
function show(Id){
    document.getElementById(Id).style.display = "block";
}
//generating questions and multiple answer
function generateQA(){
    var x = 1 + Math.round(9*Math.random());
    var y = 1 + Math.round(9*Math.random());
    correctAnswer=x*y;
document.getElementById("question").innerHTML = x + "x" + y;
    var correctPosition = 1 + Math.round(3*Math.random());
    document.getElementById("box"+correctPosition).innerHTML = correctAnswer; //fill one box with the correct answer
     //fill other boxes with wrong answers
    var answers = [correctAnswer];
     
    for(i=1; i<5; i++){
        if(i != correctPosition){
            var wrongAnswer;
            do{
                wrongAnswer = (1 + Math.round(9*Math.random()))*(1 + Math.round(9*Math.random()));
                
            }
            while(answers.indexOf(wrongAnswer)>-1)
             //wrong answer
             document.getElementById("box"+i).innerHTML = wrongAnswer;
            answers.push(wrongAnswer);
            
        }
    }
    
}
