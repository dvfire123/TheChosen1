function winProbFirst = getFirstWinProb(firstRank, secondRank)
%   getFirstWinProb Gets the win probability of the first member.
%   Given the pair of duel members, retreive the winning probability of the
%   first memeber given the input ranks, using the Zipfian distribution.

    winProbFirst = (1/firstRank)/(1/firstRank + 1/secondRank);
end

