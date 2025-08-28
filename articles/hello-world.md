---
title: Hello World
date: 2025/08/28
synopsis:
  A fun article about a riddle I liked, with solution.
tags: [prisoner, switch]
---

## The riddle

I found this riddle [here](https://www.tcm.phy.cam.ac.uk/~sea31/puzzle.html),
which is a nice site containing lots of fun riddles. This article will go over
problem 2, which in case that link breaks, is included below.

> 24 convicts are being transported together to a special prison, in which they
> will spend the rest of their life, each in solitary confinement. However they
> know that they have one last chance of securing freedom if they solve the
> following puzzle: At random intervals (on average much shorter than the
> prisoner's lifespan!), a randomly selected prisoner will be led to a room which
> is completely bare and only contains two switches with two positions each. On
> every visit exactly one of the switches must be switched exactly once but the
> visiting prisoner is free to choose which one he wants to switch. When a
> prisoner can tell that all prisoners have been in this room at least once, all
> are set free. What strategy should they agree on before being separated upon
> arrival at the prison?

## An aside about this page/blog

Feel free to give this riddle a try. I did not invent this riddle, nor do I know
anything fundamental about this kind of problem that would allow me to provide
some generalizible mathematical explanation. I just though of a solution and
wanted to add collapsible hint and solution sections to articles in YOCaml
without any JavaScript.

As it turns out, including a `<details>` tag in Markdown does this automatically.
So much for my side quest. All the below section took was this snippet of code.

```html
<details>
    <summary>Collapse / Expand</summary>
    Foo bar
</details>
```

### A simple collapsible section

<details>
    <summary>Collapse / Expand</summary>
    Foo bar
</details>

## Hints

If you are stuck on this riddle, here are some hints.

<details>
    <summary>Hint #1</summary>
    It might be useful to thing of the state of the switches as four nodes connected in a square,
    like this.

    A ---- B
    |      |
    |      |
    D ---- C
</details>

<details>
    <summary>Hint #2</summary>
    A prisoner must be able to tell that all prisoners have been in this room at least once.
    It does not specify how many must be able to tell.
</details>

<details>
    <summary>Hint #3</summary>
    The solution will work for an arbitrary number of prisoners. The number 24 is a red herring.
</details>

## Solution

[Here](https://www.tcm.phy.cam.ac.uk/~sea31/sol2.htm) is OP's solution, included below in case of broken links.

<details>
    <summary>OP's Solution</summary>
    Call the switches A and B (where the prisoners agree a way of distinguishing the switches unambiguously). One particular prisoner is designated to operate as follows: Every time he finds the A switch in the 'down' position he switches it 'up' and counts these occurrences. If he finds it in the 'up' position, he switches the B switch (regardless of its position). All others operate on the switches as follows: If they find switch A in the 'up' position, they switch it to 'down'. However, if they have already operated on switch A twice before in this manner, or if they find it 'down', they switch the other switch, B once (regardless of its position). When the one designated prisoner operating only on switch A has counted 47 occurrences of switch A being in the down position he knows that all have been in the room at least once.
</details>

<details>
    <summary>My Solution</summary>

    A ---- B
    |      |
    |      |
    D ---- C

    We can imagine the switches as this graph. It has four distinct states, and only allows accessing two other states from a given state.
    For this explanation, let A and B may be called the top positions, and C and D may be called the bottom positions.

    The strategy they agree on is to designate one prisoner as the "counter" and all other prisoners as the "others". Here are the rules they specify:
    - if the counter finds the state in the bottom positions, keep the state in the bottom positions (by performing either C -> D or D -> C).
    - if an other find the state in the top positions, keep the state in the top positions (by performing either A -> B or B -> A).
    - if the counter finds the state in the top positions, move the state to the bottom positions (by performing either A -> D or B -> C)
    - if the other finds the state in the bottom positions:
      - if they have _never_ before moved the state to the top positions, move the state to the top positions (by performing either D -> A or C -> D).
      - if they _have_ moved the state to the top positions, keep the state in the bottom positions (by performing either C -> D or D -> C).


  The intuition here is that only an "other" who has never done so before may move the switch from the bottom to the top position, so each time the counter sees the state in the top position, he's certain a new unique person has entered the room.

  This assumes the switches start in the bottom positions. I'll think more about what it looks like for arbitrary start positions.

</details>
