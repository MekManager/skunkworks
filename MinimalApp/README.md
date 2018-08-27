# Minimal App

### Overall:
Success, but with reservations.

**Abstract**: The goal here is to test if a single page app can be reliably built
without bringing in a flavor of the week sort of library like React or Vue. Not
that there's strictly something wrong with them, but I believe that they present
some challenges to UX by eschewing the actual DOM for a virtual DOM
implementation. A lot of existing UX and UI libraries are dependent on DOM
manipulation like basically any CSS Framework, Any mobile gesture library,
drag-and-drop etc.

### Reliability:
This is a toss up. There's a lot of flexibility gained with the minimalist
approach, but it does mean that my app is forced to concern itself that aren't
strictly the app. Like what specific things are re-rendered on a state change
for a page.

The short version of this is, if I need to do something outside the norm I'm
positive the minimal app will easily accommodate, and be less messy than a more
intrinsically structured (or inherently restrictive, pick your wording) approach
à la React. However, I'm equally confident it will have to do it a lot more
often. So are cleaner, if more numerous oddities better than fewer, uglier
oddities? I'm still out on that one.

### Maintainability:
I did start running into some issues here. Overall, I think there's a pretty
good separation of concerns here. The structure isn't as obvious from the
outside, but I did have some good patterns starting to emerge. There are only 3
file (if I remember correctly) that include jQuery. Now that would probably grow
technically, because I would start breaking those files up into smaller pieces
and move them into their own module folders. So it might be more correct to say
there are only 3 places where jQuery *conceptually* exists. That is:
  - The entry point (`entry.js`)
  - The renderer (naturally, it's updating the DOM)
  - The events (they need to DOM to pull values from)


Judicious application of unique IDs has prevented a lot of the mind melting
jQuery calls that became synonymous with the library. So almost every call looks
like `$('#some-id').func()`. Also because looking up ID attributes is one of the
least expensive things to do, and doubles for being cleaner, I feel good about
that. However, I did begin to notice a breakdown.

There is a clear SRP violation in the renderer (`render.js`). The renderer
should only be updating based on the state of the application. This makes it one
of the few imperative parts of the application, and thus I try to keep any logic
out of it. Unfortunately, because of how Dragula works I needed to put logic in
there. Redux does keep the logic pretty tight, but it _is_ there. The renderer can
change because either:
  - A. There is a new part of a page to be made dynamic
  - B. Dragula fields need new `.on()` function calls.
These are unfortunately two completely different things. The best thing I can
think to do is put some the things it calls into events somewhere, but that
still feels a bit backwards.

**Update**: after writing out the part about the events, and re-examining the
files I feel less bad about this, not 100% but like 80% ...probably. They are
both imperative parts of the application. For some reason in my mind I thought
the events weren't imperative.

The *"components"*, such as they are, feel a bit error prone. They're just
template strings. They're way faster than I imagined they would be. Granted,
their errors are pretty immediately obvious, but having no syntax highlighting
for the layout (without lying to your editor and calling it an HTML file) will
almost certainly create a bug or two.

Ultimately, maintainability would hinge on a really tight application layout and
good documentation of the project to accompany it.

### Ability to Contribute:
Here I thought I would have a clear winner, but in the end I'm left uncertain.
The bonus this app has over others is that the libraries it uses are all either
very well known, well documented, or are very small with a tiny surface area to
have to understand. It's shortcoming is that all of them don't obviously line
up, and it leaves design decisions to be made. And these are decisions that
could not be learned anywhere but inside the project. While I have taken a heavy
amount of inspiration from Elm and React's architecture, the relation might not
be *as* obvious up front because this app uses a much lower level view
manipulation library than either of them. Both Elm and React/Redux are very high
level APIs for DOM manipulation. jQuery is much lower level, so there's a lot
more rendering logic to be hand written. Good docs can solve this, but this
point interests me because I expected this to be where I could say the Minimal
App had a solid lead. But I now struggle with the assertion. *Maybe* a bit
better, depending on personal outlook. But I can't say it's leaps and bounds
better.

### CSS Framework Interop:
This one was obvious, there's no virtual DOM trying to take the reigns, so any
CSS framework is free to use it's own JS to sprinkle the page with some
functionality.

### Routing:
I wasn't really sure how `page.js` would work out for me, but it was actually
really straightforward to setup. It *is* kind of fussy though. I don't really
think the `page()` call is very obvious, and there was a point where I screwed
up all of the routing because I removed it thinking it was something I
accidentally left there. If you try and navigate to a page that isn't the root
page before anything else, there just seems to be a 400 error. I'm not sure that
this is strictly something with page thought, because it could just as well be
the webkit dev server.

### Drag and Drop:
Once I got a handle on Dragula, this works really well. The animation is fluid,
and overall I think that the d-n-d in this app is a really nice UX. However,
*how* exactly Dragula works behind the scenes raised some issues for me.
see **Maintainability**

### Final thoughts:
Less positive than I thought I would be on this one. I went in hopeful but not
expecting, but I'm not sure how I came out. There are parts that I **really**
like how they look. And there are others I'm just... I dunno. Overall, I'd call
this a success. It doesn't show all of what I wanted it too just because I shied
away from too much logic around different models and just stuck to the parts I
knew would be relevant to this approach.

Things that felt good:
  - Event object system. Every event that happens in the system lives in one
    place.
  - Reducer. Every event handler is in one place. This combined with the event
    object list addresses the biggest issue with using jQuery, that by itself it
    easily creates spaghetti code.
  - Routing. It's a little touchy. But once it's set up it's a straightforward
    as it gets. When a given route is click, fire off a callback function.

Things that felt bad:
  - The "components". A bunch of template strings works when they're all small,
    but at some point bigger ones just necessarily come into play, and the fact
    that they are all just strings introduces maintenance issues. However, the
    fact that they're all just pure functions returning strings, *that* part is
    actually nice.
  - Manually handling the DOM. This wasn't all the time mind you, but there were
    certainly a few instances where I felt I'd rather not be. The drag-and-drop
    functionality being one of them. Though I feel like drag-and-drop is just
    necessarily messy business.

Overall, good but... I'm left without much of a feeling of triumph. There's just
something missing from this, and I can't put my finger on it.
