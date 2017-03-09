function search_neural_network(net, feature)
    y = sim(net, feature);
    [c i] = max(y);
    c
    i
    %letter = search(i);
end

% function l = search(i)
%     alphabet = ['A', 'B', 'C', 'D', 'E', 'F' , 'G', 'H', 'I', ...
%         'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', ...
%         'U', 'V', 'W', 'X', 'Y', 'Z'];
%     l = alphabet(i);
% end