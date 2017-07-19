$(function () {
    attachListeners()
});

function attachListeners(){
    $("button#current-skill").on("click", function() {
        // $.get('skills/current.json')
        $.getJSON(window.location.pathname +'/skills/current').done(currentSkills)             
    });

    $("button#recent-skill").on("click", function() {
        $.getJSON(window.location.pathname +'/skills/recent').done(recentSkills)             
    });

    //request for accomplishment 
   $.getJSON("1").done(accomplishmentResponse)  

}


function currentSkills(skillResponse){
    var skillData = "<h3>Current Skills</h3>" + skillResponse.map(data => `<br>${data["title"]}`).join("");
    $("#currentSkillsData").html(skillData)
}

function recentSkills(skillResponse){
    var skillData = "<h3>Recent Skills</h3>" + skillResponse.map(data => `<br>${data["title"]}`).join("");  
    $("#recent5Skills").html(skillData)
}

function accomplishmentResponse(response){
    $("#explore-skills").text(response.skill.title)

    if (response.perform == true)
        $('#accomplishment_perform').attr('checked', true);
    else
        $('#accomplishment_perform').attr('checked', false);

    $("#accomplishment_comment").val(response.comment)

    
}

