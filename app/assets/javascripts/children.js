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
        var values = $("#new_accomplishment").serialize();
        var posting = $.post('.', values);

        posting.done((response)=>{
            if (this.type == "checkbox" ){
                var flash_text = response.perform ? 'mastered skill' : 'still working on skill'
                $("#form-flash").text(flash_text)
            }
            else
            $("#form-flash").text(response.comment + " is now saved")
        })
    }

    $("#accomplishment_perform").on("change", formValues);//the checkbox

    $("#accomplishment_comment").on("blur", formValues);//the comment

     //prevents form from submitting on enter
    $('#new_accomplishment').submit(function(event) {
       event.preventDefault();
    });

    // Next and Back
    $("#right-button").on("click", function(){
        var skill_id = parseInt($("#accomplishment_skill_id").val()) + 1
        $.getJSON(skill_id).done(accomplishmentResponse)
    })
    $("#left-button").on("click", function(){
        var skill_id = parseInt($("#accomplishment_skill_id").val()) - 1
        $.getJSON(skill_id).done(accomplishmentResponse)
    })
    //request for accomplishment with getJSON
    // $.getJSON("1").done(accomplishmentResponse)

} // end listeners


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

//ES5 class
function Accomplishment(title, comment){
    this.title = title;
    this.comment = comment;
}
Accomplishment.prototype.displayRecentSkill = function() {
     return this.title + "-- Comment: --" + this.comment
}

//ES 6 class
// class Accomplishment {
//   constructor(title, comment) {
//     this.title = title;
//     this.comment = comment;
//   }

//   displayRecentSkill(){
//     return this.title + "-- Comment: --" + this.comment
//   }
// }

function recentSkills(skillResponse){ //skillReaponse <- array of objects    
    var accomplishments = skillResponse.map(data => new Accomplishment(data.skill.title, data.comment))
    var skillData = "<h3>Recent Skills</h3>" + accomplishments.map(acc => `<br>${acc.displayRecentSkill()}`).join("");  
    
    $("#recent5Skills").html(skillData)
}
