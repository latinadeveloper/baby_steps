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

    function formValues(){
        var values = $(this.parentElement).serialize();
        var posting = $.post('.', values);
        var changed_element = this

        posting.done((response)=>{
            if (this.type == "checkbox" )
            $("#form-flash").text(response.perform + " is now saved")
            else
            $("#form-flash").text(response.comment + " is now saved")
        })

    }

    //prevents form from submitting on enter
    $('#new_accomplishment').submit(function(event) {
       event.preventDefault();
    });

    $("#accomplishment_perform").on("change", formValues);

    $("#accomplishment_comment").on("blur", formValues);

    $("#right-button").on("click", function(){
        var skill_id = parseInt($("#accomplishment_skill_id").val()) + 1
        $.getJSON(skill_id).done(accomplishmentResponse)
    })
    $("#left-button").on("click", function(){
        var skill_id = parseInt($("#accomplishment_skill_id").val()) - 1
        $.getJSON(skill_id).done(accomplishmentResponse)
    })
    //request for accomplishment 
   $.getJSON("1").done(accomplishmentResponse)  

}


function currentSkills(skillResponse){
    var skillData = "<h3>Current Skills</h3>" + skillResponse.map(data => `<br>${data["title"]}`).join("");
    $("#currentSkillsData").html(skillData)
}


function accomplishmentResponse(response){ // loads current data
    $("#explore-skills").text(response.skill.title)

    if (response.perform == true)
        $('#accomplishment_perform').prop('checked', true);
    else
        $('#accomplishment_perform').prop('checked', false);

    $("#accomplishment_comment").val(response.comment)

    $("#accomplishment_skill_id").val(response.skill.id)

}





function recentSkills(skillResponse){ //skillReaponse <- array of objects
    var skillData = "<h3>Recent Skills</h3>" + skillResponse.map(data => `<br>${data.skill.title}`).join("");  
    $("#recent5Skills").html(skillData)
}

//   $(function () {
//     $('form').submit(function(event) {
//       event.preventDefault();

//         var values = $(this.parentElement).serialize();
    
//         var posting = $.post(window.location.pathname , values);

//     });
//   });
