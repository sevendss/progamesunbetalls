//时间调用
<!--

var dayarray=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
var montharray=new Array("January","February","March","April","May","June","July","August","September","October","November","December");

function getthedate(){
    var mydate=new Date();
    var year=mydate.getYear();
    if (year < 1000)
        year+=1900;
    var day=mydate.getDay();
    var month=mydate.getMonth();
    var daym=mydate.getDate();
    if (daym<10)
        daym="0"+daym;
    var hours=mydate.getHours();
    var minutes=mydate.getMinutes();
    var seconds=mydate.getSeconds();
    /*var dn="AM"
    if (hours>=12)
    dn="PM"
    if (hours>12){
    hours=hours-12
    }*/

    var dn = "";

    /*if (hours==0)
    hours=12*/

    if (minutes<=9)
        minutes="0"+minutes;
    if (seconds<=9)
        seconds="0"+seconds;
    //change font size here
    var cdate="<span class='date-txt'>"+montharray[month]+" "+daym+", "+year+" "+hours+":"+minutes+":"+seconds+" "+dn
    +"</span>";
    if (document.all)
        document.all.clock.innerHTML=cdate;
    else
        document.getElementById("clock").innerHTML=cdate;
}

   
function goforit(){
if (document.all||document.getElementById)
setInterval("getthedate()",1000);
}


//-->
