/**
 * Created by Tomek on 14.05.2016.
 */
$(document).ready(function(){
    $(".bmanu").click(function(){
        console.log("manu toggle");
        $(".manu").slideToggle();
    });
});

var url='http://localhost:3000/users/1/notfollowback';

$(document).ready(function() {

   table("unfollow");
    $(".not_follow_back").click(function(){
        $(".type-table").empty();
        $(".type-table").append("User not follow back");
        console.log("ok");
        url = 'http://localhost:3000/users/1/notfollowback';
        clean();
        table("unfollow");
    });

    $(".stop_follow").click(function(){
        $(".type-table").empty();
        $(".type-table").append("Stop follow");
        console.log("ok");
        url = 'http://localhost:3000/users/1/stopfollow';
        clean();
        table("ok");
    });
    $(".pokemon").click(function(){
        $(".type-table").empty();
        $(".type-table").append("Pokemon");
        url = 'http://localhost:3000/users/1/pokemon';
        clean();
        table("follow");
    });
} );


function unfollow(ins_id){
    console.log("unfollow");
    $("table .button").append('<input type="button" value="unfollow"/>');
    $("table .button").last().on("click",function(){

        $.ajax({
            type: "POST",
            url: "/instagram/unfollow",
            data:  { id: ins_id },


        });

    });
}

function follow(ins_id){
    console.log("follow");
    $("table .button").append('<input type="button" value="follow"/>');
    $("table .button").last().on("click",function(){
        $.post('/instagram/follow',{ id: ins_id});

    });
}


function table(kind){
    $.getJSON(url ,function(data){
        console.log(url);
        drowTable(data,kind);

    })}

function drowTable(data,kind){
    for(i = 1; i <= data.length; i++){
        drowRow(data[i-1],i,kind);
    }
}

function clean(){
    console.log("clean");
    $('.table-body').empty();

}

function drowRow(data, id,kind){
    console.log(data);



    $('#inst-table > tbody:last').append("<tr>" +
        "<th>" + id + "</th>" +
        "<th>" + data.name + "</th>"+
        "<th class='button'></th>" +
        "</tr>");

    if (kind == "unfollow") {
        unfollow(data.id)
    }
    if(kind == "follow"){
        action =  follow(data.id)}
}