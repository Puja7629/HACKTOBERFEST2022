$(function(){
    var mode=0;
    var timecounter=0;
    var lapcounter=0;
    var action;
    var lapnumber=0;
    var timeMinutes,timeSeconds,timeCentiseconds,lapMinutes,lapSeconds,lapCentiseconds;
    hideshowButtons("#startButton","#lapButton");
    $('#startButton').click(function(){
        mode=1;
        hideshowButtons("#stopButton","#lapButton");
        startAction();
    })

    $("#stopButton").click(function(){
        hideshowButtons("#resumeButton","#resetButton");
        clearInterval(action);
    });
    $("#resumeButton").click(function(){
        hideshowButtons("#stopButton","#lapButton");
        startAction(action);
    });
    $("#resetButton").click(function(){
       location.reload();
    });
    $("#lapButton").click(function(){
        if(mode){
            clearInterval(action);
            lapcounter=0;
            addlap();
            startAction(action);
        }
     });

    function hideshowButtons(x,y){
        $(".control").hide();
        $(x).show();
        $(y).show();

    }
    //start the counter
    function startAction(){
        action=setInterval(function(){
            timecounter++;
            if(timecounter==100*60*100){
                timecounter=0;

            }
            lapcounter++;
            if(lapcounter==100*60*100){
                lapcounter=0;

            }
            updateTime();
        },10);
    }
    //updateTime:converts counters to min,sec,centisec
    function updateTime(){
        //1min=60*100centiseconds=6000centiseconds
        timeMinutes=Math.floor(timecounter/6000);
        //1sec=100centiseconds
        timeSeconds=Math.floor((timecounter%6000)/100);
        timeCentiseconds=(timecounter%6000)%100;
        $("#timeminute").text(format(timeMinutes));
        $("#timesecond").text(format(timeSeconds));
        $("#timecentisecond").text(format(timeCentiseconds));

        


         //1min=60*100centiseconds=6000centiseconds
         lapMinutes=Math.floor(lapcounter/6000);
         //1sec=100centiseconds
         lapSeconds=Math.floor((lapcounter%6000)/100);
         lapCentiseconds=(lapcounter%6000)%100;

         $("#lapminute").text(format(lapMinutes));
        $("#lapsecond").text(format(lapSeconds));
        $("#lapcentisecond").text(format(lapCentiseconds));
    }
    function  format(number){
        if(number<10){
            return '0'+number;
        }
        else
        {
            return number;
        }

    }
    function addlap(){
        lapnumber++;
        var mylapDetails =
        '<div class="lap">'+
        '<div class="laptimetitle">'+
        'Lap'+lapnumber+
        '</div>'+
        '<div class="laptime">'+
        '<span>'+format(lapMinutes)+'</span>'+
        ':<span>'+format(lapSeconds)+'</span>'+
        ':<span>'+format(lapCentiseconds)+'</span>'+
        '</div>'+
        '</div>';
        $(mylapDetails).prependTo("#laps");
    }
   
});