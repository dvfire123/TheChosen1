function winner = getWinningPlayer(N)
    %getWinningPlayer Returns the index of the sole survivor
    %   Given the number of participants N, returns the winning player assuming
    %   the list is ranked from 1 to N.  Duel winning probability using the
    %   Zipfian distribution.
    % Create N participants
    participants = ones(N, 1); % One = alive; Zero = dead;

    liveList = find(participants == 1);

    while length(liveList) > 1
        % Still people alive, we start picking pairs to eliminate
        firstIdx = randi(length(liveList));
        secondIdx = randi(length(liveList));
        while secondIdx == firstIdx
             % Looks hacky, but will still be fairly quick if the population is
             % low
             secondIdx = randi(length(liveList));
        end

        % Now duel!
        firstWinProb = getFirstWinProb(firstIdx, secondIdx);
        randVal = rand();
        if randVal < firstWinProb
            % First player wins
            % Eliminate the second player
            elimIdx = liveList(secondIdx);
        else
            % Vice-versa
            elimIdx = liveList(firstIdx);
        end

        % Update live list
        participants(elimIdx) = 0;
        liveList = find(participants == 1);
    end
    
    winner = liveList(1);
end

