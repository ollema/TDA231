function [idx, D, d] = kmeansWrapper(wordemb, k, depth)
    lastwarn('');
    id = 'stats:kmeans:FailedToConverge';
    warning('off', id)
    [idx, ~, ~, D] = kmeans(wordemb, k, 'Replicates', 1);
    [~, msgid] = lastwarn;
    
    if numel(msgid) > 0
        [idx, D, depth] = kmeansWrapper(wordemb, k, depth + 1);
    end
    d = depth;
end