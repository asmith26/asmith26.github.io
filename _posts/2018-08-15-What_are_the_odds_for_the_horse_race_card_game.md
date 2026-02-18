---
title: "What are the odds for the horse race card game?"
date: 2018-08-15T15:44:34.062+0000
categories: [Mathematics,Probability]
tags: ["mathematics","probability","card-game"]
image:
  path: /assets/img/posts/2018-08-15-What_are_the_odds_for_the_horse_race_card_game/horse_race_card_game.jpeg
---

<!-- https://www.mathjax.org/ -->
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

## Please note: this post is still in the process of being migrated from medium.

My father challenged me to the following problem — what are the odds for each “horse” in the following game scenario:

**1.** The 4 aces (“horses”) are laid face-up at 1 end of the table.

**2.** 6 cards face-up are laid (“race track”) in a straight line perpendicular to the aces.

**3.** The race proceeds by flipping the remaining deck, & the ace matching that suit advances 1 step until a winner reaches the finish line (card 6).

[ **TL;DL** the probability of each horse winning is essentially governed by a [multinomial distribution](https://en.wikipedia.org/wiki/Multinomial_distribution), however we must take into consideration that the probabilities of flipped cards change (since the probability of future flips depends on what has already been flipped). ]

Here is a solution that describes:
1. Firstly how to calculate the number of sequences that are possible from each (winning) combination of cards.
2. Using these counts for the number of sequences, we compute the probability of observing such a combination of cards based on the remaining cards in the (unflipped) deck.
3. Finally we sum these individual probabilities of each combination to establish the overall probability each horse winning, before converting them into betting odds.


**Initial Remarks:**
- The more cards of a particular suit showing on the track, the less likely that suit will be flipped within the remaining deck and so the less likely that suit will win (i.e. higher odds. )
- There are $$52 - (4\mbox{ aces} + 6\mbox{ racetrack cards} ) = 42$$ cards remaining in the pack.


**Step1: Calculating the number of sequences that are possible from each (winning) combination of cards.**

First consider the case for the heart horse to win. Let the sequence of flipped cards be denoted by $$H:=\mbox{“Heart card”}$$, $$C:=\mbox{“Club card”}$$, $$D:=\mbox{“Diamond card”}$$ and $$S:=\mbox{“Spade card”}$$.

For hearts to win, we require a combination of $$6H$$’s with at most $$5C$$’s, $$5D$$’s and $$5S$$’s to occur. Each such combination can arise from various sequences of flipped cards.

We can count how many sequences arise from a particular combination of cards in the following way; **note the last card of the sequence MUST always be a H for the heart horse to win** (as the game finishes when we have a winner), thus in our dicussion of sequences below we omit this 6th H and only refer to the 5 other flipped H’s (e.g. the first sequence, 5H’s, refer to winning sequence \left\{HHHHH} + \left\{H} )
1. **5H’s** (and no $$C$$’s, $$D$$’s or $$S$$’s flipped), i.e. $$\left\{HHHHH\right\}$$. Note there is only **1 way** for this combination of cards (in particular the order of the H’s do not matter as each H has the same effect of advancing the heart horse by one step). 
Although we can simply count the number of possible sequences for this particular combination of cards, as the combinations of cards increases and becomes more complicated, we can use the following equation to calculate this:
2. $$\left\{n\choose r}:=\frac{n!}{r!(n-r)!}=$$ _”The number of ways for positioning_ $$r$$ _cards within a total of_ $$n$$ _cards (where order doesn’t matter)”_
3. Indeed, for the combination of 5Hs, the number of ways for positioning the r=5 **H cards** within the total of n=5 cards (which in this case are just the same 5H’s) is \left\{5\choose 5}=\frac{5!}{5!(5–5)!}= **1 way**.
4. **1S, 5H’s**, i.e. \left\{SHHHHH, HSHHHH, HHSHHH, HHHSHH, HHHHSH, HHHHHS}= **6 ways**. Again, we can confirm this using the equation above; note here we must also consider the positioning of the 1S:

- The number of ways for positioning the $$r=5$$ **H cards** within the total of n=6 cards (i.e. the 5H’s and the 1S) is \left\{6\choose 5}=\frac{6!}{5!(6–5)!}= **_6_ ways**.
- The number of ways for positioning the $$r=1$$ **S card** within the **remaining** n=1 card is \left\{1\choose 1}= 1 **way**.
- Note n=1 now as we have fixed 5 positions for the 5H’s, and so there is only one remaining spot available for the 1S which it is **forced** to be positioned at.
(E.g. if we fix the positions for the 5H’s to be the **first 5 places**, \left\{ **HHHHH** _ }, then the 1S is **forced** **to the** **6th position**, \left\{HHHHH **S** } )
- Thus, overall there are 6\times 1= **6 ways** for positioning the 5H’s and 1S.

1. **2S’s, 5H’s**, i.e. $$\left\{SSHHHHH, SHSHHHH, SHHSHHH, …, HHHHHSS} = \left\{7\choose 5} \times\left\{2\choose 2}=21\times 1=$$ **21 ways** following the same logic as above.
2. …
3. **5S’s, 5H’s**, i.e. $$\left\{SSSSSHHHHH, SSSSHSHHHH, SSSHHSSHHH, …, HHHHHSSSSS}=\left\{10\choose 5} \times\left\{5\choose 5}=252\times 1=$$ **252ways**.
4. **1C, 1S, 5H’s**, i.e. $$\left\{CSHHHHH, CHSHHHH, CHHSHHH, CHHHSHH, CHHHHSH, CHHHHHS, SCHHHHH, …, HHHHHSC}= \left\{7\choose 5} \times\left\{2\choose 1} \times\left\{1\choose 1}=21\times 2\times 1=$$ **42 ways**.
5. …
6. **5S’s, 5D’s, 5C’s, 5H’s**, which has \left\{20\choose 5} \times\left\{15\choose 5} \times\left\{10\choose 5} \times\left\{5\choose 5} possible sequences.


Recall, we stop at this combination of cards since if we have more than 6 cards for any suit other than H, the race would have already ended with a (non-heart) winner.

Following this logic, we see that the number of sequences given **any** combination of cards can be computed as follows (let n_H, n_C, n_D, n_S **denote the _number_ of flipped H,C,D,S** respectively):
- Thre are \left\{n_H+n_C+n_D+n_S\choose n_H} possible positions for the n_H Heart cards.
- Then once the n_H H’s have been positioned, there remains \left\{n_C+n_D+n_S\choose n_C} possible positions for the n_C C’s.
- Likewise \left\{n_D+n_S\choose n_D} and \left\{n_S\choose n_S} possible positions for the remaining n_D D’s and n_S S’s respectively.
- Consequently, the number of sequences for a combination of n_H H’s, n_C C’s, n_D D’s, n_S S’s is:
- \left\{n_H+n_C+n_D+n_S\choose n_H} \times\left\{n_C+n_D+n_S\choose n_C} \times\left\{n_D+n_S\choose n_D} \times\left\{n_S\choose n_S}


[We can simplify this further by expanding the equations and cancelling common terms in the numerator and denominator (an exercise left for the reader), to obtain \frac{(n_H+n_C+n_D+n_S)!}{n_H!n_C!n_D!n_S!} ]

**Step2: Using these counts for the number of sequences, we compute the probability of observing such a combination of cards.**

Let:
- r_H denote the number of remaining H cards.
- n_H denote the number of flipped H (as before)


and recall initially there are 42 cards remaining in the pack, then for e.g. the combination of 6H’s (note we **include the 6th H** in the probability calculations as they **do depend** on how likely this last H is flipped):

$$\begin{eqnarray*} \mbox{prob(\left\{HHHHHH})} & = & \mbox{prob(“Observing a combination of 6H’s (any order)”) } \times\mbox{ (the number of possible sequences 6H’s) }   & = & \frac{r_{H}}{42} \times\frac{r_{H} -1}{42–1} \times\frac{r_{H} -1–1}{42–1–1} \times\frac{r_{H} -1–1–1}{42–1–1–1} \times\frac{r_{H} -1–1–1–1}{42–1–1–1–1} \times\frac{r_ \left\{H} -1–1–1–1–1} \left\{42–1–1–1–1–1} \times1\end{eqnarray*}$$

Recall “(the number of possible sequences 6 H’s”) was found in step1, and was equal to 1 in the case of 6H’s (i.e. 5H’s and the fixed last one). Note the “minus 1's” represent each “flip” as there is no replacement on flipping each card.

We can tidy this up by using the notation P(r,n):=\frac{r! } \left\{ (r-n) ! } (also known as the [permutation](https://en.wikipedia.org/wiki/Permutation) ) so that:

\mbox{prob} ( \left\{HHHHHH} )=\frac{r_H} \left\{42} \times\frac{ \frac{r_H! } \left\{ (r_H-n_H) ! } } \left\{ \frac{42! } \left\{ (42-n_H) ! } }=\frac{P(r_H,n_H) } \left\{P(42,n_H) }

Now letting:
- r_C, r_D, r_S denote the **number of** **remaining** C, D and S cards, respectively.
- n_C, n_D, n_S, denote the **number of** **flipped** C, D and S, respectively.
- n_ \left\{Flip}:=n_H+n_C+n_D+n_S=\mbox{“Total number of cards flipped”} ):


and following logic as above for computing the probability of the combination \left\{HHHHHH}, we see that the probability for observing any combination of cards is:

\frac{P(r_H,n_H) \times P(r_C,n_C) \times P(r_D,n_D) \times P(r_S,n_S) } \left\{P(42,n_ \left\{Flip} ) } \times( \mbox{the number of possible sequences of n_H H’s, n_C C’S, n_D D’s, n_S S’s} )

where the last term was computed in step 1. (This formula is similar to the probability mass function of a [binomial random variable](https://en.wikipedia.org/wiki/Binomial_distribution#Probability_mass_function). )

**Step3: Summing these individual probabilities to establish the overall probability for the horse winning, and conversion to odds**

Since each combination of cards is independent of another, we can sum the probabilities of all winning combinations for each suit to obtain the overall probability of each horse winning.

We can now use these probabilities and the following formula to convert them to odds (of the form numerator:denominator “against”; i.e. we expect the horse will lose numerator \times for every denominator \times it wins):

odds=\frac{1-prob} \left\{prob}

**Code:**

Here is some python code that follows this solution (and hence has not be optimised by e.g. vectorising loops). The functions:
- `\choose` computes our equation \left\{n\choose r}:=\frac{n! } \left\{n! (n-r) ! } (also known as the [combination](https://en.wikipedia.org/wiki/Combination) )
- `perm` computes the permutation equation P(r,n):=\frac{r! } \left\{ (r-n) ! }
- `prob_win` computes the probability of horse X in the set \left\{H,C,D,S} winning.


(Full code and instructions available at [GitHub](https://github.com/asmith26/horserace-card-game).)
```

def comb(n, r):
    """ Return the combination of n and r (i.e. the number of ways for positioning r cards within a total of
    n cards (where order doesn't matter). """
    f = math.factorial
    return f(n) / (f(r) * f(n-r))

def perm(n, r):
    """ Return the permutation of n and r (i.e. the number of ways for positioning r cards within a total of
    n cards (where order does matter)). """
    f = math.factorial
    return f(n) / f(n-r)

def prob_win(N, X, rX, rY1, rY2, rY3):
    """ Let X be in \left\{H,C,D,S} be the horse to win and Y1,Y2,Y3 be in \left\{H,C,D,S}\\left\{X} be the losing horses.
    Return the probability that horse X wins the race.
    N:='number remaining cards (i.e. 42 in usual play)', rX:='number remaining cards for winning suit',
    rY1:='number remaining cards of first suit not to win', rY2:='number remaining cards of second suit
    not to win', rY3:='number remaining cards of third suit not to win' """

    nX = 6     # number of X flipped during race (for X to win)
    sum_probX = 0 # initial the sum representing the overall probability for X winning

    nY1 = 0    # number of Y1 flipped during the race (must be less than 6)
    while nY1 < 6:
        nY2 = 0
        while nY2 < 6:
            nY3 = 0
            while nY3 < 6:
                nFlip = nX+nY1+nY2+nY3 # total number of cards flipped
                nPos = nFlip-1         # total number of available positions for flipped cards (-1, noting that that last card must be X for X to win)

                # number of sequences for a combination of 5 X, nY1 Y1, nY2 Y2 and nY3 Y3
                nWays = comb(nPos,5) * comb(nPos-5,nY1) * comb(nPos-5-nY1,nY2) * comb(nPos-5-nY1-nY2,nY3)
#                print "Number of ways for choosing nX=\left\{0}, nY1=\left\{1}, nY2=\left\{2}, nY3=\left\{3} is: \left\{4}".format(nX,nY1,nY2,nY3,nWays)

                # probability of observing nX X, nY1 Y1, nY2 Y2 and nY3 Y3 (any order)
                prob_cards = Decimal( perm(rX,nX) * perm(rY1,nY1) * perm(rY2,nY2) * perm(rY3,nY3) ) / Decimal( perm(N,nFlip) )
#                print "prob_cards is: \left\{0}".format(prob_cards)
          
                # probability of X win given a combination of nX X, nY1 Y1, nY2 Y2 and nY3 Y3 (compare with binomial random variables)
                probX = nWays * prob_cards

                sum_probX += probX

                nY3 += 1
            nY2 += 1
        nY1 += 1

    return sum_probX

def prob2odds(p):
    """ Return the odds for a given probability p """
    # Note: in the case of the usual game, we do not have to handle impossible events (e.g if a horse cannot win), and so this equation will never result in
    #       divion by zero.
    return (1-p) / p
```
