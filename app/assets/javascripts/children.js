$(function () {
    attachListeners()
});

function attachListeners(){
    $("button#current-skill").on("click", function() {
        // $.get('skills/current.json')
        $.getJSON(window.location.pathname +'/skills/current').done(currentSkills)
        
        
    });

}


function currentSkills(skillResponse){
    var skillData = skillResponse.map(data => `<br>${data["title"]}`).join("");
    $("#test").html(skillData)

}