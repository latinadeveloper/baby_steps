# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

skill_list = 'The baby responds to a voice.
Baby will look at their own hands  and fingers.
Baby will move their eyes around to look for a sound.
Baby will show a type of response when an object slowly moves out of sight.
Baby will look back and forth from on object to another.
Baby plays with a rattle.
Baby likes to repeat the same activity.
Baby uses their mouth and hands to explore objects.
Baby will turn their head and eyes in search of a voice.
Baby will find sound only with their eyes.
Baby will make a movement to continue an activity with the parent.
Baby will reach and hold onto an object.
Baby will be able to hold two different objects.
Baby will tap the parent or toy to repeat the movement.
Baby will work to try to get a toy that is out of reach.
Baby bangs an object on the table.
Baby will follow the path of a toy that moves slowly.
Baby is curious in the sounds objects or toys make.
Baby is able to follow a fast moving toy.
Baby plays up to 3 minutes with 1 toy.
Baby will slide an object on a surface.
Baby will imitate a gesture more than one time.
Baby plays with paper.
Baby will look for a toy that has been hidden.
Baby will look at pictues in a book.
Baby will be able to hold three objects at the same time.
Baby will use another object to get the toy that they want.
Baby will work and move around to get the toy that they are wanting.
Baby is able to take a toy out of a container.
Baby will try to imitate a new gesture after the parent does it.
Baby will make the toy do the same movement to restart it.
Baby uses two different toys or more during play.
Baby will move to get toy that they were initally playing with if it was lost.
Baby will pull a string that has a toy at the end.
Baby will drop  a toy on purpose.
Baby will look towards a sound coming from below him.
Baby takes a ring stack toy apart.
Baby likes to look at pictures in books.
Baby plays with an intended purpose with an object.
Baby will look for a toy that has been hidden but toy is taken away without child seeing that.
Baby will imitate new gestures that he cannot directly see himself doing.
Baby puts toys inside a container.
Baby starts to build a small tower with cubes.
Baby will move around objects to get to the desired toy.
Baby will tap, touch a picture in a book.
Baby shows a preference for a color.
Baby shows a preference for a size.
Baby is able to nest three toy cups.
Baby cries in a single tone.
Baby makes other sounds besides crying.
Baby sometimes makes sucking sounds.
Baby has a variety of cries to indicate different things.
Baby is interested in an object or person for over 1 minute.
Baby watches mouth and eyes as they speak.
Baby coos.
Baby will make some sounds without moving.
Baby now crys in rhythym.
Baby wants to continue with familiar activity.
Baby will say consonants.
Baby responds to music.
Baby will respond to their name when it is called.
Baby will make double consonant sounds such as Mamama Dadada
Baby will lift arms to parents when they want to be picked up.
Baby looks towards familiar people when they are named.
Baby understands good bye or bye bye.
Baby will say "mama" or "dada".""aby will say "ma" "by"
Baby reacts to a single request using gestures.
Baby makes sounds that usually express emotion.
Baby babble with a change in the pitch or tone of their voice.
Baby will start to make a variety of new sounds.
Baby starts to pay attention to words that are common.
Baby will make single consonant sounds.
Baby will show the toy when they are interested in the toy.
Baby responds to "no"""aby
Baby desmonstrates undestanding of some words.
Baby responds to single spoken request.
Baby start to "dance".""aby sta
Baby will babble to themselves when left alone.
Baby will say "ma ma" or "da da".""aby will say "ma m""by w
Babys learning of language may slow down as they learn to walk.
Baby will not talk as they walk.
Baby knows how to point.
The Baby looks at things you point at.
Baby uses single words with intonations to communicate a thought.
Baby says up to 3 words.
Baby welcomes people with vocal signs.
Baby says expressions.
Baby gives toy to parent upon request.
Baby may leave off the end and beginning of words.
Baby uses gestures to tell parent what they want.
Baby will babble with complex arrangement and change in tone and pitch.
'

skill_list.split("\n").each do |t|
   Skill.create(title: t) 
end
