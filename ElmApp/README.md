# Elm App

## Update:
After digging further into other parts of Elm, my position has changed.

It turned out there were parts of Elm that I had just plain missed. One of the
biggest ones being it's interop system with JavaScript that's overall really
well laid out. It works by as series of messages sent out from Elm to JavaScript
and a series of messages sent in to Elm, humorously called "suggestions". This
means that Elm is **significantly** less cut off from the JavaScript ecosystem
than I had at first though.

The reason that I was having so much trouble finding things to do drag-and-drop
in Elm is probably because as it stands, the better option is to just delegate
something that messy out to JavaScript and let it deal with the chaotic world of
people dragging things all over the place. While Elm is a very expressive
language, trying to make a pure functional language handle drag-and-drop just
feels like a recipe for ugly, brittle code. I would much rather just delegate
out to something nice, like the amazing Dragula library, and have it tell me
when things have moved. It might also be better to delegate all of the HTTP
calls out to JavaScript, and not deal with the craziness of the external world
of HTTP servers in Elm.

Overall, while I still do have concerns about the ability of others to
contribute to a project in a language that seems very foreign, modern JavaScript
in the form of ES6 or ES7 present no small amount of strange new concepts
themselves; at least from the perspective of a beginner.

My verdict, as Elm vs Something else goes:
  - Elm is inherently type safe.
  - It's types are **significantly** more expressive than the competition,
    (TypeScript, Flow, etc).
  - It has a noticeable performance boost over React and other, especially on
    mobile.
  - It's debugger is significantly nicer than it's competition.
  - It supports the JavaScript ecosystem well through interface channels.

Everything has a list of cons, but I've found Elm's to be the smallest, it's
only real con at this point is "it looks weird", which can be easily overcome.


## Overall:
Success, but not ready for production.

**Abstract:** The goal of this was to evaluate Elm as a language to write a
client side app for MekManager in. Among concerns were Elm's ability to create
reliable code on the client and be something that others could feel comfortable
contributing too. Elm's ability to perform what were considered to be necessary
tasks like animation and drag-and-drop were also taken into consideration.

### Reliable Code:
Here Elm passed with flying colors. During the time developing this I never had
a single run time error, while admittedly I did run into my fair share of
cryptic compiler errors, most of them where the very helpful error messages that
Elm has become known for. At no point did my code compile, but I still had some
issue with the logic of my application.

### Ability to Contribute:
This was something that I personally felt that Elm would do very well at,
however upon reviewing the code with other developers I found the consensus to
be that the code looked very foreign, and therefor hard to read. Considering
that a lot of the contributions that I would expect to come to MekManager may be
from first time developers, or people just learning to program, this could
present a significant hurdle.

### Animation, Drag-and-drop, UX in general:
Here is where I feel that Elm fell flat. That isn't an overall character
judgment, Elm is still only at version 0.17 at time of writing, and I'm sure
that if it continues down the path that it's on, it will get there. At the
moment however, I found several things I would consider to be basic things I
would expect out of the language that just weren't there.
  - Being able to clear out inputs
  - Drag-and-drop support
  - Well documented animation

Most of the things that I set out to find in this category were either not there
or they are currently in a position where they exist, but are poorly documented
and very hard to use as a result of it. Drag and drop needs to be implemented by
hand, and it seems like it's the sort of thing that is difficult to generalize.

### Final thoughts:
Elm is a language heading in a very positive direction, given some more time to
mature I think Elm could be a very solid technology choice. But for the kind of
application that MekManager is, there are some UX requirements that are just not
met at the time of writing.
